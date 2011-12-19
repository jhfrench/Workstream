<!-- Help/dsp_view_help_search.cfm
	Author: Jeromy French-->
<!--- 
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_view_help_search.cfm">
	<responsibilities>
		I show the Help_Article records associated with the fuseaction of the page the user is viewing.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/18/2007" role="FuseCoder" comments="Created File">
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
<!--- this string of numbers will always be unique, which defeats the browser caching of the Main navigation menu --->
<cfset variables.cache_escape="#dateformat(now(),'yyyymmdd')##timeformat(now(),'hhmmss')#">
<cfset attributes.show_page_specific_help_searchs_ind=0>
<cfparam name="attributes.case_sensitive_ind" default="0">
<cfinclude template="qry_get_screen_help_search.cfm">
<cfif get_screen_help_search.recordcount>
	<!--- these hidden forms allow us to retrieve an individual help or faq entry ---><!--- 
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="view_help_article" fuseaction="Help.view_help_article" field_name="help_article_id"> --->
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="view_help_faq" fuseaction="Help.view_help_faq" field_name="help_faq_id">
	
	<table cols="1" summary="Table displays the help articles and frequently asked questions that contain the text the user search on.">
		<tr>
			<td scope="column">
				<strong><cfoutput>Help articles or frequently-asked questions containing your search string "#attributes.search_string#" (<cfif NOT attributes.case_sensitive_ind>not </cfif>case sensitive):</cfoutput></strong>
				<ul>
	<cfoutput query="get_screen_help_search">
		<li>
				<strong><a href="javascript:open_help_detail(#main_sort_order#, #help_id#);">#help_title#</a></strong><br />
				#left(rereplacenocase(help_article_text,"<[^>]*>","","ALL"),200)#
		</li>
	</cfoutput>
				</ul>
			</td>
		</tr>
	</table>
<cfelse>
	<strong>No help articles or frequently-asked questions contained your search string "<cfoutput>#attributes.search_string#</cfoutput>" (<cfif NOT attributes.case_sensitive_ind>not </cfif>case sensitive).</strong>
</cfif>