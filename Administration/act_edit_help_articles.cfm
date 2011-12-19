<!-- Administration/act_edit_help_articles.cfm
	Author: Jeromy French -->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="act_edit_help_articles.cfm">
	<responsibilities>
		I act(send information to DB) for editing and adding help articles when the form is submitted.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/17/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="help_article_id" default="0">
<cfparam name="attributes.sort_order" default="9999">
<cftransaction>
	<cfif attributes.help_article_id NEQ 0>
		<!--- deactivate Help_Article record for old help_article --->
		<cfquery name="deactivate_help_article" datasource="#application.datasources.main#">
		UPDATE Help_Article
		SET active_ind=0
		WHERE help_article_id=#attributes.help_article_id#
			AND active_ind=1
		</cfquery>
		<!--- deactivate Link_Screen_Help_Article record for old help_article --->
		<cfquery name="deactivate_link_screen_help_article" datasource="#application.datasources.main#">
		UPDATE Link_Screen_Help_Article
		SET active_ind=0
		WHERE help_article_id=#attributes.help_article_id#
			AND	active_ind=1
		</cfquery>
	</cfif>
	<cfif attributes.active_ind EQ 1>
		<!--- reorder the OTHER help articles associated with a specified screen --->
		<cfquery name="update_help_article_sort_order" datasource="#application.datasources.main#">
		UPDATE Help_Article
		SET sort_order=sort_order+1
		WHERE active_ind=1
			AND help_article_id IN (
				SELECT Link_Screen_Help_Article.help_article_id
				FROM Link_Screen_Help_Article
				WHERE Link_Screen_Help_Article.active_ind=1
					AND Link_Screen_Help_Article.screen_id IN (#attributes.screen_id#)
			)
			AND sort_order >= #attributes.sort_order#
		</cfquery>
		<!--- insert new text into Help_Article, get help_article_id --->
		<cfquery name="insert_help_article" datasource="#application.datasources.main#">
		INSERT INTO Help_Article (sort_order, created_by, active_ind,
			help_article_text, help_article_title)
		VALUES (#attributes.sort_order#, #session.user_account_id#, #attributes.active_ind#,
			<cfqueryparam value="#attributes.help_article_text#" cfsqltype="CF_SQL_LONGVARCHAR">, '#attributes.help_article_title#')
		</cfquery>
		<cfquery name="get_help_article_id" datasource="#application.datasources.main#">
		SELECT HELP_ARTICLE_SEQ.currval AS help_article_id
		FROM Dual
		</cfquery>
		<cfset attributes.help_article_id=get_help_article_id.help_article_id>
		<!--- insert into Link_Screen_Help_Article (help_article_id, screen_id) --->
		<cfloop list="#attributes.screen_id#" index="variables.screen_id">
			<cfquery name="insert_link_screen_help_article" datasource="#application.datasources.main#">
			INSERT INTO Link_Screen_Help_Article (screen_id, help_article_id, created_by,
				active_ind)
			VALUES (#variables.screen_id#, #get_help_article_id.help_article_id#, #session.user_account_id#,
				#attributes.active_ind#)
			</cfquery>
		</cfloop>
	</cfif>
</cftransaction>