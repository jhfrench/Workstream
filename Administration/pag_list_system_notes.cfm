<!-- Administration/pag_list_system_notes.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_list_system_notes.cfm">
	<responsibilities>
		I help a user to administer messages.
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

<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_system_note" fuseaction="Administration.edit_system_note" field_name="system_note_id">
<cfset attributes.use_date_limitation_ind="0">
<cfinclude template="../common_files/qry_get_system_note.cfm">

<cfinclude template="dsp_list_system_notes.cfm">

