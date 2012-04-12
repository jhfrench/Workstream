
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
SELECT Emp_Contact.name, Emp_Contact.lname, Emp_Contact.emp_id, Email.email
FROM Link_Company_Emp_Contact, Security_Object_Access, Emp_Contact, Email
WHERE Link_Company_Emp_Contact.emp_id=Security_Object_Access.emp_id
	AND Link_Company_Emp_Contact.emp_id=Emp_Contact.emp_id
	AND Emp_Contact.emp_id=Email.emp_id
	AND Link_Company_Emp_Contact.company_id=#session.workstream_company_id#
	AND Security_Object_Access.object_id=41<!--- $issue$: this needs to be altered to use new security/navigation model --->
	AND Security_Object_Access.active_ind=1
	AND Email.email_type_id=1
ORDER BY Emp_Contact.lname, Emp_Contact.name, Emp_Contact.emp_id
</cfquery>
<cfset variables.administrators_list=valuelist(get_administrators.emp_id)>
</cfsilent>
<cfoutput>
	<tr>
		<td class="RegText">
			#attributes.name# #attributes.lname# has been entered into the workstream database. This new account currently does not have access to any modules, reports or tools. To administer this new account (grant access to reports, change passwords, etc), please 
</cfoutput>
<cfif ListFind(variables.administrators_list, session.user_account_id)>
	<cfoutput><a href="javascript:edit_employee(#variables.emp_id#)" class="RegText">administer this account</a>.</cfoutput>
<cfelse>contact the following workstream administrators to set up the appropriate access:<br />
<ul type="square" class="RegText">
<cfoutput query="get_administrators">
<li class="RegText"><a href="mailto:#email#" class="RegText">#lname#, #name#</a></li>
</cfoutput>
</ul>
</cfif>
		</td>
	</tr>
