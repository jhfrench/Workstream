
<!--Directory/qry_company_visible_to_entry.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I insert a company record.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	Revision 1.0  2005/02/15 20:46:52  daugherty
	Initial revision

	Revision 1.1  2002-03-08 16:32:56-05  long
	added the ability to have a person with access to multiple companies.

	Revision 1.0  2001-10-16 17:05:48-04  french
	Initial revision

	||
	Variables:
 --->
</cfsilent>
	<!--- 
	If the admin granted the new user  access to multiple companies then 
	grant that access
	--->
<cfif LEN(attributes.visable_company)>
<cfloop list="#attributes.visable_company#" index="ii">
	<cfquery name="company_visible_to_entry" datasource="#application.datasources.main#">
		INSERT INTO Company_Visible_To(emp_id,company_id)
		VALUES(#variables.emp_id#,#ii#)
	</cfquery>
</cfloop>
<cfelse>
<!--- 
	If the admin didn't grant access to anything at all, then grant access to the 
	company that the new employee works for.
 --->
<cfquery name="company_visible_to_entry" datasource="#application.datasources.main#">
INSERT INTO Company_Visible_To(emp_id,company_id)
VALUES(#variables.emp_id#,#attributes.company_id#)
</cfquery>
</cfif>	
<!--- 
<cfquery name="company_visible_to_delete" datasource="#application.datasources.main#">
DELETE Company_Visible_To
WHERE emp_id=#variables.emp_id#
</cfquery> --->

