<!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>
<!-- common_files/pag_process_upload.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_vendor_upload.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/2/2009" role="FuseCoder" comments="Created File">
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
	variables.set_upload_id_declared_ind=0;
	if (NOT isdefined("attributes.upload_id"))
		attributes.upload_id=0;
	if (NOT isdefined("attributes.delete_ind"))
		attributes.delete_ind=0;
	if (NOT isdefined("attributes.upload_source_type_id"))
		attributes.upload_source_type_id=1;
	if (NOT isdefined("attributes.show_upload_form_ind"))
		attributes.show_upload_form_ind=1;
</cfscript>
<cfsetting showdebugoutput="no">

<head>
	<title>#application.product_name#</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta http-equiv="expires" content="{ts '2009-07-20 15:16:03'}" />
	<!--Meta Data starts-->
	<!--SYSTEM DEFINED METADATA-->
	<meta name="dc.title" content="#application.product_name#" />
	<meta name="dc.format" content="text/html" />
	<meta name="dc.date.modified" content="{ts '2009-07-20 15:14:14'}" />
	<meta name="dc.language" content="en" />
	<meta name="dc.publisher" content="#application.application_specific_settings.official#" />
	<!--Meta Data ends-->
	<link href="//s3.amazonaws.com/Workstream/images/workstream_icon.ico" rel="SHORTCUT ICON" />
	<style type="text/css">
	body {background-color:#FFFFFF; margin:0px;}
	body, table, td, form, input, select, h1, h2, h3, h4, h5, h6, pre {font-family:Arial; font-size:12px; color:#000000;}
	/* Netscape 4 font-size fix */
	html body, html table, html td, html input, html select, html h1, html h2, html h3, html h4, html h5, html h6 {font-size:11px;}
	body, form {margin:0px; padding:0px;}
	/* Modified to make default link behave like featureLnk */
	a {color:#006699;text-decoration:none;}
	</style>
</head>
<body onLoad="set_upload_id();">
<cfif attributes.delete_ind>
	<cfinclude template="act_change_parent_url.cfm">
	<cfquery name="deactivate_log_upload" datasource="#application.datasources.main#">
	UPDATE LOG_Upload
	SET active_ind=0
	WHERE active_ind=1
		AND upload_id IN (<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#attributes.delete_upload_id#" />)
	</cfquery>
	<cfquery name="get_ref_upload_source" datasource="#application.datasources.main#">
	INSERT INTO LOG_Upload (original_file_name, archived_file_name, upload_source_id,
		created_by, active_ind)
	SELECT original_file_name, archived_file_name, upload_source_id,
		<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" /> AS created_by, 0 AS active_ind
	FROM LOG_Upload
	WHERE upload_id IN (<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#attributes.delete_upload_id#" />)
	</cfquery>
<cfelseif isdefined("form.my_file")>
	<cfinclude template="act_change_parent_url.cfm">
	<cfset variables.upload_id=attributes.upload_id>
	<cfinclude template="act_save_log_upload.cfm">

	<cfif isdefined("attributes.parent_business_id")>
		<cfinclude template="qry_insert_link_business_upload.cfm">
	</cfif>

	<cfset attributes.upload_id=listappend(variables.upload_id, attributes.upload_id)>
<cfelse>
	<cfset attributes.upload_id=0>
</cfif>

<cfswitch expression="#attributes.upload_source_type_id#">
	<cfcase value="1">
		<cfinclude template="../common_files/qry_get_business_upload.cfm">
		<cfif get_business_upload.recordcount>
			Vendor's document(s):<ul>
			<cfoutput query="get_business_upload">
			<li><a href="Uploaded_Files/#archived_file_name#" target="document_#upload_id#">#original_file_name#</a>&nbsp;&nbsp;<cfif attributes.show_upload_form_ind><a href="javascript:delete_document(#upload_id#);">Delete</a></cfif></li>
			</cfoutput>
			</ul></cfoutput>
		<cfelse>
			This vendor has not uploaded any documents into <cfoutput>#application.product_name#.
		</cfif>
	</cfcase>
	<cfcase value="2">
		<cfinclude template="../common_files/qry_get_upload_file.cfm">
		<cfif get_upload_file.recordcount>
			<script type="text/javascript">
			function set_upload_id(){
				top.document.getElementById('upload_id').value=top.document.getElementById('upload_id').value+',<cfoutput>#attributes.upload_id#</cfoutput>';
			}
			</script>
			<cfset variables.set_upload_id_declared_ind=1>
			Uploaded document(s):<ul>
			<cfoutput query="get_upload_file">
			<li><a href="Uploaded_Files/#archived_file_name#" target="document_#upload_id#">#original_file_name#</a>&nbsp;&nbsp;<cfif attributes.show_upload_form_ind><a href="javascript:delete_document(#upload_id#);">Delete</a></cfif></li>
			</cfoutput>
			</ul>
		</cfif>
	</cfcase>
	<cfcase value="3">
		<cfinclude template="../common_files/qry_get_upload_file.cfm">
		<cfif get_upload_file.recordcount>
			<script type="text/javascript">
			function set_upload_id(){
				top.document.getElementById('upload_id').value=top.document.getElementById('upload_id').value+',<cfoutput>#attributes.upload_id#</cfoutput>';
			}
			</script>
			<cfset variables.set_upload_id_declared_ind=1>
			<ul>
			<cfoutput query="get_upload_file">
			<li><a href="Uploaded_Files/#archived_file_name#" target="document_#upload_id#">#original_file_name#</a>&nbsp;&nbsp;<cfif attributes.show_upload_form_ind><a href="javascript:delete_document(#upload_id#);">Delete</a></cfif></li>
			</cfoutput>
			</ul>
		</cfif>
	</cfcase>
	<cfdefaultcase>
		UNDEFINED UPLOAD SOURCE TYPE
	</cfdefaultcase>
</cfswitch>

<cfscript>
	attributes.function_name="delete_document";
	attributes.fuseaction="common_files.process_upload";
	attributes.field_name="delete_upload_id";
	attributes.field_value="";
	attributes.process_form_ind=1;
	attributes.delete_ind=1;
</cfscript>
<cfinclude template="../common_files/act_drilldown_form.cfm">

<cfif NOT variables.set_upload_id_declared_ind>
	<script type="text/javascript">
	function set_upload_id(){
		return true;
	}
	</script>
</cfif>

<cfif attributes.show_upload_form_ind>
	<cfset variables.form_fuseaction="common_files.process_upload">
	<cfset attributes.upload_source_id=2>
	<cfinclude template="../common_files/act_upload.cfm">
	<cfinclude template="../common_files/dsp_upload.cfm">
</cfif>

</body>
</html>