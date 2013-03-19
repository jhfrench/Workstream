<!-- errortemplates/error.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="error.cfm" Specification="2.0">
	<responsibilities>
		I collect and store a wealth of information that can be used to understand that status of the application at the moment of error.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfsilent>
	<cfscript>
		if(not isdefined("session.email_address")) {
			session.email_address="Unknown email";
		}
		if(not isdefined("session.first_name")) {
			session.first_name="Unknown first name";
		}
		if(not isdefined("session.last_name")) {
			session.last_name="Unknown last name";
		}
		if(not isdefined("session.user_name")) {
			session.user_name="Unknown user name";
		}
		if(not isdefined("application.product_name")) {
			application.product_name="";
		}
		if(not isdefined("application.system_email_sender")) {
			application.system_email_sender="workstream@appliedinter.net";
		}
		if(not isdefined("application.email_server_name")) {
			application.email_server_name="";
		}
		variables.errordate=dateformat(now(), "m/d/yyyy");
		variables.errortime=timeformat(now(), "hh:mm:ss TT");
		variables.error_diagnostics=stripcr(ReplaceList(error.diagnostics, "<p>,<pre>,</pre>,</P>,<hr>,<strong>,</strong>,<ol>,<li>,</ol>,<p>,</p>,'", ",,,,,,,,,,,,"));
		variables.error_querystring=error.querystring;
		variables.error_remoteaddress=error.remoteaddress;
		variables.error_httpreferer=error.httpreferer;
		variables.error_template=error.template;
		variables.error_browser=error.browser;
		variables.error_datetime=error.datetime;
	</cfscript>
</cfsilent>

<cftry>
	<cfset request.safe_application=structcopy(application)>
	<cfset delete_junk=StructDelete(request.safe_application,"fusebox",true)>
	<cfwddx action="cfml2wddx" input="#request.safe_application#" output="application_variables" usetimezoneinfo="no">

	<cfcatch type="Any">
		<!--- This is incase the WDDX Serialization Fails--->
		<cfparam name="application_variables" default="WDDX FAILED">
	</cfcatch>
</cftry>

<cftry>
	<cfwddx action="cfml2wddx" input="#attributes#" output="attributes_variables" usetimezoneinfo="no">

	<cfcatch type="Any">
		<!--- This is incase the WDDX Serialization Fails--->
		<cfparam name="attributes_variables" default="WDDX FAILED">
	</cfcatch>
</cftry>

<cftry>

	<!--- the next two lines are necessary to get the data stored properly so that it will display properly in the diagnostics viewer --->
	<cfset request.safe_cgi=structcopy(cgi)>
	<cfwddx action="cfml2wddx" input="#request.safe_cgi#" output="cgi_variables" usetimezoneinfo="no">

	<cfcatch type="Any">
		<!--- This is incase the WDDX Serialization Fails--->
		<cfparam name="cgi_variables" default="WDDX FAILED">
	</cfcatch>
</cftry>

<cftry>
	<cfwddx action="cfml2wddx" input="#client#" output="client_variables" usetimezoneinfo="no">

	<cfcatch type="Any">
		<!--- This is incase the WDDX Serialization Fails--->
		<cfparam name="client_variables" default="WDDX FAILED">
	</cfcatch>
</cftry>

<cftry>
	<cfscript>
		request.safe_error=duplicate(error);
		StructDelete(request.safe_error,"GeneratedContent",true);
		StructDelete(request.safe_error,"StackTrace",true);
		StructDelete(request.safe_error,"RootCause",true);
	</cfscript>
	<cfwddx action="cfml2wddx" input="#request.safe_error#" output="error_variables" usetimezoneinfo="no">

	<cfcatch type="Any">
		<!--- This is incase the WDDX Serialization Fails--->
		<cfparam name="error_variables" default="WDDX FAILED">
	</cfcatch>
</cftry>

<cftry>

	<cfwddx action="cfml2wddx" input="#form#" output="form_variables" usetimezoneinfo="no">

	<cfcatch type="Any">
		<!--- This is incase the WDDX Serialization Fails--->
		<cfparam name="form_variables" default="WDDX FAILED">
	</cfcatch>
</cftry>

