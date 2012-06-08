<!-- Administration/qry_deactivate_ref_program_year.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_ref_program_year.cfm">
	<responsibilities>
		Query to diactivate a record in REF_Program_Year table before a new insert.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/27/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_ref_program_year" datasource="#application.datasources.main#">
UPDATE REF_Program_Year
SET active_ind=0
WHERE active_ind=1
	AND program_year_id=#attributes.program_year_id#
</cfquery>
