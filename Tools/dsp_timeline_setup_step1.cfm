
<!--Tools/dsp_timeline_setup_step1.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the change date locked screen.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfinclude template="qry_get_valid_projects.cfm">
<cfoutput>
<tr valign="top">
	<td width="50%">
		Timeline name<br />
		<cfinput type="text" name="project_planning_name" required="Yes" message="Please name this new timeline." size="30">
	</td>
	<td><cfset variables.start=incrementvalue(variables.start)>
		<ol type="1" class="Note"><li>Designate a name for this new timeline.</li></ol>
	</td>
</tr>
<tr valign="top">
	<td width="50%">
		Project<br />
</cfoutput>
		<cfselect name="project_id" size="5" required="yes" message="Please specify the project for your new project timeline.">
		<cfoutput query="get_valid_projects">
			<option value="#project_id#"><cfif session.workstream_project_list_order EQ 1>#customer# #replace(project_name,customer,"","ALL")# (#project_code#)<cfelse>#project_code# - #customer# #replace(project_name,customer,"","ALL")#</cfif></option>
		</cfoutput>
	</cfselect>
	</td>
	<td><cfset variables.start=incrementvalue(variables.start)>
		<ol type="1" start="<cfoutput>#variables.start#" class="Note</cfoutput>"><li>Select the project that contains (or will contain) the tasks for this timeline. Please note that timelines are organized by using custom fields. If your project does not use custom fields it will not appear in this select list. You can add custom fields by editing the project from the Customers module. See your workstream administrator for more details.</li></ol>
	</td>
</tr>
<input type="hidden" name="step" value="2">

