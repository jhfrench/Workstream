
<!--Customers/pag_edit_engagement.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the page that allows the edit of a currently existing engagement.

	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:46:00  daugherty
	Initial revision

	Revision 1.2  2002-01-24 16:21:07-05  french
	Added link back to customer's engagement list.

	Revision 1.1  2001-10-11 10:56:24-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
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
<cfif NOT isdefined("attributes.edit") OR (isdefined("attributes.original_billable_id") AND attributes.billable_id NEQ attributes.original_billable_id)>
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
			<cfif attributes.billable_id NEQ attributes.original_billable_id>
				<cfinclude template="qry_change_billable_id.cfm">
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
<cfif isdefined("attributes.edit") AND (NOT isdefined("attributes.original_billable_id") OR attributes.billable_id EQ attributes.original_billable_id)>
	<cfmodule template="../common_files/act_redirect_browser.cfm" display="Your changes have been applied to the engagement." fuseaction="edit_engagement&project_id=#attributes.project_id#">
</cfif>
</table>