<cftry>
	<cfwddx action="cfml2wddx" input="#session#" output="session_variables" usetimezoneinfo="no">

	<cfcatch type="Any">
		<!--- This is incase the WDDX Serialization Fails--->
		<cfparam name="session_variables" default="WDDX FAILED">
	</cfcatch>
</cftry>

<cftry>
	<cfwddx action="cfml2wddx" input="#url#" output="url_variables" usetimezoneinfo="no">

	<cfcatch type="Any">
		<!--- This is incase the WDDX Serialization Fails--->
		<cfparam name="url_variables" default="WDDX FAILED">
	</cfcatch>
</cftry>

<cftry>
	<!--- delete out the local variables we just appended to the request scope --->
	<cfscript>
		StructDelete(request,"__fusebox",true);
		StructDelete(request,"safe_application",true);
		StructDelete(request,"safe_cgi",true);
		StructDelete(request,"safe_error",true);
		StructDelete(request,"safe_variables",true);
	</cfscript>
	<cfwddx action="cfml2wddx" input="#request#" output="request_variables" usetimezoneinfo="no">

	<cfcatch type="Any">
		<!--- This is incase the WDDX Serialization Fails--->
		<cfparam name="request_variables" default="WDDX FAILED">
	</cfcatch>
</cftry>

<!--- Insert error data into the Error_Log table --->
		<cfquery name="insert_error_info" datasource="#application.datasources.application_manager#">
		INSERT INTO Error_Log (installation_id, erroring_template, erroring_querystring, 
			http_referer, diagnostics, application_variables,
			attributes_variables, cgi_variables, client_variables,
			form_variables, request_variables, session_variables,
			url_variables, username, remote_address,
			user_browser, error_web_datetime, error_sql_datetime)
		VALUES(#application.installation_id#, '#variables.error_template#', '#variables.error_querystring#',
			'#variables.error_httpreferer#','#variables.error_diagnostics#', '#application_variables#',
			'#attributes_variables#', '#cgi_variables#', '#client_variables#', 
			'#form_variables#', '#request_variables#', '#session_variables#',
			'#url_variables#', '#session.user_name#', '#variables.error_remoteaddress#',
			'#variables.error_browser#', '#dateformat(variables.error_datetime, 'yyyy-mm-dd')# #timeformat(now(), 'hh:mm:ss')#', CURRENT_TIMESTAMP)
		</cfquery>
<cftry>
	<cfquery name="get_next_error_log_id" datasource="#application.datasources.application_manager#">
	SELECT CURRVAL('Error_Log_error_log_id_SEQ') AS error_log_id
	</cfquery>
	<cfset request.error_log_id=get_next_error_log_id.error_log_id>

	<cfquery name="insert_error_info" datasource="#application.datasources.application_manager#">
	UPDATE Error_Log
	SET error_variables='#error_variables#'
	WHERE error_log_id=#request.error_log_id#
	</cfquery>


	<cftry>
		<!--- duplicate variables scope into the request scope, then clean out stuff we don't need to pare down the size; do this in descending order of size of element being cut --->
		<cfscript>
			request.safe_variables=structcopy(variables);
			StructDelete(request.safe_variables,"CFERROR",true); //size~72645
			StructDelete(request.safe_variables,"ERROR",true); //size~72634
			StructDelete(request.safe_variables,"MYFUSEBOX",true); //size~27947
			StructDelete(request.safe_variables,"__FUSEBOXAPPCFC",true); //size~11862
			StructDelete(request.safe_variables,"application_variables",true); //size~6908
			StructDelete(request.safe_variables,"error_variables",true); //size~5700
			StructDelete(request.safe_variables,"cgi_variables",true); //size~4173
			StructDelete(request.safe_variables,"session_variables",true); //size~1840
			StructDelete(request.safe_variables,"EVENT",true); //size~13384
			StructDelete(request.safe_variables,"attributes_variables",true); //size~638
			StructDelete(request.safe_variables,"form_variables",true); //size~493
			StructDelete(request.safe_variables,"ATTRIBUTES",true); //size~391
			StructDelete(request.safe_variables,"url_variables",true); //size~303
			StructDelete(request.safe_variables,"request_variables",true); //size~224
			StructDelete(request.safe_variables,"client_variables",true); //size~220
			StructDelete(request.safe_variables,"GET_NEXT_ERROR_LOG_ID",true); //size~190
			StructDelete(request.safe_variables,"FUSEBOX_CALLER_PATH",true); //size~111
			StructDelete(request.safe_variables,"FUSEBOX_APPLICATION_KEY",true); //size~70
			StructDelete(request.safe_variables,"FUSEBOX_PARAMETERS",true); //size~64
			StructDelete(request.safe_variables,"cfquery.EXECUTIONTIME",true); //size~63
			StructDelete(request.safe_variables,"FUSEBOX_APPLICATION_PATH",true); //size~63
			StructDelete(request.safe_variables,"__V",true); //size~61
			StructDelete(request.safe_variables,"XFA",true); //size~46
			StructDelete(request.safe_variables,"LOCALE",true); //size~8
		</cfscript>
		<cfwddx action="cfml2wddx" input="#request.safe_variables#" output="local_variables" usetimezoneinfo="no">

		<cfcatch type="Any">
			<cfparam name="local_variables" default="WDDX FAILED">
		</cfcatch>
	</cftry>

	<cfquery name="insert_error_info" datasource="#application.datasources.application_manager#">
	UPDATE Error_Log
	SET local_variables='#local_variables#'
	WHERE error_log_id=#request.error_log_id#
	</cfquery>

	<cfcatch><!--- 
		<cfoutput>
		<pre>
		#CFCATCH.Detail#
		#CFCATCH.Message#
		#CFCATCH.SQLState#
		#CFCATCH.Type#
		</pre>
		</cfoutput> --->
		<!-- Database save failed -->
	</cfcatch>
