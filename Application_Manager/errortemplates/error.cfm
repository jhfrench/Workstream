<!-- errortemplates/error.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="error.cfm" Specification="2.0">
	<responsibilities>
		I collect and store a wealth of information that can be used to understand that status of the application at the moment of error.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
			JF: 2/1/8
			I'm replacing client variables with session variables because it's more important for FOCUS. To do this correctly, I'd need to create the Error_Log.session_variables column, wddx the session scope into its own variable and insert that variable into the new field. Then make client wddx store client information again.
			
			JF: 6/10/8
			Reinstated client variable logging.
			
			JF: 7/30/10
			Converted to faster cfscript; split cftry into multiple blocks so one failure wouldn't wipe out other data.
			
			JF: 5/26/11
			Pulled more scopes out of main Error_Log insert and added cftry around the Error_Log updates. This should drastically cut down on the number of un-loggable errors.
		</history>
	</properties>
</fusedoc>
--->

<cfsilent>
	<cfscript>
		if(NOT isdefined("session.email_address")) {
			session.email_address="Unknown email";
		}
		if(NOT isdefined("session.first_name")) {
			session.first_name="Unknown first name";
		}
		if(NOT isdefined("session.last_name")) {
			session.last_name="Unknown last name";
		}
		if(NOT isdefined("session.user_name")) {
			if (isdefined("application.login_for_error")) {
				session.user_name=evaluate(application.login_for_error);
			}
			else {
				session.user_name="Unknown user name";
			}
		}
		if(NOT isdefined("application.product_name")) {
			application.product_name="";
		}
		if(NOT isdefined("application.email_server_name")) {
			application.email_server_name="";
		}
		
		if(NOT isdefined("application.erroremailfrom")) {
			application.erroremailfrom="#application.product_name#@nasa.gov";
		}
		if(isdefined("session.email_address")) {
			variables.reply_to=session.email_address;
		}
		else {
			variables.reply_to=application.erroremailfrom;
		}
		variables.errordate=dateformat(now(), "mm/dd/yy");
		variables.errortime=timeformat(now(), "hh:mm:ss TT");
		variables.error_diagnostics=stripcr(replacelist(error.diagnostics, "<p>,<pre>,</pre>,</P>,<hr>,<b>,</b>,<ol>,<li>,</ol>,<p>,</p>,'", ",,,,,,,,,,,,"));
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
	<cfset delete_junk=structdelete(request.safe_application,"fusebox",true)>
	<cfwddx action="cfml2wddx" input="#request.safe_application#" output="application_variables" usetimezoneinfo="no">
	
	<cfcatch type="Any">
		<!--- This is  incase the WDDX Serialization Fails--->
		<cfparam name="application_variables" default="WDDX FAILED">
	</cfcatch>
</cftry>

<cftry>
	<cfwddx action="cfml2wddx" input="#attributes#" output="attributes_variables" usetimezoneinfo="no">
	
	<cfcatch type="Any">
		<!--- This is  incase the WDDX Serialization Fails--->
		<cfparam name="attributes_variables" default="WDDX FAILED">
	</cfcatch>
</cftry>

<cftry>
	
	<!--- the next two lines are necessary to get the data stored properly so that it will display properly in the diagnostics viewer --->
	<cfset request.safe_cgi=structcopy(cgi)>
	<cfwddx action="cfml2wddx" input="#request.safe_cgi#" output="cgi_variables" usetimezoneinfo="no">
	
	<cfcatch type="Any">
		<!--- This is  incase the WDDX Serialization Fails--->
		<cfparam name="cgi_variables" default="WDDX FAILED">
	</cfcatch>
</cftry>

<cftry>
	<cfwddx action="cfml2wddx" input="#client#" output="client_variables" usetimezoneinfo="no">
	
	<cfcatch type="Any">
		<!--- This is  incase the WDDX Serialization Fails--->
		<cfparam name="client_variables" default="WDDX FAILED">
	</cfcatch>
</cftry>

