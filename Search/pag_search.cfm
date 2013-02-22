 
<!--Search/pag_search.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the search input screen for workstream.
	||
	Name: 
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfscript>
	attributes.task_id="";
	attributes.task_name="";
	if (isdefined("attributes.header_search_criteria")) {
		if (isnumeric(attributes.header_search_criteria)) {
			attributes.task_id=attributes.header_search_criteria;
		}
		else {
			attributes.task_name=attributes.header_search_criteria;
		};
	};
</cfscript>
<cfinclude template="../common_files/qry_get_search_projects.cfm">
<cfinclude template="../common_files/qry_get_priorities.cfm">
<cfinclude template="../common_files/qry_get_ref_task_status.cfm">
<cfoutput>
<cfform name="input_form" action="index.cfm?fuseaction=Search.output" method="post" class="form-horizontal">
	<fieldset>
		<legend><h2>#application.application_specific_settings.organization# Knowledgebase Search</h2></legend>
		<!--- <div class="control-group">
			<label for="" id=""></label>
			<div class="controls">
				
				<p class="help-block"></p>
			</div>
		</div> --->
		<div class="control-group">
			<label for="task_id" class="control-label">Task ID</label>
			<div class="controls">
				<cfinput type="text" name="task_id" id="task_id" value="#attributes.task_id#" size="50" class="span8" />
				<p class="help-block">Separate multiple IDs with commas.</p>
			</div>
		</div>
		<div class="control-group">
			<label for="task_name" class="control-label">Task Name</label>
			<div class="controls">
				<input type="text" name="task_name" id="task_name" value="#attributes.task_name#" size="30" class="span8" />
				<p class="help-block">Separate multiple phrases with commas.</p>
			</div>
		</div>
		<div class="control-group">
			<label for="description" class="control-label">Description</label>
			<div class="controls">
				<input type="text" name="description" id="description" size="30" class="span8" />
				<p class="help-block">Separate multiple phrases with commas.</p>
			</div>
		</div>
		<div class="control-group">
			<label for="notes" class="control-label">Notes</label>
			<div class="controls">
				<input type="text" name="notes" id="notes" size="30" class="span8" />
				<p class="help-block">Separate multiple phrases with commas.</p>
			</div>
		</div>
		<div class="control-group">
			<label for="date_entered" class="control-label">Date Entered</label>
			<div class="controls">
				<select name="date_entered_operator" id="date_entered_operator" class="span3">
					<option value="1">Before</option>
					<option value="2">On</option>
					<option value="3">After</option>
				</select>
				<input type="date" name="date_entered" id="date_entered" min="#dateformat(application.application_specific_settings.workstream_start_date, 'yyyy-mm-dd')#" max="#dateformat(now(), 'yyyy-mm-dd')#" maxlength="10" class="span5 date" />
				<p class="help-block">Searches on the date the task was entered.</p>
			</div>
		</div>
		<div class="control-group">
			<label for="due_date" class="control-label">Date Due</label>
			<div class="controls">
				<select name="due_date_operator" id="date_entered_operator" class="span3">
					<option value="1">Before</option>
					<option value="2">On</option>
					<option value="3">After</option>
				</select>
				<input type="date" name="due_date" id="due_date" min="#dateformat(application.application_specific_settings.workstream_start_date, 'yyyy-mm-dd')#" max="#dateformat(now(), 'yyyy-mm-dd')#" maxlength="10" class="span5 date" />
				<p class="help-block">Searches on the date the task is due.</p>
			</div>
		</div>
		<div class="control-group">
			<label for="task_source" class="control-label">Task Source</label>
			<div class="controls">
				<cfmodule template="../common_files/dsp_team_select.cfm" colspan="1" select_name="task_source" multi="1" user_account_id="0" class="span8">
			</div>
		</div>
		<div class="control-group">
			<label for="task_owner" class="control-label">Task Owner</label>
			<div class="controls">
				<cfmodule template="../common_files/dsp_team_select.cfm" select_name="task_owner" multi="1" user_account_id="0" class="span8">
			</div>
		</div>
		<div class="control-group">
			<label for="customer_id" class="control-label">Customer</label>
			<div class="controls">
				<cfmodule template="../common_files/two_related_selects.cfm" query="get_search_projects" name1="customer_id"
					name2="project_id" display1="customer" display2="display"
					value1="customer_id" value2="project_id" multiple1="1"
					multiple2="1" size1="6" size2="6"
					class1="span8" class2="span8" autoselectfirst="no"
					formname="input_form"
					HTMLBetween="</div>
		</div>
		<div class='control-group'>
			<label for='project_id' class='control-label'>Project</label>
			<div class='controls'>">
				<p class="help-block">Choose a <a href="##customer_id">customer</a> to see related projects.</p>
			</div>
		</div>
		<div class="control-group">
			<label for="priority_id" class="control-label">Priority</label>
			<div class="controls">
			<select name="priority_id" id="priority_id" multiple="multiple" size="3" class="span8">
			<cfloop query="get_priorities">
				<option value="#priority_id#">#description#</option>
			</cfloop>
			</select>
			</div>
		</div>
		<div class="control-group">
			<label for="task_stati" class="control-label">Task Status</label>
			<div class="controls">
				<select name="task_stati" id="task_stati" multiple="multiple" size="4" class="span8">
				<cfloop query="get_ref_task_status">
					<option value="#task_status_id#">#status#</option>
				</cfloop>
				</select>
			</div>
		</div>
		<div class="form-actions">
			<input type="hidden" name="used_by_search_ind" value="1" />
			<input type="hidden" name= "project_id_list" value= "#valuelist(get_search_projects.project_id)#" />
			<input type="submit" name="method" value="Submit" class="btn btn-primary" />
			<input type="reset" value="Reset" class="btn" />
		</div>
	</fieldset>
</cfform>
</cfoutput>