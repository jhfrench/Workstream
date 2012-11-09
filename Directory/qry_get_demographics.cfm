
<!-- Directory/qry_get_demographics.cfm
	Author: Jeromy French-->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I am a scheduled task that runs this template and emails active employees asking if their demographic infomation is still current and accurate.
	I display a form and ask them to change the information in the prepopulated form if it is not up to date.
	If form is changed, emails is sent to judy/shiela, and database is updated.
	||
	Name: Jeromy French
	||
	Edits:
	$Log: 
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	<-- user_account_id: id that identifies user to workstream
	<-- first_name: string that contains first name of the user
	<-- last_name: string that contains last name of the user
	<-- biography: biography of employee
	<-- emp_biography_id: unique identified of biography in emp-biography table.
	END FUSEDOC --->
</cfsilent>
<cfquery name="get_demographics" datasource="#application.datasources.main#">
SELECT Emp_Contact.Name AS fname, Emp_Contact.lname, Demographics.user_account_id,
	Emp_Biography.biography, Emp_Biography.emp_biography_id
FROM Emp_Biography
	RIGHT OUTER JOIN Emp_Contact
	INNER JOIN View_Demographics_Workstream AS Demographics ON Emp_Contact.user_account_id=Demographics.user_account_id 
	ON Emp_Biography.user_account_id=Demographics.user_account_id
WHERE (Demographics.Effective_To IS NULL)<cfif isdefined("variables.user_identification") and len(variables.user_identification)>
	AND Demographics.user_account_id=#variables.user_identification#</cfif>
</cfquery>
<cfif len(get_demographics.recordcount)>
	<cfset variables.user_account_id=get_demographics.user_account_id>
</cfif>
