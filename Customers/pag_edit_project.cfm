
<!--Customers/pag_edit_project.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the page that allows the edit of a currently existing project.

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
<cfinclude template="act_edit_project_header.cfm">
<cfswitch expression="#attributes.option#">
	<cfcase value="0">
		<cfinclude template="dsp_edit_project_menu.cfm">
	</cfcase>
	<cfcase value="1">
		<cfif NOT isdefined("attributes.edit")>
			<cfinclude template="dsp_edit_project_main.cfm">
		<cfelse>
			<cfinclude template="act_edit_project_main.cfm">
		</cfif>
	</cfcase>
	<cfcase value="2">
		<cfif NOT isdefined("attributes.edit")>
			<cfinclude template="dsp_edit_project_billing.cfm">
		<cfelse>
			<cfif attributes.billable_type_id NEQ attributes.original_billable_type_id>
				<cfinclude template="qry_change_billable_type_id.cfm">
				<cfinclude template="dsp_edit_project_billing.cfm">
			<cfelse>
				<cfinclude template="act_edit_project_billing.cfm">
			</cfif>
		</cfif>
	</cfcase>
	<cfcase value="3">
		<cfif NOT isdefined("attributes.edit")>
			<cfinclude template="dsp_edit_project_custom.cfm">
		<cfelse>
			<cfinclude template="act_edit_project_custom.cfm">
		</cfif>
	</cfcase>
</cfswitch>
<cfif isdefined("attributes.edit") AND (NOT isdefined("attributes.original_billable_type_id") OR attributes.billable_type_id EQ attributes.original_billable_type_id)>
	<cfmodule template="../common_files/act_redirect_browser.cfm" delay="2000" display="Your changes have been applied to the project." fuseaction="Customers.edit_project&project_id=#attributes.project_id#">
</cfif>
