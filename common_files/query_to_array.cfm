<!-- common_files/query_to_array.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="query_to_array.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="6/19/2007" role="FuseCoder" comments="Created File">
			$Id:$
		</history>
	</properties>
	<IO>
		<in>
		</in>
		<passthrough>
		</passthrough>
		<out>
		</out>
	</IO>
</fusedoc>
--->
<cffunction name="QueryToArray" access="public" returntype="array" output="false" hint="This turns a query into an array of structures.">
<!--- Define arguments. --->
<cfargument name="Data" type="query" required="yes" />
<cfscript>
// Define the local scope.
var LOCAL=StructNew();
// Get the column names as an array.
LOCAL.Columns=ListToArray( ARGUMENTS.Data.ColumnList );
// Create an array that will hold the query equivalent.
LOCAL.QueryArray=ArrayNew( 1 );
// Loop over the query.
for (LOCAL.RowIndex=1 ; LOCAL.RowIndex LTE ARGUMENTS.Data.recordcount ; LOCAL.RowIndex=(LOCAL.RowIndex+1)){
	// Create a row structure.
	LOCAL.Row=StructNew();
	// Loop over the columns in this row.
	for (LOCAL.ColumnIndex=1 ; LOCAL.ColumnIndex LTE arraylen( LOCAL.Columns ) ; LOCAL.ColumnIndex=(LOCAL.ColumnIndex+1)){
		// Get a reference to the query column.
		LOCAL.ColumnName=LOCAL.Columns[ LOCAL.ColumnIndex ];
		// Store the query cell value into the struct by key.
		LOCAL.Row[ LOCAL.ColumnName ]=ARGUMENTS.Data[ LOCAL.ColumnName ][ LOCAL.RowIndex ];
	}
	// Add the structure to the query array.
	ArrayAppend( LOCAL.QueryArray, LOCAL.Row );
}
// Return the array equivalent.
return( LOCAL.QueryArray );
</cfscript>
</cffunction>