</cftry>

<cftry>
	<!--- This is the email that the error causes to be sent. --->
	<cfif len(application.support_email_recipients) AND len(application.email_server_name)>
		<!-- email sent to <cfoutput>#application.support_email_recipients#, from #application.system_email_sender# by server #application.email_server_name#</cfoutput> -->
		<cfmail to="#application.support_email_recipients#" from="#application.system_email_sender#" subject="#application.product_name# Tech Support Problem" type="HTML"
			server="#application.email_server_name#" username="#application.email_username#" password="#application.email_password#"
			port="#application.email_port#" usetls="#application.email_usetls#" usessl="#application.email_usessl#">
		<html>
		<head>
			<title>AIT Application Error</title>
		</head>
		<body>
		<font face="arial" size="-1">
			AIT product '#application.product_name#' generated the following error information:<ul>
			<strong>User:</strong> <a href="mailto:#session.email_address#">#session.first_name# #session.last_name#</a> 
			<br /><strong>#application.product_name# username:</strong> #session.user_name#
			<cfif isdefined("application.application_support_contacts")>
				<cfloop list="#structKeyList(application.application_support_contacts)#" index="contact_type_ii">
					<cfset variables.contact_list_legth=listlen(structkeylist(application.application_support_contacts[contact_type_ii])) - 1>
					<ul>
						<strong><cfif comparenocase(contact_type_ii, "Customer") NEQ 0>#application.application_support_contacts[contact_type_ii].type# <cfelse>#application.product_name#</cfif> Contact<cfif variables.contact_list_legth GT 1>s</cfif>:</strong>
						<cfloop from="1" to="#variables.contact_list_legth#" index="contact_ii">
							<ul>
								#application.application_support_contacts[contact_type_ii][contact_ii].first_name# #application.application_support_contacts[contact_type_ii][contact_ii].last_name#<br /><cfif application.application_support_contacts[contact_type_ii][contact_ii].send_email_ind AND len(application.application_support_contacts[contact_type_ii][contact_ii].email)>
								<a href="mailto:#application.application_support_contacts[contact_type_ii][contact_ii].email#">#application.application_support_contacts[contact_type_ii][contact_ii].email#</a><br /></cfif>
								<cfif len(application.application_support_contacts[contact_type_ii][contact_ii].phone)>Phone: #application.application_support_contacts[contact_type_ii][contact_ii].phone#</cfif>
							</ul>
							<br />
						</cfloop>
					</ul>
				</cfloop>
			</cfif>

			<cfif isdefined("request.error_log_id") AND len(request.error_log_id)>
			<p><strong>Error ID:</strong> #request.error_log_id#
			</cfif>
			<p><strong>Error Datetime:</strong> #variables.errordate# #variables.errortime#
			<br /><strong>Browser:</strong> #variables.error_browser#
			<br /><strong>Template:</strong> #variables.error_template#
			<br /><strong>HTTPreferer:</strong> #variables.error_httpreferer#
			<br /><strong>Remoteaddress:</strong> #variables.error_remoteaddress#
			<br /><strong>Querystring:</strong> #variables.error_querystring#
			<br /><strong>Diagnostics:</strong><ul>#variables.error_diagnostics#</ul>
			</ul>
		</font>
		</body>
		</html>
		<cfmailparam name="Reply-To" value="#application.system_email_sender#">
		</cfmail>
	<cfelse>
		<!-- No email sent (no email recipients, or no email server) -->
	</cfif>
	<cfcatch>
		<cfoutput>
		<!-- 
		#CFCATCH.Detail#
		#CFCATCH.Message#
		#CFCATCH.SQLState#
		#CFCATCH.Type#
		 -->
		</cfoutput>
	</cfcatch>
