<!-- Help/act_submit_faq.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_submit_faq.cfm">
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
<cfscript>
variables.question_processed_ind=0;
attributes.active_ind=1;
if (NOT isdefined("attributes.email_requested_ind")) {
	attributes.email_requested_ind=0;
}
if (NOT isdefined("attributes.sort_order")) {
	attributes.sort_order=dateformat(now(), 'yyyymmdd');
}
if (isdefined("variables.user_identification")) {
	variables.created_by=variables.user_identification;
	variables.created_by_null="no";
}
else {
	variables.created_by="NULL";
	variables.created_by_null="yes";
}
</cfscript>

<!--- reorder the OTHER help faqs associated with a specified screen --->
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
<cfinclude template="../common_files/qry_insert_help_faq.cfm">

<!--- INSERT INTO Link_Screen_Help_FAQ (help_faq_id, screen_id) --->
<cfloop list="#attributes.screen_id#" index="variables.screen_id">
	<cfinclude template="../common_files/qry_insert_link_screen_help_faq.cfm">
</cfloop>

<!--- figure out the people who can answer this question so we can send a notification to them --->
<cfinclude template="../common_files/qry_get_help_email_recipients.cfm">

<!--- This is the email that sends the question to the people identified to handle questions (if those people are known) --->
<cfif len(variables.help_email_recipients) AND len(application.email_server_name)>
	<!-- email sent to <cfoutput>#variables.help_email_recipients#, from #application.system_email_sender# through #application.email_server_name#</cfoutput> -->

	<cfscript>
		attributes.email_recipients_demographics_id=valuelist(get_help_email_recipients.demographics_id);
		attributes.reply_to=application.system_email_sender;
		attributes.subject="#application.product_name# FAQ";
		attributes.email_body="A #application.product_name# user asked the following question:<br />
	'#attributes.question#'";
		variables.created_by=0;
	</cfscript>
	<cfmail to="#variables.help_email_recipients#" from="#application.system_email_sender#" subject="#attributes.subject#" type="HTML"
		server="#application.email_server_name#" username="#application.email_username#" password="#application.email_password#"
		port="#application.email_port#" usetls="#application.email_usetls#" usessl="#application.email_usessl#">
A #application.product_name# user<cfif isdefined("session.first_name") AND isdefined("session.last_name")>, #session.first_name# #session.last_name#,</cfif> asked the following question:<br />
"#attributes.question#"<br />
Please <a href="#listfirst(cgi.http_referer,"?")#?fuseaction=Administration.list_help_articles">respond using the #application.product_name# interface</a>.
	</cfmail>
	<cfinclude template="../common_files/act_log_email.cfm">
<cfelse>
	<!-- No email sent (no email recipients, or no email server) -->
</cfif>

<cfset variables.question_processed_ind=1>