
<!--Timekeeping/dsp_project_files.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve and display all the files from the public directory of the customer.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
</cfsilent>
<cfset dir_to_go_to = '\\192.168.0.152\attatched_files\workstream\Project_Planning\' & <!--- #variables.company# --->#attributes.project_planning_id# & '\'>
<cfdirectory action="LIST" directory="#dir_to_go_to#" name="project_files">
<table class="table table-striped table-bordered">
	<caption>Associated files</caption>
	<thead>
		<tr>
			<th>Name</th>
			<th>Last Modified</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="project_files">
		<cfset variables.file_img="na">
		<cfif listfindnocase(application.application_specific_settings.valid_files,left(listlast(name,"."),3))>
			<cfset variables.file_img=left(listlast(file_path,"."),3)>
		</cfif>
		<tr>
			<td><a href="../../project_planning/#attributes.project_planning_id#/#name#" target="_blank"><i class="icon_file_#variables.file_img#"></i> #name#</a></td>
			<td>#datelastmodified#</td>
		</tr>
	</cfoutput>
	</tbody>
</table>