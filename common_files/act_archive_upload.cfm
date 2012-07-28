<!-- common_files/act_archive_upload.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="act_archive_upload.cfm">
	<responsibilities>
		I create a copy of the file being uploaded in the system. The file should be stored under admin/upload/archive using this naming convention: archive_name=[upload_source_id]_[yyyy_mm_dd_hh_mm_ss]_replace([original file name], " ", "_").[extension] .
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="8/9/2007" role="FuseCoder" comments="Created File">
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

<!--- set the variable to use for rename --->
<cfset variables.original_file_name="#cffile.serverfile#">
<cfset variables.archived_file_name="#attributes.upload_source_id#_#dateformat(now(),"yyyy_mm_dd")#_#timeformat(now(),"hh_mm_ss")#_#replace(variables.original_file_name, " ","_","all")#">
<!--- rename the file to the new name set above --->
<cffile action="RENAME" source="#cffile.ServerDirectory#/#cffile.serverfile#" destination="#cffile.ServerDirectory#/#variables.archived_file_name#">