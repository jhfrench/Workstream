
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
	Revision 1.0  2005/02/15 21:01:51  daugherty
	Initial revision

	||
	END FUSEDOC --->
<cfquery name="execute_query_text" datasource="#application.datasources.main#">
#replace(attributes.query_text,"''","'","ALL")#
</cfquery>
</cfsilent>