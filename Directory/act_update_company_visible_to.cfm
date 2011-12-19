
<!-- Directory/act_update_company_visible_to.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I update the company visible to table.

	||
	Edits: 
	$Log$
	Revision 1.0  2005/02/15 20:46:24  daugherty
	Initial revision

	Revision 1.0  2002-02-14 09:21:19-05  long
	Created File

	||
	Variables:
	
	END FUSEDOC --->
<cfquery name="company_visible_to_delete" datasource="#application.datasources.main#">
DELETE Company_Visible_To
WHERE emp_id=#attributes.emp_id#
</cfquery> 
	<cfif LEN(attributes.visable_company)>
<cfloop list="#attributes.visable_company#" index="ii">
	<cfquery name="company_visible_to_entry" datasource="#application.datasources.main#">
		INSERT INTO Company_Visible_To(emp_id,company_id)
		VALUES(#attributes.emp_id#,#ii#)
	</cfquery>
</cfloop>
<cfelse>
<cfquery name="company_visible_to_entry" datasource="#application.datasources.main#">
INSERT INTO Company_Visible_To(emp_id,company_id)
VALUES(#attributes.emp_id#,#attributes.company_id#)
</cfquery>
</cfif>	
 

</cfsilent>
