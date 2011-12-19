
<!-- Report/qry_get_elligible_respondents.cfm
   Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: This page prepares and displays the graphed results report.
	||
	Name: Jeromy French
	||
	Edits:
	||
	END FUSEDOC --->
<cfquery name="get_elligible_respondents" datasource="iSay">
SELECT TOP #variables.records_allowed# Response.respondent_id
FROM Response
WHERE Response.survey_id=#attributes.survey_id#
GROUP BY respondent_id
ORDER BY respondent_id
</cfquery>
<cfset variables.elligible_respondents=valuelist(get_elligible_respondents.respondent_id)>
</cfsilent>

