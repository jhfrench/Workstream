<!-- Administration/qry_deactivate_system_note.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_system_note.cfm">
	<responsibilities>
		Query to diactivate a record in System_Note table before a new insert.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="8/22/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_system_note" datasource="#application.datasources.main#">
UPDATE System_Note
SET active_ind=0
WHERE active_ind=1
	AND system_note_id=#attributes.system_note_id#
</cfquery>
