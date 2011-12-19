<!-- common_files/dsp_hierarchy_drilldown_options.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_hierarchy_drilldown_options.cfm">
	<responsibilities>
		I help the user assign NSM structure privileges.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="8/23/2007" role="FuseCoder" comments="Created File">
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

<!--- make the first option the default selection --->
<cfset variables.checked_text=' checked="checked"'>
<cfparam name="attributes.colspan" default="1">
<cfparam name="attributes.alternate_form_name" default="">
<cfset get_next_hierarchy_drilldown_options=caller.get_next_hierarchy_drilldown_options>
<cfoutput>
<!--- if there's only one option, just display some helpful text to the user --->
<cfif get_next_hierarchy_drilldown_options.recordcount EQ 1>
	<tr bgcolor="##c0c0c0">
		<td colspan="#attributes.colspan#">
			Click on a #caller.variables.current_hierarchy_level_label# to see #caller.variables.next_hierarchy_level_label# data.
		</td>
	</tr>
<!--- otherwise, show radio button that allow the user which path to take for the drill down; the onclick event changes the value of the hidden l_p_y_h_id on the hidden form --->
<cfelseif get_next_hierarchy_drilldown_options.recordcount GT 1>
	<tr bgcolor="##c0c0c0">
		<td colspan="#attributes.colspan#">Drilldown path:
		<cfloop query="get_next_hierarchy_drilldown_options">
			<cfif currentrow NEQ 1>
				<!--- only the first option will be checked --->
				<cfset variables.checked_text="">
			</cfif>
			<label for="l_p_y_h_id_#l_p_y_h_id#">
				<input type="radio" name="l_p_y_h_id" id="l_p_y_h_id_#l_p_y_h_id#" value="#l_p_y_h_id#" onclick="document.#attributes.form_name#.l_p_y_h_id.value='#l_p_y_h_id#';<cfif len(attributes.alternate_form_name)>document.#attributes.alternate_form_name#.l_p_y_h_id.value='#l_p_y_h_id#';</cfif>"#variables.checked_text# />#hierarchy_level_label#
			</label>
		</cfloop>
		</td>
	</tr>
</cfif>
</cfoutput>