<cftry>
	<cfscript>
		request.safe_error=duplicate(error);
		structdelete(request.safe_error,"GeneratedContent",true);
		structdelete(request.safe_error,"StackTrace",true);
		structdelete(request.safe_error,"RootCause",true);
	</cfscript>
	<cfwddx action="cfml2wddx" input="#request.safe_error#" output="error_variables" usetimezoneinfo="no">
	
	<cfcatch type="Any">
		<!--- This is  incase the WDDX Serialization Fails--->
		<cfparam name="error_variables" default="WDDX FAILED">
	</cfcatch>
</cftry>

<cftry>
	
	<cfwddx action="cfml2wddx" input="#form#" output="form_variables" usetimezoneinfo="no">
	
	<cfcatch type="Any">
		<!--- This is  incase the WDDX Serialization Fails--->
		<cfparam name="form_variables" default="WDDX FAILED">
	</cfcatch>
</cftry>

<cftry>
	<cfwddx action="cfml2wddx" input="#session#" output="session_variables" usetimezoneinfo="no">
	
	<cfcatch type="Any">
		<!--- This is  incase the WDDX Serialization Fails--->
		<cfparam name="session_variables" default="WDDX FAILED">
	</cfcatch>
</cftry>

<cftry>
	<cfwddx action="cfml2wddx" input="#url#" output="url_variables" usetimezoneinfo="no">
	
	<cfcatch type="Any">
		<!--- This is  incase the WDDX Serialization Fails--->
		<cfparam name="url_variables" default="WDDX FAILED">
	</cfcatch>
</cftry>

<cftry>
	<!--- delete out the local variables we just appended to the request scope --->
	<cfscript>
		structdelete(request,"__fusebox",true);
		structdelete(request,"safe_application",true);
		structdelete(request,"safe_cgi",true);
		structdelete(request,"safe_error",true);
		structdelete(request,"safe_variables",true);
	</cfscript>
	<cfwddx action="cfml2wddx" input="#request#" output="request_variables" usetimezoneinfo="no">
	
	<cfcatch type="Any">
		<!--- This is  incase the WDDX Serialization Fails--->
		<cfparam name="request_variables" default="WDDX FAILED">
	</cfcatch>
</cftry>

