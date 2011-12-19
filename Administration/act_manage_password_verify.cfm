
<!--admin/act_manage_password_verify.cfm
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
	Revision 1.1  2006/09/15 22:24:24  csy
	<>

	Revision 1.0  2006-08-16 09:31:57-04  csy
	Initial revision

	Revision 1.0  2005-02-15 15:27:19-05  daugherty
	Initial revision

	Revision 1.1  2003-04-17 16:19:23-04  blell
	check if password needs to change

	Revision 1.0  2003-04-15 10:12:34-04  blell
	initial creation.

	||
	--> attributes.new_pass: string returned from sbmitting form
	--> attributes.conf_pass: string returned from sbmitting form
	++> session.user_account_id: number associated with a particular user
	END FUSEDOC --->
	<cfset variables.redirect_action="edit_account&emp_id=#attributes.emp_id#&msg=0">
</cfsilent>


<!--- BEGIN verification checks --->

<cfif variables.password_change>


<!--- 1) is new password as long as minimum required length (application.password_length)? --->
<cfif len(attributes.new_pass) LT application.password_length>
	<!--- fails conditional, so send them back --->
	<cflocation url="index.cfm?fuseaction=edit_account&emp_id=#attributes.emp_id#&msg=2"
				addtoken="no"> 
</cfif>

<!---------------------------------------------------------------------------------
REGULAR EXPRESSION CODE GOES HERE
------------------------------------------------------------------------------------>
<!--- 2) does new password meet requirements based on application.password_text_requirements_id? --->
<cfinclude template="act_check_password.cfm">


<!--- 3) if application.password_history gt 0, then query security_old_passwords and check through
last application.password_history number of passwords to make sure new one doesn't match any of them --->
<cfif application.password_history gt 0>
	
	<!-- query db for  history --->
	<cfinclude template="qry_get_security_old_passwords.cfm">
	
		<!--- see if there were any old password that match --->
		<cfif get_security_old_passwords.recordcount neq 0>
			<!--- fails conditional, so send them back --->
			<cflocation url="index.cfm?fuseaction=edit_account&emp_id=#attributes.emp_id#&msg=10"
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
			values('#attributes.emp_id#','#variables.new_pass#',#createodbcdate(now())#)
		</cfquery> 
		
		<!--- check if we are over necessary history, then delete last if needed --->
		<cfquery name="get_password_history" datasource="#application.datasources.main#">
			select count(*) as old_passwords
			from security_old_passwords
			where emp_id = '#attributes.emp_id#'
		</cfquery>
		
		<!--- delete oldest --->
		<cfif get_password_history.old_passwords GT application.password_history>
			<cfquery name="delete_oldest_password" datasource="#application.datasources.main#">
				delete from security_old_passwords
				where date_created = (select min(date_created) 
										from security_old_passwords 
										where emp_id = '#attributes.emp_id#')
				and emp_id = '#attributes.emp_id#'
			</cfquery>
		</cfif>
	</cfif>
	
	<!---- create last_password_date ONLY if
		company settings require password_expiration Check--->
	<cfif application.password_expiration_in_days gt 0>
		<cfset last_password_date = createodbcdate(now())>
		<cfset last_password_date = dateadd('d',application.password_expiration_in_days,last_password_date)>
	</cfif>

</cftransaction>
</cfif>

 <!--- <cfoutput>
	#variables.new_pass#<br>
	#attributes.new_pass#
</cfoutput>

<cfabort> --->

