
<!--Tools/qry_execute_query_text.cfm
	Author: Jeromy French  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities:
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfquery name="execute_query_text" datasource="#application.datasources.main#">
#replace(attributes.query_text,"''","'","ALL")#
</cfquery>
</cfsilent>