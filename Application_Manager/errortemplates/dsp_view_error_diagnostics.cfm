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
			document.form_view_error_diagnostics.submit();
		}

		function submit_form(){
			if(document.form_view_error_diagnostics.error_log_id.value){
				document.form_view_error_diagnostics.display_all.value='#attributes.display_all#';
				document.form_view_error_diagnostics.submit();
			}else{
				alert("Please enter error number to search for!");
			}
		}
	</script>

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
		WHERE error_log_id=<cfqueryparam value="#attributes.error_log_id#" cfsqltype="cf_sql_integer" />
		</cfquery>

		<cfquery name="get_previous_error_log" datasource="#application.datasources.application_manager#">
		SELECT COALESCE(MAX(error_log_id),0) AS error_log_id
		FROM Error_Log
		WHERE error_log_id < <cfqueryparam value="#attributes.error_log_id#" cfsqltype="cf_sql_integer" />
		</cfquery>

		<cfquery name="get_next_error_log" datasource="#application.datasources.application_manager#">
		SELECT COALESCE(MIN(error_log_id),0) AS error_log_id
		FROM Error_Log
		WHERE error_log_id > <cfqueryparam value="#attributes.error_log_id#" cfsqltype="cf_sql_integer" />
		</cfquery>
		<cfcatch type="Any">
			<strong>The query did not run, you forgot to specify a valid error number!</strong>
			<cfabort>
		</cfcatch>
	</cftry>
</cfif>
<form name="form_view_error_diagnostics" id="form_view_error_diagnostics" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post" class="well form-inline">
	<label class="control-label" for="error_log_id">Error Reference Number</label>
	<cfif isdefined("get_previous_error_log")><a href="index.cfm?fuseaction=#attributes.fuseaction#&display_all=0&error_log_id=#get_previous_error_log.error_log_id#">&lt; last</a>&nbsp;</cfif>
	<input type="number" name="error_log_id" id="error_log_id" value="#attributes.error_log_id#" step="1" min="0" class="number span1" />
	&nbsp;<a href="index.cfm?fuseaction=#attributes.fuseaction#&display_all=0&error_log_id=<cfif isdefined("get_next_error_log") AND get_next_error_log.error_log_id NEQ 0>#get_next_error_log.error_log_id#<cfelse>#attributes.error_log_id+1#</cfif>"><cfif NOT isdefined("get_next_error_log") OR get_next_error_log.error_log_id EQ 0>try </cfif>next &gt;</a>
	<fieldset>
		<legend class="control-label">Display All <abbr title="Web Distributed Data eXchange">WDDX</abbr></legend>
		<label for="display_all1" class="radio inline"><input type="radio" name="display_all" id="display_all1" value="1" onclick="javascript:document.form_view_error_diagnostics.submit();"<cfif attributes.display_all> checked="checked"</cfif> /> Yes</label>
		<label for="display_all0" class="radio inline"><input type="radio" name="display_all" id="display_all0" value="0" onclick="javascript:document.form_view_error_diagnostics.submit();"<cfif NOT attributes.display_all> checked="checked"</cfif> /> No</label>
	</fieldset><!---
	<label class="control-label" for="error_log_id">Select application installation</label>
	<select name="installation_id" id="installation_id" size="1">
		<cfloop query="qry_get_error_diagnostics_datasource"><option value="#installation_id#"<cfif comparenocase(attributes.installation_id,installation_id) EQ 0> selected="selected"</cfif>>#product_name# #environment_name#, (#url_to_base#)</option>
		</cfloop>
	</select> --->
	<input type="button" value="Submit" onclick="submit_form()" class="btn btn-primary" />
</form>

<hr>
<cfif isdefined("attributes.error_log_id") AND len(attributes.error_log_id)>
	<cfset variables.always_show_these_columns="diagnostics,error_sql_datetime,erroring_querystring,http_referer,querystring,remote_address,username">
	<cfset variables.expand_when_view_all="attributes_variables,error_variables">

	<cfif attributes.display_all EQ true>
		<h2 id="links">Quick Links</h2>
		<ul>
		<cfloop list="#qry_get_error_log_details.columnlist#" index="ii">
			<li><a href="###ii#">#ii#</a></li>
		</cfloop>
		</ul>
	</cfif>
	<h1>Error Reference Number <small>#attributes.error_log_id#</small></h1>
<hr>
	<cfif isdefined("qry_get_error_log_details") AND qry_get_error_log_details.recordcount>
		<cfloop list="#qry_get_error_log_details.columnlist#" index="ii">
			<cfif attributes.display_all EQ true OR listfindnocase(variables.always_show_these_columns, ii)>
				<h3 id="#ii#">#ii# <small><a id="#ii#" href="##links">back to links</a></small></h3>
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
