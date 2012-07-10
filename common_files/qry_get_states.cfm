
<!--common_files/qry_get_states.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve all records from the REF_States table (which is populated with a list of US states, territories and commonwealths).

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="get_states" cachedafter="08/21/1959" datasource="#application.datasources.main#">
SELECT state, state_abbr, state_id 
FROM REF_States
WHERE #application.last_updated#=#application.last_updated#
</cfquery>
</cfsilent>

