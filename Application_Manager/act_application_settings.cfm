<!-- Application_Manager/act_application_settings.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="act_application_settings.cfm" Specification="2.0">
	<responsibilities>
		I compile a series of application-level variables such as datasource(s), support contacts, and other application-scoped variables. Most importantly, I specify the application attributes in the cfapplication tag.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfsilent>
<!--- Determine if application-settings may have been altered since the last time we set them. --->
<cfinclude template="qry_get_last_updated.cfm">

<cfif qry_get_last_updated.recordcount EQ 0 OR len(qry_get_last_updated.last_updated) EQ 0>
	<cfset variables.application_last_updated=createodbcdatetime(now())>
<cfelse>
	<cfset variables.application_last_updated=createodbcdatetime(qry_get_last_updated.last_updated)>
</cfif>

<!--- Build the URL comparison string we're going to use in the next step--this URL is the unique way to identify which application (and specific installation) is being accessed --->
<cfif listfindnocase(".cfm,.cfc,html,.htm",right(cgi.script_name,4))>
	<cfparam name="variables.url_base_suffix" default='#listdeleteat(cgi.script_name,listlen(cgi.script_name,"/"),"/")#'>
<cfelse>
	<cfparam name="variables.url_base_suffix" default="#cgi.script_name#">
</cfif>

<!--- Get installation details which will be saved in application-scoped variables. --->
<cfinclude template="qry_get_application_basic_details.cfm">

<cfapplication name="#left(qry_get_application_basic_details.application_name,64)#"
	applicationtimeout="#qry_get_application_basic_details.applicationtimeout#"
	clientmanagement="#qry_get_application_basic_details.clientmanagement#"
	clientstorage="#qry_get_application_basic_details.clientstorage#"
	sessionmanagement="#qry_get_application_basic_details.sessionmanagement#"
	sessiontimeout="#qry_get_application_basic_details.sessiontimeout#"
	setclientcookies="#qry_get_application_basic_details.setclientcookies#"
	setdomaincookies="#qry_get_application_basic_details.setdomaincookies#">

	<cfif NOT isdefined("application.product_name")>
		<!--- If the Application_Manager database has been updated for this installation since the last time we set application variables, the application's name will also have been updated (stored at Installation.application_name). We use this to trigger a reset of all the application variables for *this* application. --->
		<cfscript>
			application.active_ind=qry_get_application_basic_details.active_ind;
			application.application_full_name=qry_get_application_basic_details.application_name;
			application.browser_navigation_enabled_ind=qry_get_application_basic_details.browser_navigation_enabled_ind;
			application.email_password=qry_get_application_basic_details.email_password;
			application.email_port=qry_get_application_basic_details.email_port;
			application.email_server_name=qry_get_application_basic_details.email_server_name;
			application.email_username=qry_get_application_basic_details.email_username;
			application.email_usessl=qry_get_application_basic_details.email_usessl;
			application.email_usetls=qry_get_application_basic_details.email_usetls;
			application.environment_name=qry_get_application_basic_details.environment_name;
			application.error_handling_enabled_ind=qry_get_application_basic_details.error_handling_enabled_ind;
			application.host_server_name=qry_get_application_basic_details.host_server_name;
			application.inactive_link=qry_get_application_basic_details.inactive_link;
			application.installation_id=qry_get_application_basic_details.installation_id;
			application.last_updated=variables.application_last_updated;
			application.log_page_request_ind=qry_get_application_basic_details.log_page_request_ind;
			application.product_id=qry_get_application_basic_details.product_id;
			application.product_name=qry_get_application_basic_details.product_name;
			application.product_release_version=qry_get_application_basic_details.product_release_version;
		</cfscript>

		<!--- Set datasoures into application-scoped variables. --->
		<cfinclude template="qry_get_application_datasource.cfm">

		<cfset application.datasources=structNew()>
		<cfif qry_get_application_datasource.recordcount GT 0>
			<cflock type="EXCLUSIVE" scope="APPLICATION" timeout="#createtimespan(0,0,20,0)#" throwontimeout="No">
				<cfloop query="qry_get_application_datasource">
					<cfset "application.datasources.#qry_get_application_datasource.database_type_name#"=qry_get_application_datasource.datasource_name>
				</cfloop>
			</cflock>
		</cfif>

		<!--- Define list of referers from which we will accept incoming page requests --->
		<cfinclude template="qry_get_valid_referer.cfm">

		<!--- Set installation-specific variables into application-scoped variables. --->
		<cfinclude template="qry_get_application_specific_settings.cfm">

		<cfset application.application_specific_settings=structNew()>
		<cfif qry_get_application_specific_settings.recordcount GT 0>
			<cflock type="EXCLUSIVE" scope="APPLICATION" timeout="#createtimespan(0,0,20,0)#" throwontimeout="No">
				<cfloop query="qry_get_application_specific_settings">
					<cfset "application.application_specific_settings.#qry_get_application_specific_settings.setting_name#"=qry_get_application_specific_settings.setting_value>
				</cfloop>
			</cflock>
		</cfif>

		<!--- Set installation-specific support contacts into application-scoped variables. --->
		<cfinclude template="qry_get_application_support_contacts.cfm">

		<cfset application.application_support_contacts=structNew()>
		<cfset application.support_email_recipients="">
		<cflock type="EXCLUSIVE" scope="APPLICATION" timeout="#createtimespan(0,0,20,0)#" throwontimeout="No">
			<cfloop query="qry_get_application_support_contacts">

				<cfscript>
					if(qry_get_application_support_contacts.send_email_ind EQ 1)
					{
						application.support_email_recipients=listappend(application.support_email_recipients, qry_get_application_support_contacts.email);
					}

					if(not isdefined("application.application_support_contacts.#structure_contact_label#"))
					{
						application.application_support_contacts[structure_contact_label]=structnew();
						application.application_support_contacts[structure_contact_label].type="#qry_get_application_support_contacts.support_contact_type_name#";
					}
					variables.newmember=listlen(structkeylist(application.application_support_contacts[structure_contact_label]));
					application.application_support_contacts[structure_contact_label][variables.newmember]=structnew();
					application.application_support_contacts[structure_contact_label][variables.newmember].display_contact_ind=qry_get_application_support_contacts.display_contact_ind;
					application.application_support_contacts[structure_contact_label][variables.newmember].email=qry_get_application_support_contacts.email;
					application.application_support_contacts[structure_contact_label][variables.newmember].first_name=qry_get_application_support_contacts.first_name;
					application.application_support_contacts[structure_contact_label][variables.newmember].last_name=qry_get_application_support_contacts.last_name;
					application.application_support_contacts[structure_contact_label][variables.newmember].notes=qry_get_application_support_contacts.notes;
					application.application_support_contacts[structure_contact_label][variables.newmember].phone=qry_get_application_support_contacts.phone;
					application.application_support_contacts[structure_contact_label][variables.newmember].send_email_ind=qry_get_application_support_contacts.send_email_ind;
					// application.application_support_contacts[structure_contact_label][newmember].notes=qry_get_application_support_contacts.notes;
				</cfscript>
			</cfloop>
		</cflock>

	</cfif>
</cfsilent>
