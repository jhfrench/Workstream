<!-- errortemplates/dsp_view_error_diagnostics.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="dsp_view_error_diagnostics.cfm" Specification="2.0">
	<responsibilities>
		I retrieve and display information about the status and settings of an application at the moment of an error.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfoutput><!---
	<cfparam name="attributes.installation_id" default="0"> --->
	<cfparam name="attributes.display_all" default="0">
	<cfparam name="attributes.error_log_id" default="0">
	<cfif isdefined("url.error_log_id")><!---
		<cfset attributes.installation_id=url.installation_id> --->
		<cfset attributes.display_all=url.display_all>
		<cfset attributes.error_log_id=url.error_log_id>
	<cfelseif isdefined("form.error_log_id")><!---
		<cfset attributes.installation_id=form.installation_id> --->
		<cfset attributes.display_all=form.display_all>
		<cfset attributes.error_log_id=form.error_log_id>
	</cfif>
	<script language="JavaScript">
		function display_all(){
			document.whatever.submit();
		}

		function submit_form(){
			if(document.whatever.error_log_id.value){
				document.whatever.display_all.value='#attributes.display_all#';
				document.whatever.submit();
			}else{
				alert("Please enter error number to search for!");
			}

		}
	</script>
	<style>
	label {
	padding: 0 2em 0 0;
	font-family: Tacoma, Arial;
	font-size: 16px;
	font-weight: bold;
	}

	a {
	font-family: Tacoma, Arial;
	font-size: 14px;
	}
	</style>
</head>

<body>

<!--- <cfquery name="qry_get_error_diagnostics_datasource" datasource="#application.datasources.application_manager#">
SELECT Installation.installation_id, Product.product_name, REF_Environment.environment_name,
	Installation_URL.url_to_base
FROM Installation
	INNER JOIN Product ON Installation.product_id=Product.product_id
	INNER JOIN REF_Environment ON Installation.environment_id=REF_Environment.environment_id
	INNER JOIN Installation_URL ON Installation.installation_id=Installation_URL.installation_id
WHERE Installation.active_ind=1
	AND Product.active_ind=1
ORDER BY Product.product_name, REF_Environment.sort_order, Installation_URL.url_to_base, Installation.installation_id
</cfquery> --->

<cfif isdefined("attributes.error_log_id") AND len(attributes.error_log_id)>
	<cftry>
		<cfquery name="qry_get_error_log_details" datasource="#application.datasources.application_manager#">
		SELECT *
		FROM Error_Log
		WHERE error_log_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.error_log_id#">
		</cfquery>

		<cfquery name="get_previous_error_log" datasource="#application.datasources.application_manager#">
		SELECT COALESCE(MAX(error_log_id),0) AS error_log_id
		FROM Error_Log
		WHERE error_log_id < <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.error_log_id#">
		</cfquery>

		<cfquery name="get_next_error_log" datasource="#application.datasources.application_manager#">
		SELECT COALESCE(MIN(error_log_id),0) AS error_log_id
		FROM Error_Log
		WHERE error_log_id > <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.error_log_id#">
		</cfquery>
		<cfcatch type="Any">
			<strong>The query did not run, you forgot to specify a valid error number!</strong>
			<cfabort>
		</cfcatch>
	</cftry>
</cfif>
<form name="whatever" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post" class="struct">
	<!--- <label>Select application installation</label>:
	<select name="installation_id" size="1">
		<cfloop query="qry_get_error_diagnostics_datasource"><option value="#installation_id#"<cfif comparenocase(attributes.installation_id,installation_id) EQ 0> selected="selected"</cfif>>#product_name# #environment_name#, (#url_to_base#)</option>
		</cfloop>
	</select>
	<br /> --->
	<label for="error_log_id">Enter error number</label>:
	<cfif isdefined("get_previous_error_log")>
		&lt;<a href="index.cfm?fuseaction=#attributes.fuseaction#&display_all=0&error_log_id=#get_previous_error_log.error_log_id#">last</a>&nbsp;
	</cfif>
	<input type="text" name="error_log_id" id="error_log_id" value="#attributes.error_log_id#" size="6" class="wddx" />

		&nbsp;<a href="index.cfm?fuseaction=#attributes.fuseaction#&display_all=0&error_log_id=<cfif isdefined("get_next_error_log") AND get_next_error_log.error_log_id NEQ 0>#get_next_error_log.error_log_id#<cfelse>#attributes.error_log_id+1#</cfif>"><cfif NOT isdefined("get_next_error_log") OR get_next_error_log.error_log_id EQ 0>try </cfif>next</a>&gt;

	<br />
	<label for="display_all">Display All WDDX</label>:
	Yes <input type="radio" value="1" id="display_all" name="display_all" onclick="javascript:document.whatever.submit();"<cfif attributes.display_all> checked="checked"</cfif> />
	No <input type="radio" value="0" id="display_all" name="display_all" onclick="javascript:document.whatever.submit();"<cfif NOT attributes.display_all> checked="checked"</cfif> />
	<br />
	<input type="button" value="Submit" onclick="submit_form()" class="btn btn-primary" />
</form>

<hr>
<cfif isdefined("attributes.error_log_id") AND len(attributes.error_log_id)>
	<cfset variables.always_show_these_columns="diagnostics,error_sql_datetime,erroring_querystring,http_referer,querystring,remote_address,username">
	<cfset variables.expand_when_view_all="attributes_variables,error_variables">

	<cfif attributes.display_all EQ true>
		<label><a name="links"></a>Quick Links</label>
		<ul>
		<cfloop list="#qry_get_error_log_details.columnlist#" index="ii">
			<li><a href="###ii#">#ii#</a></li>
		</cfloop>
		</ul>
	</cfif>
	<br />error_log_id=#attributes.error_log_id#<br />

<hr>
	<cfif isdefined("qry_get_error_log_details") AND qry_get_error_log_details.recordcount>
		<cfloop list="#qry_get_error_log_details.columnlist#" index="ii">
			<cfif attributes.display_all EQ true OR listfindnocase(variables.always_show_these_columns, ii)>
				<br /><a name="#ii#" href="##links">#ii#</a> =
				<cftry>
					<cfif attributes.display_all EQ true AND listfindnocase(variables.expand_when_view_all, ii)>
						<cfdump var="#qry_get_error_log_details[ii][1]#" expand="yes">
					<cfelseif attributes.display_all EQ true>
						<cfdump var="#qry_get_error_log_details[ii][1]#" expand="No">
					<cfelseif listfindnocase(variables.always_show_these_columns, ii)>
						<cfdump var="#qry_get_error_log_details[ii][1]#">
					</cfif>
					<cfcatch>
						ERROR DUMPING VARIABLE Content=<xmp>#qry_get_error_log_details[ii][1]#</xmp>
					</cfcatch>
				</cftry>
			</cfif>
		</cfloop>
	</cfif>
</cfif>
</cfoutput>
