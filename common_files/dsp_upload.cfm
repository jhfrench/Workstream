<!-- common_files/dsp_upload.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_upload.cfm">
	<responsibilities>
		I give the user an interface for uploading data into the FAAD system.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/22/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="variables.form_fuseaction" default="Administration.process_upload">

<cfform name="admin_upload" action="index.cfm?fuseaction=#variables.form_fuseaction#" method="Post" enctype="multipart/form-data" onsubmit="return upload_file_type_check();">
<table border="0" cellspacing="0" cellpadding="0" summary="Table displays file upload form criteria until submitted." width="100%">
	<tr>
		<td id="admin_upload_table">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="#cccccc" summary="Table displays file upload form criteria">
	<tr bgcolor="999999"><th>Upload your document</th></tr>
	<tr bgcolor="#eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="Table displays files to upload">
			<tr>
				<td align="left"><label for="filebox">File to Upload</label>:</td>
				<td align="left"><input type="file" id="filebox" name="MY_FILE" alt="Please specify the filepath to the file you wish to upload." /></td>
			</tr>
			<!--- if we want the user to specify which upload they're using, show them a drop-down box with the options (this also means whatever data they use will be assigned to the program year of the date they perform the upload) --->
			<cfif get_ref_upload_source.recordcount GT 1>
			<tr>
				<td align="left"><label for="upload_source_id">Insert Type</label>:</td>
				<td align="left">
					<select name="upload_source_id" id="upload_source_id">
						<option value="">--Select Type--</option>
						<cfoutput query="get_ref_upload_source">
						<option value="#upload_source_id#">#upload_source#</option>
						</cfoutput>
					</select>
				</td>
			</tr>
			<cfelse>
				<input type="hidden" name="upload_source_id" value="<cfoutput>#get_ref_upload_source.upload_source_id#</cfoutput>" />
			</cfif>
		</table>
		</td>
	</tr>
	<tr bgcolor="#dddddd">
		<td align="center">
		<cfoutput>
			<cfif isdefined("attributes.parent_business_id")>
			<input type="hidden" name="parent_business_id" value="#attributes.parent_business_id#" />
			</cfif>
			<cfif isdefined("attributes.upload_id")>
			<input type="hidden" name="upload_id" value="#attributes.upload_id#" />
			</cfif>
			<cfif isdefined("attributes.upload_source_type_id")>
			<input type="hidden" name="upload_source_type_id" value="#attributes.upload_source_type_id#" />
			</cfif>
			<input type="submit" name="upload_file" value="Upload File" class="btn btn-primary" />
			<input type="reset" value="Cancel" class="btn" />
		</cfoutput> 
		</td>
	</tr>
</table>
		</td>
	</tr>
	<tr id="upload_in_progress" style="display:none">
		<td align="center">
			<h2>Loading your file</h2>
			<img src="images/loading.gif" alt="Animated gif that shows a gear and reads Loading your file" width="48" height="48" style="padding:30px;" align="center">
		</td>
	</tr>
</table>
</cfform>

