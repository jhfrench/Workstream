<!-- Help/dsp_view_help_search.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_view_help_search.cfm">
	<responsibilities>
		I show the Help_Article records associated with the fuseaction of the page the user is viewing.
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
<cfsetting showdebugoutput="no">
<cfparam name="attributes.case_sensitive_ind" default="0">
<cfinclude template="qry_get_screen_help_search.cfm">
<div id="search_result">
<cfif get_screen_help_search.recordcount>
	<!--- these hidden forms allow us to retrieve an individual help or faq entry ---><!---
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="view_help_article" fuseaction="Help.view_help_article" field_name="help_article_id"> --->
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="view_help_faq" fuseaction="Help.view_help_faq" field_name="help_faq_id">
	<span class="label label-success">We found something</span>
	<p>Help articles or frequently-asked questions containing your search string "<cfoutput>#attributes.search_string#</cfoutput>" (<cfif NOT attributes.case_sensitive_ind>not </cfif>case sensitive):</p>
	<dl>
	<cfoutput query="get_screen_help_search">
		<dt>#help_title#</dt>
		<dd>#help_article_text#</dd>
	</dl>
	</cfoutput>
<cfelse>
	<span class="label label-important">That didn't work</span>
	<p>No help articles or frequently-asked questions contained your search string "<cfoutput>#attributes.search_string#</cfoutput>" (<cfif NOT attributes.case_sensitive_ind>not </cfif>case sensitive).</p>
</cfif>
</div>