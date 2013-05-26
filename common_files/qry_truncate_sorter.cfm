<!-- common_files/qry_truncate_sorter.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_truncate_sorter.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/28/2007" role="FuseCoder" comments="Created File">
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
<cfquery name="truncate_sorter" datasource="#application.datasources.main#">
TRUNCATE TABLE Sorter; /*empty table*/
SELECT setval('sorter_sorter_id_seq', 0); /*reset sequence*/
</cfquery>