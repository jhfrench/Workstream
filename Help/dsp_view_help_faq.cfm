<!-- Help/dsp_view_help_faq.cfm
	Author: Jeromy French -->
<!--- 
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_view_help_faq.cfm">
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
<cfset attributes.help_faqs_lookup_type_id=1>
<cfinclude template="../common_files/qry_get_screen_help_faqs.cfm">
<dl>
<cfoutput query="get_screen_help_faqs">
	<dt>#question#</dt>
	<dd>#answer#</dd>
</cfoutput>
</dl>