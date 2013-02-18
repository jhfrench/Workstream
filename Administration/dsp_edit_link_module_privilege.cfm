<!-- Administration/dsp_edit_link_module_privilege.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_link_module_privilege.cfm">
	<responsibilities>
		I display the form for link module privilege maintenance.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="9/17/2007" role="FuseCoder" comments="Created File">
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
<h2>
	<ul class="breadcrumb">
		<li>System Configuration <span class="divider">/</span></li>
		<li><a href="index.cfm?fuseaction=Administration.list_link_tables">Manage Link Tables</a> <span class="divider">/</span></li>
		<li class="active">Link Module Privilege</li>
	</ul>
</h2>
<cfoutput>
<cfform name="form_#attributes.fuseaction#" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post" class="form-horizontal">
	<fieldset>
		<legend><h3><cfif attributes.l_m_p_id EQ 0>Add new<cfelse>Edit existing</cfif> LINK_Module_Privilege</h3></legend>
		<div class="control-group">
			<label class="control-label" for="module_id">Module</label>
			<div class="controls">
				<cfselect name="module_id" id="module_id" query="get_ref_module" value="module_id" display="description" selected="#attributes.module_id#" required="yes" message="Please specify module.">
				</cfselect>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="privilege_id">Privilege</label>
			<div class="controls">
				<cfselect name="privilege_id" id="privilege_id" query="get_ref_privilege" value="privilege_id" display="description" selected="#attributes.privilege_id#" required="yes" message="Please specify privilege.">
				</cfselect>
			</div>
		</div>
	<cfif attributes.l_m_p_id EQ 0>
		<input type="hidden" name="active_ind" value="1" />
	<cfelse>
		<div class="control-group">
			<label class="control-label">Active?</label>
			<div class="controls">
				<label for="active_ind_yes"><cfinput type="radio" name="active_ind" id="active_ind_yes" value="1" checked="yes">Yes </label>
			 	<label for="active_ind_no"> <cfinput type="radio" name="active_ind" id="active_ind_no" value="0" >No </label>
			</div>
		</div>
	</cfif>
		<div class="form-actions">
			<input type="hidden" name="created_by" value="#variables.user_identification#" />
			<input type="hidden" name="l_m_p_id" value="#attributes.l_m_p_id#" />
			<input type="submit" name="submit" value="Submit" class="btn btn-primary" />
			<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
		</div>
	</fieldset>
</cfform>
</cfoutput>
