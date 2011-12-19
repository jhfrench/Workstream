
<!--Reports/qry_get_all_option.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I run the queries that show PTO-elligible employees in the drop-down selection.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfquery name="get_all_option" datasource="#application.datasources.main#">
SELECT ISNULL(all_option, 0) AS all_option
FROM Security_Object_Access
WHERE emp_id = #session.user_account_id# 
	AND object_id = 16
</cfquery>
<cfset variables.all_option=get_all_option.all_option>
</cfsilent>

