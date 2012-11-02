<!-- Administration/pag_upload_mdm_data.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_upload_mdm_data.cfm">
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

<cfset variables.form_fuseaction="Administration.upload_mdm_data">
<cfset attributes.upload_source_id=23>
<cfinclude template="act_upload.cfm">

<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="table displays upload MDM structure infor">
	<tr>
		<td align="left"><h2 style="margin:0px" id="top-side"> &gt; </h2>
		</td>
	</tr>
</table>


<ul class="breadcrumb">
  <li><a href="index.cfm?fuseaction=Administration.manage_nsm_structure">Manage NSM Structure</a> <span class="divider">/</span></li>
  <li class="active">Upload MDM Data</li>
</ul>

<cfif isdefined("attributes.my_file")>
	<!--- process data, show any entries that did not get uploaded --->
	<cfinclude template="act_process_upload.cfm">
	<cfif variables.error_ind EQ 0>
		<cfinclude template="dsp_upload_mdm_data.cfm">
	</cfif>
<cfelse>
</cfif>
<cfinclude template="dsp_upload.cfm">
