<!-- Administration/pag_edit_nsm_entity.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_nsm_entity.cfm">
	<responsibilities>
		I help the user maintain the NSM structure.
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
<cfset variables.show_button_ind=1>

<ul class="breadcrumb">
  <li><a href="index.cfm?fuseaction=Administration.manage_nsm_structure">Manage hierarchy Structure</a> <span class="divider">/</span></li>
  <li class="active">Edit hierarchy Entities</li>
</ul>
<cfform name="form_edit_nsm_entity" action="index.cfm?fuseaction=Administration.edit_nsm_entity" method="post">
<div class="datachart" style="border:1px solid ##999999">
<table border="0" cellspacing="1" cellpadding="4" summary="Table displays edit entity information">
<tr bgcolor="999999"><th colspan="2"><strong>Edit hierarchy Entity</strong></th></tr>
	<!--- show NSM entities --->
	<cfif NOT isdefined("attributes.submit")>
		<cfmodule template="../common_files/dsp_program_year.cfm" program_year_id="#attributes.program_year_id#">

	<!--- show NSM entities --->
	<cfelseif NOT isdefined("attributes.organization_id")>
		<cfinclude template="dsp_choose_nsm_entity.cfm">

	<!--- show pre-filled edit form --->
	<cfelseif NOT isdefined("attributes.hierarchy_assignment_id")>
		<cfinclude template="dsp_edit_nsm_entity.cfm">

	<!--- apply edits to system --->
	<cfelse>
		<cfinclude template="act_edit_nsm_entity.cfm">
		<cfinclude template="dsp_choose_nsm_entity.cfm">
	</cfif>

<cfif variables.show_button_ind>
	<tr>
		<td colspan="2" bgcolor="CCCCCC" align="center">
		<cfif isdefined("attributes.submit")>
			<input type="hidden" name="program_year_id" value="<cfoutput>#attributes.program_year_id#</cfoutput>" />
		</cfif>
			<input type="submit" name="submit" value="Submit" class="btn btn-primary" />
			<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
		</td>
	</tr>
</cfif>
</table>
</div>
</cfform>