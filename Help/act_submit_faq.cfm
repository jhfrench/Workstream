<!-- Help/act_submit_faq.cfm
	Author: Jeromy French-->
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

<cfset variables.question_processed_ind=0>
<cfset attributes.active_ind=1>
<cfparam name="attributes.email_requested_ind" default="0">
<cfparam name="attributes.sort_order" default="#dateformat(now(), 'yyyymmdd')#">
<cfif isdefined("session.user_account_id")>
	<cfset variables.created_by=session.user_account_id>
<cfelse>
	<cfset variables.created_by="NULL">
</cfif>
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
<cfquery name="get_help_faq_id" datasource="#application.datasources.main#">
SELECT IDENT_CURRENT('HELP_FAQ') AS help_faq_id
</cfquery>
<cfset attributes.help_faq_id=get_help_faq_id.help_faq_id>
<!--- insert into Link_Screen_Help_FAQ (help_faq_id, screen_id) --->
<cfloop list="#attributes.screen_id#" index="variables.screen_id">
	<cfinclude template="../common_files/qry_insert_link_screen_help_faq.cfm">
</cfloop>
	
<cfquery name="get_help_email_recipients" datasource="#application.datasources.main#">
SELECT Demographics.email_address
FROM Demographics
	INNER JOIN Access_User_Business_Function ON Demographics.user_account_id=Access_User_Business_Function.user_account_id
	INNER JOIN REF_Business_Function ON Access_User_Business_Function.business_function_id=REF_Business_Function.business_function_id
WHERE Demographics.active_ind=1
	AND Access_User_Business_Function.active_ind=1
	AND REF_Business_Function.active_ind=1
	AND REF_Business_Function.description='Manage Help Module'
GROUP BY Demographics.email_address
ORDER BY Demographics.email_address
</cfquery>
<cfset variables.help_email_recipients=valuelist(get_help_email_recipients.email_address)>

<!--- This is the email that sends the question to the people identified to handle questions, if those people are known --->
<cfif len(variables.help_email_recipients) AND len(application.email_server_name)>
	<!-- email sent to <cfoutput>#variables.help_email_recipients#, from #application.application_specific_settings.system_email_sender# by server #application.email_server_name#</cfoutput> -->
	<cfmail to="#variables.help_email_recipients#" from="#application.application_specific_settings.system_email_sender#" subject="#application.product_name# FAQ" server="#application.email_server_name#" type="html">
	A #application.product_name# user<cfif isdefined("session.first_name") AND isdefined("session.last_name")>, #session.first_name# #session.last_name#,</cfif> asked the following question:<br />
	"#attributes.question#"<br />
	Please <a href="#listfirst(cgi.http_referer,"?")#?fuseaction=Administration.list_help_articles">respond using the #application.product_name# interface</a>.
	</cfmail>
<cfelse>
	<!-- No email sent (no email recipients, or no email server) -->
</cfif>

<cfset variables.question_processed_ind=1>