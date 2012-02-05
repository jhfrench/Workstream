<!-- Administration/act_edit_help_faq.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="act_edit_help_faq.cfm">
	<responsibilities>
		I send information to DB for editing and adding a faq when the form is submitted.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="7/17/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.answered_previously_ind" default="0">
<cfparam name="attributes.help_faq_id" default="0">
<cftransaction>
	<cfif attributes.help_faq_id NEQ 0>
		<!--- deactivate Help_FAQ record for old help_faq --->
		<cfquery name="deactivate_help_faq" datasource="#application.datasources.main#">
		UPDATE Help_FAQ
		SET active_ind=0
		WHERE help_faq_id=#attributes.help_faq_id#
			AND active_ind=1
		</cfquery>
		<!--- deactivate Link_Screen_Help_FAQ record for old help_faq --->
		<cfquery name="deactivate_link_screen_help_faq" datasource="#application.datasources.main#">
		UPDATE Link_Screen_Help_FAQ
		SET active_ind=0
		WHERE help_faq_id=#attributes.help_faq_id#
			AND active_ind=1
		</cfquery>
	</cfif>
	<cfif attributes.active_ind EQ 1>
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
			AND sort_order >= #attributes.sort_order#
		</cfquery>
		<!--- insert new text into Help_FAQ, get help_faq_id --->
		<cfif len(attributes.asked_by)>
			<cfset variables.created_by=attributes.asked_by>
		<cfelse>
			<cfset variables.created_by="NULL">
		</cfif>
		<cfinclude template="../common_files/qry_insert_help_faq.cfm">
		<cfquery name="get_help_faq_id" datasource="#application.datasources.main#">
		SELECT IDENT_CURRENT('HELP_FAQ') AS help_faq_id
		</cfquery>
		<cfset attributes.help_faq_id=get_help_faq_id.help_faq_id>
		<!--- insert into Link_Screen_Help_FAQ (help_faq_id, screen_id) --->
		<cfloop list="#attributes.screen_id#" index="variables.screen_id">
			<cfquery name="insert_link_screen_help_faq" datasource="#application.datasources.main#">
			INSERT INTO Link_Screen_Help_FAQ (screen_id, help_faq_id, created_by,
				active_ind)
			VALUES (#variables.screen_id#, #get_help_faq_id.help_faq_id#, #session.user_account_id#,
				#attributes.active_ind#)
			</cfquery>
		</cfloop>
		
		<!--- if requested, send copy of response to user's email, but only the first time the response is crafted --->
		<cfif attributes.email_requested_ind AND len(attributes.asker_email_address) AND NOT attributes.answered_previously_ind>
			<!-- email sent to <cfoutput>#attributes.asker_email_address#, from #application.application_specific_settings.system_email_sender# by server #application.email_server_name#</cfoutput> -->
			<cfmail to="#attributes.asker_email_address#" from="#application.application_specific_settings.system_email_sender#" subject="#application.product_name# FAQ" server="#application.email_server_name#" type="html">
			Your question to the #application.product_name# system has been answered.<p />
			
			Question:<br />
			#attributes.question#<p />
			
			Answer:<br />
			#attributes.answer#<p />
			
			We hope this answers your question, thank you for your time.
			<cfmailparam name="Reply-To" value="#session.email_address#">
			</cfmail>
		</cfif>
	</cfif>
</cftransaction>