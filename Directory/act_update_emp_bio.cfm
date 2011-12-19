
<!-- Directory/act_update_emp_bio.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I 

	||
	Edits: 
	$Log$
	Revision 1.0  2005/02/15 20:46:26  daugherty
	Initial revision

	Revision 1.0  2002-02-14 09:23:20-05  long
	Created File

	||
	Variables:
	
	END FUSEDOC --->
<cfquery name="emp_biography_delete" datasource="#application.datasources.main#">
DELETE Emp_Biography
WHERE emp_id=#attributes.emp_id#
</cfquery>
<cfif len(attributes.biography)>
	<cfquery name="emp_biography_entry" datasource="#application.datasources.main#">
		INSERT INTO Emp_Biography (emp_id,biography)
		VALUES(#attributes.emp_id#,'#StripCR(attributes.biography)#')
	</cfquery>
</cfif>
</cfsilent>
