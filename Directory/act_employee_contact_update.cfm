
<!-- Directory/act_employee_contact_update.cfm
	Author: Victor B-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I update the employee contact information submitted from the form.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:

	END FUSEDOC --->

</cfsilent>


<cfif len(attributes.user_account_id)>
	<cfoutput>
	<CFTRANSACTION>
		<!--- //////////////////////////        Phone and extensions delete        \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ --->

		 <cfloop index="ii" list="#attributes.phone_id#" delimiters=",">
			<cfquery name="phone_delete" datasource="#application.datasources.main#">
				DELETE FROM PHONE
				WHERE user_account_id=#attributes.user_account_id#
					AND
				Phone_id=#ii#
			</cfquery>
		</cfloop> 

		<!--- //////////////////////////        Phone and extensions inserts         \\\\\\\\\\\\\\\\\\\\\\\\\\\\\ --->

		<cfloop index="ii" list="#attributes.phone_type_id#">
			<cfif len(evaluate("attributes.phone_number_#ii#"))>
				<cfquery name="Phone_insert" datasource="#application.datasources.main#">
					<cfif isdefined("attributes.extension_#ii#") and len(evaluate("attributes.extension_#ii#"))>
					<cfset attributes.extension=evaluate("attributes.extension_#ii#")>
						INSERT INTO Phone(user_account_id,phone_number,extension,phone_type_id)
						VALUES(#attributes.user_account_id#,'#evaluate("attributes.phone_number_#ii#")#','#attributes.extension#', #ii#)
					<cfelse>
						INSERT INTO Phone(user_account_id,phone_number,phone_type_id)
						VALUES(#attributes.user_account_id#,'#evaluate("attributes.phone_number_#ii#")#', #ii#)
					</cfif>
				</cfquery>
			</cfif>
		</cfloop>

		<!--- //////////////////////////////////        emails delete        \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ --->

		 <cfloop index="ii" list="#attributes.email_id#" delimiters=",">
			<cfquery name="delete_email" datasource="#application.datasources.main#">
				DELETE FROM EMAIL
				WHERE user_account_id=#attributes.user_account_id#
					AND email_id=#ii#
			</cfquery>
		</cfloop> 

		<!--- ///////////////////////////////////        Emails inserts       \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ --->

		<cfloop index="ii" list="#attributes.email_type_id#">
			<cfif len(evaluate("attributes.email_#ii#"))>
				<cfquery name="email_insert" datasource="#application.datasources.main#">
					INSERT INTO EMAIL(user_account_id,email,email_type_id)
					VALUES(#attributes.user_account_id#,'#evaluate("attributes.email_#ii#")#', #ii#)
				</cfquery>
			</cfif>
		</cfloop>


	<!--- //////////////////////////////////        Location delete        \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ --->

		<cfloop index="ii" list="#attributes.location_id#" delimiters=",">
			<cfquery name="location_delete" datasource="#application.datasources.main#">
				DELETE FROM LOCATION
				WHERE user_account_id=#attributes.user_account_id#
					AND
				location_id=#ii#
			</cfquery>
		</cfloop>

	<!--- /////////////////////////////////       Location insert       \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ --->

		<cfloop index="ii" list="#attributes.location_type_id#">
			<cfif len(evaluate("attributes.address1_#ii#"))>

				<cfif len(evaluate("attributes.address2_#ii#"))>
					<cfset attributes.address2=evaluate("attributes.address2_#ii#")>
				</cfif>

				<cfif len(evaluate("attributes.city_#ii#"))>
					<cfset attributes.city=evaluate("attributes.city_#ii#")>
				</cfif>

				<cfif len(evaluate("attributes.state_#ii#"))>
					<cfset attributes.state=evaluate("attributes.state_#ii#")>
				</cfif>

				<cfif len(evaluate("attributes.zip_#ii#"))>
					<cfset attributes.zip=evaluate("attributes.zip_#ii#")>
				</cfif>

				<cfquery name="location_insert" datasource="#application.datasources.main#">
						INSERT INTO LOCATION(user_account_id,address1,address2,city, state,zip, location_type_id)
						VALUES(#attributes.user_account_id#,'#evaluate("attributes.address1_#ii#")#','#evaluate("attributes.address2_#ii#")#', '#evaluate("attributes.city_#ii#")#', '#evaluate("attributes.state_#ii#")#', '#evaluate("attributes.zip_#ii#")#', #ii#)
				</cfquery>

			</cfif>
		</cfloop>

		<!--- /////////////////////////////       Biography delete &  insert       \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ --->


			<cfif len(attributes.biography)>
				<cfif len(emp_biography_id)>
					<cfquery name="biography_delete" datasource="#application.datasources.main#">
						DELETE FROM EMP_BIOGRAPHY
						WHERE user_account_id=#attributes.user_account_id#
							AND
						emp_biography_id=#attributes.emp_biography_id#
					</cfquery>
			</cfif>
				<cfquery name="biography_insert" datasource="#application.datasources.main#">
					INSERT INTO EMP_BIOGRAPHY(user_account_id,biography)
					VALUES(#attributes.user_account_id#,'#attributes.biography#')
				</cfquery>
			</cfif>



	</CFTRANSACTION>
		<form action="index.cfm?fuseaction=Directory.employee_details" method="post" name="forward_form">
			<input type="hidden" name="user_account_id" value="#attributes.user_account_id#">
		</form>
		<cf_htmlhead>
	<script language="JavaScript" type="text/javascript">
			function forward_form(){ 
				document.forward_form.submit();
			}
		</script>
	</cf_htmlhead>
		<body onload="javascript:forward_form()">
	</cfoutput>
</cfif>
