
<!--Customers/qry_get_states.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->

<cfquery name="get_states" datasource="#application.datasources.main#">
    select *
    From REF_states
</cfquery>