</cftry>

<cftry>
	<cfoutput><!DOCTYPE html>
	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>AIT Application Error</title>
		<link rel="stylesheet" href="Application_Manager/errortemplates/error_style.css">
	</head>
	
	<body class="warning">
	<section class="center">
		<div class="error_header">
			<img src="Application_Manager/images/gears1.png" alt="" width="64" height="64" />
		</div>
		<div class="content">
			<p class="header">You have encountered an unexpected error.</p>
			<p>The Error Reference Number is<cfif isdefined("request.error_log_id") AND len(request.error_log_id)>: #request.error_log_id#<cfelse> unknown.</cfif></p>
			<p>We apologize for the inconvenience this has caused you. <cfif len(application.support_email_recipients) AND len(application.email_server_name)>This page automatically sends a notification to the <abbr title="Applied Internet Technologies">AIT</abbr> Application Development department to ensure timely repair of the malfunction.</p>
			<p></cfif>If you have any questions or concerns, please feel free to contact the <a href="mailto:info@appliedinter.net"><abbr title="Applied Internet Technologies">AIT</abbr> Help Desk</a><cfif isdefined("request.error_log_id") AND len(request.error_log_id)> and reference Error Reference Number #request.error_log_id#</cfif>.
				<!--- the very same code as above --->
				<cfif isdefined("application.application_support_contacts")>
					<cfloop list="#structKeyList(application.application_support_contacts)#" index="contact_type_ii">
						<cfset variables.contact_list_legth=listlen(structkeylist(application.application_support_contacts[contact_type_ii])) - 1>
						<ul>
							<strong><cfif comparenocase(contact_type_ii, "Customer") NEQ 0>#application.application_support_contacts[contact_type_ii].type# <cfelse>#application.product_name#</cfif> Contact<cfif variables.contact_list_legth GT 1>s</cfif>:</strong>
							<cfloop from="1" to="#variables.contact_list_legth#" index="contact_ii">
								<ul>
									#application.application_support_contacts[contact_type_ii][contact_ii].first_name# #application.application_support_contacts[contact_type_ii][contact_ii].last_name#<br /><cfif application.application_support_contacts[contact_type_ii][contact_ii].send_email_ind AND len(application.application_support_contacts[contact_type_ii][contact_ii].email)>
									<a href="mailto:#application.application_support_contacts[contact_type_ii][contact_ii].email#">#application.application_support_contacts[contact_type_ii][contact_ii].email#</a><br /></cfif>
									<cfif len(application.application_support_contacts[contact_type_ii][contact_ii].phone)>Phone: #application.application_support_contacts[contact_type_ii][contact_ii].phone#</cfif>
								</ul>
								<br />
							</cfloop>
						</ul>
					</cfloop>
				</cfif>
			</p>
			<cfif len(cgi.http_referer)><p>Please click here to <a href="#listfirst(cgi.http_referer,"?")#">return to the main #application.product_name# screen</a>.</p></cfif>
		</div>
	</section>
	</body>
	</html>
	</cfoutput>
	<cfcatch>
		<cfoutput>
		<!-- 
		#CFCATCH.Detail#
		#CFCATCH.Message#
		#CFCATCH.SQLState#
		#CFCATCH.Type#
		 -->
		</cfoutput>
	</cfcatch>
</cftry>