<!-- Administration/dsp_manage_system_access.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_manage_system_access.cfm">
	<responsibilities>
	</responsibilities>
		Page to help administrator to manage system access.
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="10/4/2007" role="FuseCoder" comments="Created File">
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
<cfoutput>
<h2>Manage System Access</h2>
<form name="form_manage_system_access" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
<div class="datachart" style="border:1px solid ##999999">
<table cellpadding="3" cellspacing="0" width="100%" border="0" summary="Title of the form held in this table is Manage System Access">
	<tr align="left" bgcolor="##cccccc">
		<th>Module</th>
		<th><label for="module_id">Lock</label></th>
		<th title="There may be multiple comments for each module in this data chart. This label relates to the id of the input which is comments"><label for="comments">Comments</label></th>
	</tr>
	<cfloop query="get_ref_module">
	<tr bgcolor="##eeeeee">
		<td id="description" scope="row"><label for="module_id_#module_id#">#description#</label></td>
		<td id="module_id"><input type="checkbox" name="module_id" id="module_id_#module_id#" value="#module_id#"<cfif get_ref_module.locked_ind EQ 1> checked="checked"</cfif> /></td>
		<td id="comments_#module_id#">
			<input type="text" name="comments_#module_id#" id="comments" value="<cfif len(get_ref_module.comments)>#get_ref_module.comments#</cfif>" maxlength="4000" size="50" title="Enter comments for #description#" />
		</td>
	</tr>
	</cfloop>
	<tr bgcolor="##dddddd">
		<td align="center" colspan="3">
			<input type="hidden" name="module_id_list" value="#variables.all_module_id#" />
			<input type="submit" name="submit" value="Submit" class="btn btn-primary" />
			<input type="button" name="cancel_button" value="Cancel" onclick="window.history.go(-1)" class="btn" />
		</td>
	</tr>
</table>
</div>
</form>
</cfoutput>
