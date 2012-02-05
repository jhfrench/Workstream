<!-- common_files/qry_get_all_system_notes.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_all_system_notes.cfm">
	<responsibilities>
		Query to retrieve all active system notes from System_Note table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="8/23/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="get_all_system_notes" datasource="#application.datasources.main#">
SELECT system_note_id, note_text, display_start_date,
	display_end_date, Demographics.last_name + ', ' + Demographics.first_name AS created_by
FROM System_Note
	INNER JOIN Demographics ON System_Note.created_by=Demographics.user_account_id
WHERE System_Note.active_ind=1
	AND Demographics.active_ind=1
ORDER BY System_Note.display_start_date, System_Note.display_end_date, note_text
</cfquery>
