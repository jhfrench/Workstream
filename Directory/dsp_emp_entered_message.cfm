
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
	Revision 1.0  2005/02/15 20:46:35  daugherty
	Initial revision

	Revision 1.0  2001-10-16 17:05:45-04  french
	Initial revision

	||
	END FUSEDOC --->
<cfquery name="get_administrators" datasource="#application.datasources.main#">
SELECT Emp_Contact.name, Emp_Contact.lname, Emp_Contact.emp_id, Email.email
FROM Company, Security_Object_Access, Emp_Contact, Email
WHERE Company.Emp_ID=Security_Object_Access.emp_id
	AND Company.emp_id=Emp_Contact.emp_id
	AND Emp_Contact.emp_id=Email.emp_id
	AND Company.company=#session.workstream_company_id#
	AND Security_Object_Access.object_id=41
	AND Security_Object_Access.active_ind=1
	AND Email.email_type_id=1
ORDER BY Emp_Contact.lname, Emp_Contact.name, Emp_Contact.emp_id
</cfquery>
<cfset variables.administrators_list=valuelist(get_administrators.emp_id)>
</cfsilent>
<cfoutput>
	<tr>
		<td class="RegText#session.workstream_text_size#">
			#attributes.name# #attributes.lname# has been entered into the workstream database. This new account currently does not have access to any modules, reports or tools. To administer this new account (grant access to reports, change passwords, etc), please 
</cfoutput>
<cfif ListFind(variables.administrators_list, session.user_account_id)>
	<cfoutput><a href="javascript:edit_employee(#variables.emp_id#)" class="RegText#session.workstream_text_size#">administer this account</a>.</cfoutput>
<cfelse>contact the following workstream administrators to set up the appropriate access:<br>
<ul type="square" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
<cfoutput query="get_administrators">
<li class="RegText#session.workstream_text_size#"><a href="mailto:#email#" class="RegText#session.workstream_text_size#">#lname#, #name#</a></li>
</cfoutput>
</ul>
</cfif>
		</td>
	</tr>
