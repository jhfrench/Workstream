
<!--common_files/qry_get_states.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve all records from the REF_States table (which is populated with a list of US states, territories and commonwealths).

	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:42:06  daugherty
	Initial revision

	Revision 1.2  2001-10-15 16:03:56-04  french
	Added cachedafter because this query is not likely to change for a while.

	Revision 1.1  2001-10-15 15:56:16-04  french
	Spelled out the columns to retrieve (replaced *).

	Revision 1.0  2001-10-15 15:54:09-04  french
	Initial revision

	||
	END FUSEDOC --->
<cfquery name="get_states" cachedafter="08/21/1959" datasource="#application.datasources.main#">
SELECT state, state_abbr, state_id 
FROM REF_States
WHERE #application.last_updated#=#application.last_updated#
</cfquery>
</cfsilent>

