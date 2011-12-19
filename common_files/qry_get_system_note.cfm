<!-- common_files/qry_get_system_note.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_system_note.cfm">
	<responsibilities>
		Query to get system note.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="8/21/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.use_date_limitation_ind" default="1">
<cfparam name="attributes.system_note_id" default="0">
<cfquery name="get_system_note" datasource="#application.datasources.main#">
SELECT System_Note.system_note_id, System_Note.note_text, System_Note.created_date,
	System_Note.display_start_date, System_Note.display_end_date, Demographics.last_name + ', ' + Demographics.first_name AS created_by
FROM System_Note
	INNER JOIN Demographics ON System_Note.created_by=Demographics.user_account_id
WHERE System_Note.<cfif attributes.system_note_id NEQ 0>system_note_id=#attributes.system_note_id#<cfelse>active_ind=1</cfif>
	AND Demographics.active_ind=1
	AND System_Note.note_text IS NOT NULL<cfif attributes.use_date_limitation_ind>
	AND GETDATE() BETWEEN System_Note.display_start_date AND DATEADD(D, 1, ISNULL(System_Note.display_end_date, GETDATE()))</cfif>
ORDER BY System_Note.display_start_date, System_Note.display_end_date, System_Note.created_date
</cfquery>

<cfset caller.get_system_note=get_system_note>