<!-- Administration/pag_list_help_articles.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_list_help_articles.cfm">
	<responsibilities>
		I help a user to administer help module.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/18/2007" role="FuseCoder" comments="Created File">
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
<h2>Manage Help Module</h2>
<cfif application.help.faq_active_ind>
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_listed_help_faq" fuseaction="Administration.edit_help_faq" field_name="help_faq_id">
	<cfinclude template="qry_get_all_help_faqs.cfm">
	<cfinclude template="dsp_list_help_faqs.cfm">
</cfif>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_listed_help_article" fuseaction="Administration.edit_help_article" field_name="help_article_id">
<cfinclude template="qry_get_all_help_articles.cfm">
<cfinclude template="dsp_list_help_articles.cfm">

