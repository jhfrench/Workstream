
<!-- path/act_update_demographics.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I update the demographics record for an employee

	||
	Edits: 
	$Log$
	Revision 1.1  2006/07/17 07:14:13  french
	Modified code to ensure that employee updates don't cause duplicate demographic records.

	||
	Variables:

	END FUSEDOC --->
<cfquery name="end_demog_record" datasource="#application.datasources.main#">
UPDATE Demographics
SET effective_to=#createodbcdate(dateadd("d", -1, attributes.hire_date))#
WHERE user_account_id=#attributes.user_account_id# 
	AND effective_to IS NULL
</cfquery>

<cfinclude template="qry_demographics_entry.cfm">
</cfsilent><!--- $issue$: is this template used? --->