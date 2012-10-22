<!-- Administration/dsp_edit_link_program_year_hierarchy.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_link_program_year_hierarchy.cfm">
	<responsibilities>
		I display the form for link program year hierarchy maintenance.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/6/2007" role="FuseCoder" comments="Created File">
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
<cfform name="form_link_program_year_hierarchy" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post" class="form-horizontal">
	<fieldset>
		<legend><h2><cfif attributes.l_p_y_h_id EQ 0>Add new<cfelse>Edit existing</cfif> Link_Program_Year_Hierarchy</legend>
		<div class="control-group">
			<label for="hierarchy_level_id" class="control-label">Hierarchy Level</label>
			<div class="controls">
				<cfselect name="hierarchy_level_id" id="hierarchy_level_id" query="get_ref_hierarchy_level" value="hierarchy_level_id" display="description" selected="#attributes.hierarchy_level_id#" required="yes" message="Please specify hierarchy level." />
			</div>
		</div>
		<div class="control-group">
			<label for="program_year_id" class="control-label">Program Year</label>
			<div class="controls">
				<cfselect name="program_year_id" id="program_year_id" query="get_program_year" value="program_year_id" display="description" selected="#attributes.program_year_id#" required="yes" message="Please specify program year." />
			</div>
		</div>
		<div class="control-group">
			<label for="sort_order" class="control-label">Sort Order</label>
			<div class="controls">
				<cfinput type="text" name="sort_order" id="sort_order" size="3" maxlength="3" value="#get_link_program_year_hierarchy.recordcount+1#" required="yes" message="Please enter sort order.">
			</div>
		</div>
	<cfif attributes.l_p_y_h_id EQ 0>
		<cfinput type="hidden" name="active_ind" value="1">
	<cfelse>
		<div class="control-group">
			<label for="active_ind_yes">Active?</label>
			<div class="controls">
				<label for="active_ind_yes"><cfinput type="radio" name="active_ind" id="active_ind_yes" value="1" checked="yes"> Yes</label>
				<label for="active_ind_no"><cfinput type="radio" name="active_ind" id="active_ind_no" value="0" >No </label>
			</div>
		</div>
	</cfif>
		<div class="form-actions">
			<input type="hidden" name="created_by" value="#variables.user_identification#" />
			<input type="hidden" name="l_p_y_h_id" value="#attributes.l_p_y_h_id#" />
			<input type="submit" name="submit" value="Submit" class="btn btn-primary" />
			<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
		</div>
	</fieldset>
</cfform>
</cfoutput>