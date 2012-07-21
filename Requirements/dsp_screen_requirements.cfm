<!-- Requirements/dsp_screen_requirements.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_screen_requirements.cfm">
	<responsibilities>
		I display the form for showing requirements for the page the user is viewing.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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

<cfinclude template="qry_get_screen_requirements.cfm">
<hr width="100%" />
<form name="change_requirement_listing_options" action="index.cfm?fuseaction=Requirements.change_requirement_listing_options" target="change_requirement_listing_options" method="post" class="well form-inline">
	<label for="hide_general_requirements" class="checkbox">Hide system-wide requirements
		<input type="checkbox" name="hide_general_requirements" id="hide_general_requirements" value="1"<cfif session.hide_general_requirements> checked="checked"</cfif> />
	</label>
	<label for="hide_module_all" class="checkbox">Hide general module requirements
		<input type="checkbox" name="hide_module_all" id="hide_module_all" value="1"<cfif session.hide_module_all> checked="checked"</cfif> />
	</label>
	<label for="hide_coded_requirements" class="checkbox">Hide completed requirements
		<input type="checkbox" name="hide_coded_requirements" id="hide_coded_requirements" value="1"<cfif session.hide_coded_requirements> checked="checked"</cfif> />
	</label>
	<div class="btn-group">
		<input type="submit" name="submit" value="Submit" alt="submit" class="btn btn-primary" />
		<input type="reset" value="Reset" class="btn" />
	</div>
</form>

<form name="mark_requirement_complete" action="index.cfm?fuseaction=Requirements.mark_requirement_complete" target="mark_requirement_complete" method="post">
<table class="table table-striped table-bordered table-condensed" width="100%" summary="table displays screent requirements">
	<caption><h4>Requirements</h4></caption>
	<thead>
	<tr>
		<th scope="col">Level</th>
		<th scope="col">Business Function</th>
		<th scope="col">Type</th>
		<th scope="col">Completed</th>
		<th scope="col">Requirement</th>
		<th scope="col">Requested Release</th>
	</tr>
	</thead>
	<tfoot>
	<tr>
		<td colspan="6">
			<input type="hidden" name="affected_requirements" value="<cfoutput>#valuelist(get_screen_requirements.l_s_r_id)#</cfoutput>" />
			<div class="btn-group">
				<input type="submit" name="submit" value="Submit" class="btn btn-primary" />
				<input type="reset" value="Reset" class="btn" />
				<a href="index.cfm?fuseaction=Requirements.edit_requirement&requirement_id=0" class="btn">Add New Requirement</a>
				<a href="index.cfm?fuseaction=Requirements.requirements_document" target="requirements" class="btn">View all requirements</a>
			</div>
		</td>
	</tr>
	</tfoot>
	<tbody>
	<cfif get_screen_requirements.recordcount EQ 0>
	<tr>
		<td colspan="6">
			<p>No requirements listed for this page</p>
		</td>
	</tr>
	<cfelse>
	<cfoutput query="get_screen_requirements">
	<tr>
		<td>#requirement_level#</td>
		<td>#business_function#</td>
		<td>#requirement_type#</td>
		<td align="center"><input type="checkbox" name="requirement_coded_ind" id="requirement_coded_ind_#l_s_r_id#" value="#l_s_r_id#"<cfif requirement_coded_ind> checked="checked"</cfif> /></td>
		<td><a href="index.cfm?fuseaction=Requirements.edit_requirement&requirement_id=#requirement_id#">#requirement_number#</a> <label for="requirement_coded_ind_#l_s_r_id#">#requirement#</label></td>
		<td>#product_version#</td>
	</tr>
	</cfoutput>
	</cfif>
	<tbody>
</table>
</form>