<!--- Insert error data into the Error_Log table --->
<cftry>
	<cftransaction>
	
		<cfquery name="insert_error_info" datasource="#application.datasources.application_manager#">
		INSERT INTO Error_Log (erroring_template, erroring_querystring, http_referer,
			diagnostics, cgi_variables, client_variables,
			url_variables, username, remote_address,
			user_browser, error_web_datetime, error_sql_datetime)
		SELECT '#variables.error_template#', '#variables.error_querystring#', '#variables.error_httpreferer#',
			'#variables.error_diagnostics#', '#cgi_variables#', '#client_variables#', 
			'#url_variables#', '#session.user_name#', '#variables.error_remoteaddress#',
			'#variables.error_browser#', TO_DATE('#DateFormat(variables.error_datetime,"yyyy-mm-dd")# #TimeFormat(variables.error_datetime,"hh:mm:ss")#','YYYY-MM-DD HH24:MI:SS'), SYSDATE
		FROM Dual
		</cfquery>
		
		<cfquery name="get_next_error_log_id" datasource="#application.datasources.application_manager#">
		SELECT error_log_seq.currval AS error_log_id
		FROM Dual
		</cfquery>
		<cfset request.error_log_id=get_next_error_log_id.error_log_id>
		
		<cftry>
			<cfquery name="insert_error_info" datasource="#application.datasources.application_manager#">
			UPDATE Error_Log
			SET session_variables=<cfqueryparam value="#session_variables#" cfsqltype="CF_SQL_CLOB">
			WHERE error_log_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#request.error_log_id#">
			</cfquery>
			
			<cfcatch type="any">
			</cfcatch>
		</cftry>
		
		<cftry>
			<cfquery name="insert_error_info" datasource="#application.datasources.application_manager#">
			UPDATE Error_Log
			SET application_variables=<cfqueryparam value="#application_variables#" cfsqltype="CF_SQL_CLOB">
			WHERE error_log_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#request.error_log_id#">
			</cfquery>
			
			<cfcatch type="any">
			</cfcatch>
		</cftry>
		
		<cftry>
			<cfquery name="insert_error_info" datasource="#application.datasources.application_manager#">
			UPDATE Error_Log
			SET attributes_variables=<cfqueryparam value="#attributes_variables#" cfsqltype="CF_SQL_CLOB">
			WHERE error_log_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#request.error_log_id#">
			</cfquery>
			
			<cfcatch type="any">
			</cfcatch>
		</cftry>
		
		<cftry>
			<cfquery name="insert_error_info" datasource="#application.datasources.application_manager#">
			UPDATE Error_Log
			SET error_variables=<cfqueryparam value="#error_variables#" cfsqltype="CF_SQL_CLOB">
			WHERE error_log_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#request.error_log_id#">
			</cfquery>
	
			<cfcatch type="any">
			</cfcatch>
		</cftry>
		
		<cftry>
			<cfquery name="insert_error_info" datasource="#application.datasources.application_manager#">
			UPDATE Error_Log
			SET form_variables=<cfqueryparam value="#form_variables#" cfsqltype="CF_SQL_CLOB">
			WHERE error_log_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#request.error_log_id#">
			</cfquery>
	
			<cfcatch type="any">
			</cfcatch>
		</cftry>
		
		<cftry>
			<cfquery name="insert_error_info" datasource="#application.datasources.application_manager#">
			UPDATE Error_Log
			SET request_variables=<cfqueryparam value="#request_variables#" cfsqltype="CF_SQL_CLOB">
			WHERE error_log_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#request.error_log_id#">
			</cfquery>
			
			<cfcatch type="any">
			</cfcatch>
		</cftry>
		
		<cftry>
			<!--- duplicate variables scope into the request scope, then clean out stuff we don't need to pare down the size; do this in descending order of size of element being cut --->
			<cfscript>
				request.safe_variables=structcopy(variables);
				structdelete(request.safe_variables,"CFERROR",true); //size~72645
				structdelete(request.safe_variables,"ERROR",true); //size~72634
				structdelete(request.safe_variables,"MYFUSEBOX",true); //size~27947
				structdelete(request.safe_variables,"__FUSEBOXAPPCFC",true); //size~11862
				structdelete(request.safe_variables,"application_variables",true); //size~6908
				structdelete(request.safe_variables,"error_variables",true); //size~5700
				structdelete(request.safe_variables,"cgi_variables",true); //size~4173
				structdelete(request.safe_variables,"session_variables",true); //size~1840
				structdelete(request.safe_variables,"EVENT",true); //size~13384
				structdelete(request.safe_variables,"attributes_variables",true); //size~638
				structdelete(request.safe_variables,"form_variables",true); //size~493
				structdelete(request.safe_variables,"ATTRIBUTES",true); //size~391
				structdelete(request.safe_variables,"url_variables",true); //size~303
				structdelete(request.safe_variables,"request_variables",true); //size~224
				structdelete(request.safe_variables,"client_variables",true); //size~220
				structdelete(request.safe_variables,"GET_NEXT_ERROR_LOG_ID",true); //size~190
				structdelete(request.safe_variables,"FUSEBOX_CALLER_PATH",true); //size~111
				structdelete(request.safe_variables,"FUSEBOX_APPLICATION_KEY",true); //size~70
				structdelete(request.safe_variables,"FUSEBOX_PARAMETERS",true); //size~64
				structdelete(request.safe_variables,"CFQUERY.EXECUTIONTIME",true); //size~63
				structdelete(request.safe_variables,"FUSEBOX_APPLICATION_PATH",true); //size~63
				structdelete(request.safe_variables,"__V",true); //size~61
				structdelete(request.safe_variables,"XFA",true); //size~46
				structdelete(request.safe_variables,"LOCALE",true); //size~8
			</cfscript>
			<cfwddx action="cfml2wddx" input="#request.safe_variables#" output="local_variables" usetimezoneinfo="no">
			
			<cfcatch type="Any">
				<cfparam name="local_variables" default="WDDX FAILED">
			</cfcatch>
		</cftry>
		
		<cfquery name="insert_error_info" datasource="#application.datasources.application_manager#">
		UPDATE Error_Log
		SET local_variables=<cfqueryparam value="#local_variables#" cfsqltype="CF_SQL_CLOB">
		WHERE error_log_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#request.error_log_id#">
		</cfquery>
	</cftransaction>
	
	<cfcatch>
		<cfoutput>
		<!---<pre>
		#CFCATCH.Detail#
		#CFCATCH.Message#
		#CFCATCH.SQLState#
		#CFCATCH.Type#
		</pre>--->
		</cfoutput>
	</cfcatch>
