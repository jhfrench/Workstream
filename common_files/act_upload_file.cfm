
<cfset dir_to_go_to = '\\192.168.0.152\attatched_files\workstream\Project_Planning\' & #pass_project_planning_id# & '\'>

<!--- <cfoutput>
#dir_to_go_to#
#file_path#
</cfoutput> --->

<cfif NOT file_path eq ''>
 <cffile action="upload" fileField="file_path"
Destination="#dir_to_go_to#"  nameconflict="overwrite" >
</cfif>


<cflocation url="index.cfm?fuseaction=project_timeline&project_planning_id=#pass_project_planning_id#">














