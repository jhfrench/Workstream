<!-- Administration/pag_edit_help_articles.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_help_articles.cfm">
	<responsibilities>
		I display the form for editing help articles and act(send information to DB) when the form is submitted.
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
<h2>System Configuration &gt; <a href="index.cfm?fuseaction=Administration.list_help_articles">Administer Help Module</a> &gt; Manage Help Articles</h2>
<cfif isdefined("attributes.help_article_title")>
	<!--- if we're submitting help article details, commit the new info to the DB --->
	<cfinclude template="act_edit_help_articles.cfm">
</cfif>

<cfmodule template="../common_files/qry_get_fuseactions.cfm">
<cfinclude template="qry_get_help_article.cfm">
<cfinclude template="dsp_edit_help_articles.cfm">