
<!--common_files/pag_project_list.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the big team list page that lets the user see more employees at one time (easier scrolling).
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
</cfsilent>
<cfif isdefined("attributes.project_id")>
<!--- update project_id for the given task and that task's time entries that haven't already been billed --->
	<cfquery name="update_project_id" datasource="#application.datasources.main#">
	UPDATE Task
	SET project_id=#attributes.project_id#
	WHERE task_id=#attributes.task_id#;
	
	UPDATE Time_Entry
	SET project_id=#attributes.project_id#
	WHERE task_id=#attributes.task_id#
		AND time_entry_id NOT IN (
			/* don't reassign hours that have already been billed*/
			SELECT time_entry_id
			FROM Link_Invoice_Time_Entry
				INNER JOIN Invoice ON Link_Invoice_Time_Entry.invoice_id=Invoice.invoice_id
			WHERE Link_Invoice_Time_Entry.active_ind=1
				AND Invoice.active_ind=1
			GROUP BY time_entry_id
		);
	</cfquery>
	<div class="alert alert-success">
		<strong>That worked!</strong>
		The project is updated.
	</div>
<cfelse>
	<cfparam name="attributes.default1" default="0">
	<cfparam name="attributes.default2" default="0">
	<cfinclude template="qry_get_selected_project_data.cfm">
	<cfset attributes.default1=get_selected_project_data.customer_id>
	<cfset attributes.default2=get_selected_project_data.project_id>
	<cfinclude template="qry_get_valid_projects.cfm">
	<cfform name="project_list" action="index.cfm?fuseaction=#attributes.fuseaction#" method="POST" class="form-horizontal">
	<fieldset>
		<legend><h2>Choose A Customer and Project</h2></legend>
		<div class="control-group">
			<label for="customer_id">Customer</label>
			<div class="controls">
			<cfmodule template="../common_files/act_related_selects.cfm" 
				query="get_valid_projects" 
				formname="project_list" 
				select_boxes="2" 
				fieldname1="customer_id" 
				display1="customer" 
				value1="customer_id"
				selected_value1="#attributes.default1#"
				select_size1="6"
				class1="span8"
				html_before2="	
			</div>
		</div>
		<div class='control-group'>
			<label for='customer_id'>Customer</label>
			<div class='controls'>" 
				fieldname2="project_id" 
				display2="display" 
				value2="project_id"
				selected_value2="#attributes.default2#"
				select_size2="6"
				class2="span8">
			</div>
		</div>
		<div class="form-actions">
		<cfoutput>
			<input type="hidden" name="task_id" value="#attributes.task_id#" />
			<input type="submit" name="submit" value="Select Project" class="btn btn-primary" />
			<input type="reset" name="reset" value="Cancel" class="btn" />
		</cfoutput> 
		</div>
	</fieldset>
	</cfform>
</cfif>