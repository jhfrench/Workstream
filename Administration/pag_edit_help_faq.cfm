<!-- Administration/pag_edit_help_faq.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_help_faq.cfm">
	<responsibilities>
		I display the form for editing help faq and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/18/2007" role="FuseCoder" comments="Created File">
			$Id:$
			(JF | 7/19/10) Cleaning up verbiage and row coloring.
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

<h2>System Configuration &gt; <a href="index.cfm?fuseaction=Administration.list_help_articles">Administer Help Module</a> &gt; Manage Frequently Asked Questions</h2>
<cfif isdefined("attributes.question")>
	<!--- if we're submitting help article details, commit the new info to the DB --->
	<cfinclude template="act_edit_help_faq.cfm">
</cfif>

<cfmodule template="../common_files/qry_get_fuseactions.cfm">
<cfinclude template="qry_get_help_faq.cfm">
<cfscript>
//handle active_ind radio default
variables.active_ind_on=0;
variables.active_ind_off=1;
variables.public_ind_on=0;
variables.public_ind_off=1;

if (get_help_faq.recordcount) {
	attributes.active_ind=get_help_faq.active_ind;
	attributes.asked_by=get_help_faq.asked_by;
	attributes.answered_previously_ind=len(get_help_faq.answer);
	attributes.email_requested_ind=get_help_faq.email_requested_ind;
	attributes.public_ind=get_help_faq.public_ind;
	attributes.selected_screen_id=valuelist(get_help_faq.screen_id);
	attributes.sort_order=get_help_faq.sort_order;

	if(get_help_faq.active_ind) {
		variables.active_ind_on=1;
		variables.active_ind_off=0;
	}
	if(get_help_faq.public_ind) {
		variables.public_ind_on=1;
		variables.public_ind_off=0;
	}
}
else {
	attributes.asked_by=variables.user_identification;
	attributes.answered_previously_ind=0;
	attributes.email_requested_ind=0;
	attributes.screen_id=0;
	attributes.selected_screen_id=0;
	attributes.sort_order=dateformat(now(), 'yyyymmdd');
}
</cfscript>
<cfinclude template="dsp_edit_help_faq.cfm">