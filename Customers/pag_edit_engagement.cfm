
<!--Customers/pag_edit_engagement.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the page that allows the edit of a currently existing engagement.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfparam name="attributes.option" default="0">
<cfif attributes.option>
	<cfset variables.colspan="4">
<cfelse>
	<cfset variables.colspan="2">
</cfif>
</cfsilent>
<cfinclude template="act_edit_engagement_header.cfm">
<table align="center" border="0" cellpadding="1" cellspacing="0" width="70%">
<cfif NOT isdefined("attributes.edit") OR (isdefined("attributes.original_billable_type_id") AND attributes.billable_type_id NEQ attributes.original_billable_type_id)>
		<cfinclude template="dsp_edit_engagement_header.cfm">
</cfif>
<cfswitch expression="#attributes.option#">
	<cfcase value="0">
		<cfinclude template="act_edit_engagement_menu.cfm">
		<cfinclude template="dsp_edit_engagement_menu.cfm">
	</cfcase>
	<cfcase value="1">
		<cfif NOT isdefined("attributes.edit")>
			<cfinclude template="dsp_edit_engagement_main.cfm">
		<cfelse>
			<cfinclude template="act_edit_engagement_main.cfm">
		</cfif>
	</cfcase>
	<cfcase value="2">
		<cfif NOT isdefined("attributes.edit")>
			<cfinclude template="dsp_edit_engagement_billing.cfm">
		<cfelse>
			<cfif attributes.billable_type_id NEQ attributes.original_billable_type_id>
				<cfinclude template="qry_change_billable_type_id.cfm">
				<cfinclude template="dsp_edit_engagement_billing.cfm">
			<cfelse>
				<cfinclude template="act_edit_engagement_billing.cfm">
			</cfif>
		</cfif>
	</cfcase>
	<cfcase value="3">
		<cfif NOT isdefined("attributes.edit")>
			<cfinclude template="dsp_edit_engagement_custom.cfm">
		<cfelse>
			<cfinclude template="act_edit_engagement_custom.cfm">
		</cfif>
	</cfcase>
</cfswitch>
<cfif isdefined("attributes.edit") AND (NOT isdefined("attributes.original_billable_type_id") OR attributes.billable_type_id EQ attributes.original_billable_type_id)>
	<cfmodule template="../common_files/act_redirect_browser.cfm" display="Your changes have been applied to the engagement." fuseaction="edit_engagement&project_id=#attributes.project_id#">
</cfif>
</table>

