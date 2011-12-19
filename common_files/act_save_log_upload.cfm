<!-- common_files/act_save_log_upload.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_process_upload.cfm">
	<responsibilities>
		I process the upload from the upload function.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/6/2009" role="FuseCoder" comments="Created File">
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

<!--- get template directory --->
<cfset variables.full_file_path="#GetDirectoryfromPath(GettemplatePath())#Uploaded_Files">
<cffile action="UPLOAD" destination="#variables.full_file_path#" filefield="form.my_file" nameconflict="OVERWRITE">

<cfif application.application_specific_settings.archive_data_uploads_ind EQ 1>
	<cfinclude template="act_archive_upload.cfm">
</cfif>

<cfinclude template="act_log_upload.cfm">


