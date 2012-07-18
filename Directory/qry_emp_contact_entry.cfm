
<!--Directory/qry_emp_contact_entry.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I insert a emp_contact record.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
 --->
</cfsilent>
<cfquery name="emp_contact_entry" datasource="#application.datasources.main#">
INSERT INTO Emp_Contact (name, mi, lname,
	credentials, emp_contact_type)
VALUES('#attributes.name#', '#attributes.mi#', '#attributes.lname#',
	'#attributes.credentials#', #emp_contact_type#)
</cfquery>
<cfquery name="max_emp_id" datasource="#application.datasources.main#">
SELECT CURRVAL('Emp_Contact_emp_id_SEQ') AS emp_id
</cfquery>
<cfset variables.emp_id=max_emp_id.emp_id>
<cfset attributes.emp_id=variables.emp_id><!--- 
<cfquery name="emp_contact_delete" datasource="#application.datasources.main#">
DELETE Emp_Contact
WHERE emp_id=#variables.emp_id#
</cfquery> --->

