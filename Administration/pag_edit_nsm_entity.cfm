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

<table cellpadding="0" cellspacing="0" border="0" summary="Breadcrumb navigation for managing the NSM structure">
	<tr>
		<th align="left"><h2 style="margin:0px" id="top-side"><a href="index.cfm?fuseaction=Administration.manage_nsm_structure">Manage <abbr title="NASA Structure Management">NSM</abbr> Structure</a> &gt; Edit <abbr title="NASA Structure Management">NSM</abbr> Entities</h2>
		</th>
	</tr>
</table><img src="images/spacer.gif" alt="" width="560" height="1"><br />

<cfform name="form_edit_nsm_entity" action="index.cfm?fuseaction=Administration.edit_nsm_entity" method="post">
<div class="datachart" style="border:1px solid ##999999">
<table border="0" cellspacing="1" cellpadding="4" summary="Table displays edit entity information">
<tr bgcolor="999999"><th colspan="2"><strong>Edit <abbr title="NASA Structure Management">NSM</abbr> Entity</strong></th></tr>
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
			<cfinput type="submit" alt="submit" name="submit" value="Submit">
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</cfif>
</table>
</div>
</cfform>