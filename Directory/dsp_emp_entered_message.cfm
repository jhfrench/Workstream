
<!--Directory/dsp_emp_entered_message.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display a message instructing the user on what to do after a workstream account is created.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="get_administrators" datasource="#application.datasources.main#">
SELECT Demographics.first_name, Demographics.last_name, Demographics.email_address
FROM Demographics
	INNER JOIN Access_User_Business_Function ON Demographics.user_account_id=Access_User_Business_Function.user_account_id
		AND Access_User_Business_Function.active_ind=1
		AND Access_User_Business_Function.business_function_id=250 /*Administer User Access*/
	INNER JOIN Link_Company_Emp_Contact ON Demographics.user_account_id=Link_Company_Emp_Contact.emp_id
		AND Link_Company_Emp_Contact.company_id=#session.workstream_company_id#
WHERE Demographics.active_ind=1
ORDER BY Demographics.last_name, Demographics.first_name
</cfquery>
<cfset variables.administrators_list=valuelist(get_administrators.emp_id)>
</cfsilent>
<cfoutput>
<div class="alert">
	<p>#attributes.name# #attributes.lname# has been entered into the workstream database.</p>
	<p>This new account currently does not have access to any modules, reports or tools. To administer this new account (grant access to reports, change passwords, etc), please 
	<cfif ListFind(variables.administrators_list, variables.user_identification)>
		<a href="javascript:edit_employee(#variables.emp_id#)">administer this account</a>.
	<cfelse>
		contact the following #application.product_name# administrators to set up the appropriate access:<br />
		<ul type="square">
			<cfloop query="get_administrators">
			<li><a href="mailto:#email_address#">#last_name#, #first_name#</a></li>
			</cfloop>
		</ul>
	</cfif>
	</p>
</div>
</cfoutput>