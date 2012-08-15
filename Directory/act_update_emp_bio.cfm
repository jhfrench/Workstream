
<!-- Directory/act_update_emp_bio.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I 

	||
	Edits: 
	$Log$
	||
	Variables:

	END FUSEDOC --->
<cfquery name="emp_biography_delete" datasource="#application.datasources.main#">
DELETE FROM Emp_Biography
WHERE emp_id=#attributes.emp_id#
</cfquery>
<cfif len(attributes.biography)>
	<cfquery name="emp_biography_entry" datasource="#application.datasources.main#">
		INSERT INTO Emp_Biography (emp_id,biography)
		VALUES(#attributes.emp_id#,'#stripcr(attributes.biography)#')
	</cfquery>
</cfif>
</cfsilent>