</cftry>

<cftry>
	<!--- This is the email that the error causes to be sent. --->
	<cfif len(application.support_email_recipients) AND len(application.email_server_name)>
		<!-- email sent to <cfoutput>#application.support_email_recipients#, from #variables.reply_to# by server #application.email_server_name#</cfoutput> -->
		<cfmail to="#application.support_email_recipients#" from="#variables.reply_to#" subject="#application.product_name# Tech Support Problem" server="#application.email_server_name#" type="HTML">
		<html>
		<head>
			<title>HITSS Application Error</title>
		</head>
		<body>
		<font face="arial" size="-1">
			HITSS product '#application.product_name#' generated the following error information:<ul>
			<b>User:</b> <a href="mailto:#session.email_address#">#session.first_name# #session.last_name#</a> 
			<br /><b>#application.product_name# Login:</b> #session.user_name#
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
			<p><b>Error ID:</b> #request.error_log_id#
			</cfif>
			<p><b>Error Datetime:</b> #variables.errordate# #variables.errortime#
			<br /><b>Browser:</b> #variables.error_browser#
			<br /><b>Template:</b> #variables.error_template#
			<br /><b>HTTPreferer:</b> #variables.error_httpreferer#
			<br /><b>Remoteaddress:</b> #variables.error_remoteaddress#
			<br /><b>Querystring:</b> #variables.error_querystring#
			<br /><b>Diagnostics:</b><ul>#variables.error_diagnostics#</ul>
			</ul>
		</font>
		</body>
		</html>
		<cfmailparam name="Reply-To" value="#variables.reply_to#">
		</cfmail>
		<!-- Email sent -->
	<cfelse>
		<!-- No email sent (no email recipients, or no email server) -->
	</cfif>
	<cfcatch>
		<cfoutput>
		<!---<pre>
		#CFCATCH.Detail#
		#CFCATCH.Message#
		#CFCATCH.SQLState#
		#CFCATCH.Type#
		</pre>--->
		</cfoutput>
	</cfcatch>
</cftry>

<cftry>
	<cfoutput>
	<html>
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
			<meta http-equiv="pragma" content="no-cache" />
			<title>HITSS Application Error</title>
			<link href="Application_Manager/errortemplates/error_stlye.css" rel="stylesheet" type="text/css" />
		</head>
		<body>
			<table class="center" width="686" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td><img src="Application_Manager/errortemplates/top.jpg" width="686" height="140" /></td>
				</tr>
				<tr>
					<td class="content">
						<p class="header">You have experienced an unexpected error. <br /></p>
						<p>The Error Reference Number is<cfif isdefined("request.error_log_id") AND len(request.error_log_id)>: #request.error_log_id#<cfelse> unknown.</cfif></p>
						<p>We apologize for the inconvenience this may cause. This page automatically sends an email to the <acronym title="Headquarters Information Technology Support Services">HITSS</acronym> Application Development department to ensure timely repair of the malfunction.</p>
						<p>If you have any questions or concerns, please feel free to contact the <a href="mailto:service@hq.nasa.gov"><acronym title="Headquarters Information Technology Support Services">HITSS</acronym> Help Desk</a><cfif isdefined("request.error_log_id") AND len(request.error_log_id)> and reference Error Reference Number #request.error_log_id#</cfif>.
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
							</cfif></p>
							<cfif len(cgi.http_referer)><p>Please click here to <a href="#listfirst(cgi.http_referer,"?")#">return to the main #application.product_name# screen</a>.</p></cfif>
					</td>
				</tr>
				<tr>
					<td><img src="Application_Manager/errortemplates/bottom.jpg" width="686" height="21" /></td>
				</tr>
			</table>
		</body>
	</html>
	</cfoutput>
	<cfcatch>
		<cfoutput>
		<!---<pre>
		#CFCATCH.Detail#
		#CFCATCH.Message#
		#CFCATCH.SQLState#
		#CFCATCH.Type#
		</pre>--->
		</cfoutput>
	</cfcatch>
</cftry>