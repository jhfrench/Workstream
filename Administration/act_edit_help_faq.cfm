<!-- Administration/act_edit_help_faq.cfm
	Author: Jeromy French -->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="act_edit_help_faq.cfm">
	<responsibilities>
		I send information to DB for editing and adding a faq when the form is submitted.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/17/2007" role="FuseCoder" comments="Created File">
			$Id:$
			(JF | 8/2/11)
			Improved white space to make email more readable.
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
<cfparam name="attributes.answered_previously_ind" default="0">
<cfparam name="attributes.help_faq_id" default="0">

<cftransaction>
	<cfif attributes.help_faq_id NEQ 0>
		<!--- deactivate Help_FAQ record for old help_faq --->
		<cfquery name="deactivate_help_faq" datasource="#application.datasources.main#">
		UPDATE Help_FAQ
		SET active_ind=0
		WHERE help_faq_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.help_faq_id#">
			AND active_ind=1
		</cfquery>
		<!--- deactivate Link_Screen_Help_FAQ record for old help_faq --->
		<cfquery name="deactivate_link_screen_help_faq" datasource="#application.datasources.main#">
		UPDATE Link_Screen_Help_FAQ
		SET active_ind=0
		WHERE help_faq_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.help_faq_id#">
			AND active_ind=1
		</cfquery>
	</cfif>

	<!--- reorder the OTHER faqs associated with a specified screen --->
	<cfquery name="update_help_faq_sort_order" datasource="#application.datasources.main#">
	UPDATE Help_FAQ
	SET sort_order=sort_order+1
	WHERE active_ind=1
		AND help_faq_id IN (
			SELECT Link_Screen_Help_FAQ.help_faq_id
			FROM Link_Screen_Help_FAQ
			WHERE Link_Screen_Help_FAQ.active_ind=1
				AND Link_Screen_Help_FAQ.screen_id IN (#attributes.screen_id#)
		)
		AND sort_order >= <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.sort_order#">
	</cfquery>

	<!--- insert new text into Help_FAQ, get help_faq_id --->
	<cfscript>
	if (len(attributes.asked_by)) {
		variables.created_by=attributes.asked_by;
		variables.created_by_null="no";
	}
	else {
		variables.created_by="NULL";
		variables.created_by_null="yes";
	}
	</cfscript>
	<cfinclude template="../common_files/qry_insert_help_faq.cfm">

	<cfif isdefined("attributes.screen_id") AND listlen(attributes.screen_id)>
		<!--- INSERT INTO Link_Screen_Help_FAQ (help_faq_id, screen_id) --->
		<cfquery name="insert_link_screen_help_faq" datasource="#application.datasources.main#">
		INSERT INTO Link_Screen_Help_FAQ (screen_id, help_faq_id, created_by)
		SELECT REF_Screen.screen_id, <cfqueryparam cfsqltype="cf_sql_integer" value="#get_help_faq_id.help_faq_id#"> AS help_faq_id, #variables.user_identification# AS created_by
		FROM REF_Screen
		WHERE REF_Screen.screen_id IN (<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#attributes.screen_id#" />)
		</cfquery>
	</cfif>

	<!--- the first time the response is entered send copy of response to user's email and to users with ability to manage the help module--->
	<cfif NOT attributes.answered_previously_ind AND len(application.email_server_name)>
	<!--- only send if requested and if we know the asker's email address --->
		<cfif attributes.email_requested_ind AND len(attributes.asker_email_address)>
			<!-- email sent to <cfoutput>#attributes.asker_email_address#, from #application.system_email_sender# by server #application.email_server_name#</cfoutput> -->
			<cfmail to="#attributes.asker_email_address#" from="#application.system_email_sender#" subject="#application.product_name# FAQ Answer" type="HTML"
				server="#application.email_server_name#" username="#application.email_username#" password="#application.email_password#"
				port="#application.email_port#" usetls="#application.email_usetls#" usessl="#application.email_usessl#">
			Your question to the #application.product_name# system has been answered.<p />

			Your question:<br />
			#attributes.question#<p />

			Answer:<br />
			#attributes.answer#<p />

			We hope this answers your question, thank you for your time.
			<cfmailparam name="Reply-To" value="#session.email_address#">
			</cfmail>
		</cfif>

		<cfinclude template="../common_files/qry_get_help_email_recipients.cfm">
		<!--- Let the other Help admins know that the question was answered--->
		<cfif len(variables.help_email_recipients)>
			<cfmail to="#variables.help_email_recipients#" from="#application.system_email_sender#" subject="#application.product_name# FAQ Answered" type="HTML"
				server="#application.email_server_name#" username="#application.email_username#" password="#application.email_password#"
				port="#application.email_port#" usetls="#application.email_usetls#" usessl="#application.email_usessl#">
			FYI: the following question to the #application.product_name# system was answered by #session.first_name# #session.last_name#.<p />

			Question:<br />
			#attributes.question#<p />

			Answer:<br />
			#attributes.answer#<p />

			If you wish, you can update the answer <a href="#listfirst(cgi.http_referer,"?")#?fuseaction=Administration.list_help_articles">using the #application.product_name# interface</a>.
			<cfmailparam name="Reply-To" value="#session.email_address#">
			</cfmail>
		</cfif>
	</cfif>
</cftransaction>