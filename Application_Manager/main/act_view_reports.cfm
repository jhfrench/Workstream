<!-- Application_Manager/main/act_view_reports.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="act_view_reports.cfm" Specification="2.0">
	<responsibilities>
		I provide an interface for entering data about a new support contact.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/25/2008" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfif isdefined("attributes.submit_form")>
	<cfinclude template="act_view_report_type_id_#attributes.report_type_id#.cfm">
</cfif>

<!--- report type --->
<cfparam name="attributes.report_type_id" default="0">
<cfparam name="attributes.metric_id" default="0">
<cfset variables.report_type_id_1_selected_ind="no">
<cfset variables.report_type_id_2_selected_ind="no">
<cfif attributes.report_type_id EQ 1>
	<cfset variables.report_type_id_1_selected_ind="yes">
<cfelseif attributes.report_type_id EQ 2>
	<cfset variables.report_type_id_2_selected_ind="yes">
</cfif>

<!--- reporting metric --->
<cfset variables.metric_1_selected_ind="no">
<cfset variables.metric_2_selected_ind="no">
<cfset variables.metric_3_selected_ind="no">
<cfif listfind(attributes.metric_id,1)>
	<cfset variables.metric_1_selected_ind="yes">
</cfif>
<cfif listfind(attributes.metric_id,2)>
	<cfset variables.metric_2_selected_ind="yes">
</cfif>
<cfif listfind(attributes.metric_id,3)>
	<cfset variables.metric_3_selected_ind="yes">
</cfif>

<!--- date range --->
<cfparam name="attributes.date_start" default="#dateformat(dateadd('yyyy', -1, now()), 'mm/dd/yyyy')#">
<cfparam name="attributes.date_end" default="#dateformat(now(), 'mm/dd/yyyy')#">

<!--- installation --->
<cfparam name="attributes.installation_id" default="0">
<cfinclude template="qry_get_installation_url.cfm">

<script language="javascript">
function toggle_installation_id_row() {
	if (document.forms.reports_menu.report_type_id[0].checked) {
		document.all.installation_id_row.style.display='table-row'
	}
	else {
		document.all.installation_id_row.style.display='none'
	}
}
</script>