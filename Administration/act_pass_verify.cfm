
<!--admin/act_pass_verify.cfm
	Author: Victor B -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: Page allows user to reset their password after verifying their current password.
	||
	Name: Victor Blell
	||
	Edits:
	$Log$
	||
	--> attributes.new_pass: string returned from sbmitting form
	--> attributes.conf_pass: string returned from sbmitting form
	++> session.user_account_id: number associated with a particular user
	END FUSEDOC --->
	<cfset variables.redirect_action="wrong_pass&msg=0">
</cfsilent>

<!--- set re-direction fuseaction based on current action:
	we are either in a 'force the user to reset' situation, in which case current promis
	action will be pass_verify_ex, or we are in a normal 'user resetting password'
	situation, in which case action will be pass_verify --->


<!--- check that confirm password is correct, if so continue else kick them back  --->
<cfif Get_Current_Password.recordcount GT 0 AND NOT compare(Get_Current_Password.Password, variables.current_pass)>
	<!--- match --->
<cfelse>
	 <cflocation url="index.cfm?fuseaction=wrong_pass&msg=1"
	 		addtoken="no">
</cfif>

<!--- BEGIN verification checks --->
<!--- 1) is new password as long as minimum required length (application.password_length)? --->
<cfif len(attributes.new_pass) LT application.password_length>
	<!--- fails conditional, so send them back --->
	<cflocation url="index.cfm?fuseaction=wrong_pass&msg=2"
				addtoken="no"> 
</cfif>

<!--- 2) is new password same as the confirmation password? --->
<cfif ((len(attributes.new_pass) and len(attributes.confirm_pass)) AND NOT compare(attributes.new_pass, attributes.confirm_pass))>
	<!--- match --->
<cfelse>
	<!--- fails conditional, so send them back --->
	<cflocation url="index.cfm?fuseaction=wrong_pass&msg=7"
				addtoken="no"> 
</cfif>



<!---------------------------------------------------------------------------------
REGULAR EXPRESSION CODE GOES HERE
------------------------------------------------------------------------------------>
<!--- 3) does new password meet requirements based on application.password_text_requirements_id? --->
<cfinclude template="act_check_password.cfm">


<!--- 4) if application.password_history gt 0, then query security_old_passwords and check through
last application.password_history number of passwords to make sure new one doesn't match any of them --->
<cfif application.password_history gt 0>
	
	<!-- query db --->
	<cfinclude template="qry_get_security_old_passwords.cfm">
	
		<!--- see if there were any old password that match --->
		<cfif get_security_old_passwords.recordcount neq 0>
			<!--- fails conditional, so send them back --->
			<cflocation url="index.cfm?fuseaction=wrong_pass&msg=6"
						addtoken="no">
		</cfif>


</cfif>
<!---- END verification checks ------------------->


<!---------------------------------------------------------------------------
database updates:
	security_passwords_old (if necessary insert newest and delete oldest over limit),
	create last_password_date
	update security with password and last_password_date
---------------------------------------------------------------------------->
<cftransaction isolation="READ_COMMITTED">

<!--- if company uses password history, save the latest one, then check to see if we
are storing more than required and, if so, delete the oldest one --->
	<cfif application.password_history gt 0>
		
		<!--- insert new one --->
		<cfquery name="insert_new_password" datasource="#application.datasources.main#">
			INSERT INTO security_old_passwords(emp_id,password,date_created)
			values('#session.user_account_id#','#variables.new_pass#',#createodbcdate(now())#)
		</cfquery> 
		
		<!--- check if we are over necessary history, then delete last if needed --->
		<cfquery name="get_password_history" datasource="#application.datasources.main#">
			select count(*) as old_passwords
			from security_old_passwords
			where emp_id = '#session.user_account_id#'
		</cfquery>
		
		<!--- delete oldest --->
		<cfif get_password_history.old_passwords GT application.password_history>
			<cfquery name="delete_oldest_password" datasource="#application.datasources.main#">
				delete from security_old_passwords
				where date_created = (select min(date_created) 
										from security_old_passwords 
										where emp_id = '#session.user_account_id#')
				and emp_id = '#session.user_account_id#'
			</cfquery>
		</cfif>
	</cfif>
	
	<!---- create last_password_date ONLY if
		company settings require password_expiration Check--->
	<cfif application.password_expiration_in_days gt 0>
		<cfset last_password_date = createodbcdate(now())>
		<cfset last_password_date = dateadd('d',application.password_expiration_in_days,last_password_date)>
		
		<!--- NEED TO UPDATE session.workstream_LAST_PASSWORD_DATE HERE TO AVOID NEVER-ENDING LOOP --->
		<cfset session.workstream_last_password_date = last_password_date>	
	</cfif>
	
	<!--- if password expires as soon as they log in then application.cfm is going to check 
			the security table. If its empty, then user can continue. if not user will be stucked so clear the last password date and session.workstream_last_password_date  --->
	<cfif application.temp_password_exps gt 0 AND application.password_expiration_in_days EQ 0>
		<cfset last_password_date = "">
		<cfset session.workstream_last_password_date = "">	
	</cfif>
	
	
	<!--- update fields in security table (UPDATE last_password_date ONLY if
		company settings require password_expiration Check --->
	<cfquery NAME="set new password" datasource="#application.datasources.main#">
		UPDATE Security
		SET password =  '#variables.new_pass#'
		<cfif isdefined("last_password_date")>
			,last_password_date =<cfif len(last_password_date)>#CreateODBCDate(last_password_date)#<cfelse>NULL</cfif>
		</cfif>
		WHERE Emp_ID = '#session.user_account_id#'
	</cfquery>

</cftransaction>

<!--- SUCCESS! relocate to password success action--->
<cflocation url="index.cfm?fuseaction=password_success"
		addtoken="no">

