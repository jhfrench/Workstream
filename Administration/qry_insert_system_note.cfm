<!-- Administration/qry_insert_system_note.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_system_note.cfm">
	<responsibilities>
		Query to insert a new system note into System_Note table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="8/22/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="insert_system_note" datasource="#application.datasources.main#">
INSERT INTO System_Note (note_text, display_start_date, display_end_date,
	created_by, active_ind)
VALUES ('#left(attributes.note_text,3950)#', '#dateformat(attributes.display_start_date, "dd-mmm-yyyy")#', '#dateformat(attributes.display_end_date, "dd-mmm-yyyy")#',
	#variables.user_identification#, #attributes.active_ind#)
</cfquery>

<!--- get the id of the inserted record --->
<cfquery name="get_system_note_id" datasource="#application.datasources.main#">
SELECT CURRVAL('System_Note_system_note_id_SEQ') AS system_note_id
</cfquery>
<cfset attributes.system_note_id=get_system_note_id.system_note_id>