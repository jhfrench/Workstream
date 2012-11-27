
<!--Tools/dsp_forceplanner_assign_rows.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the rows that allow the user to assign task hours to team members.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
<cfset variables.task_processed="">
<cfset variables.processed_counter=0>
</cfsilent>
<cfif get_prospectives.recordcount>
<cfoutput query="get_prospectives">
<cfif NOT listFind(variables.task_processed,task_id)>
<cfset variables.processed_counter=incrementvalue(variables.processed_counter)>
<cfset variables.task_processed=listappend(variables.task_processed,task_id)>
<div class="row-fluid">
	<div class="span4">
		<div class="row-fluid">
			<div class="span2"><a href="javascript:list_to_task('#task_id#');">#task_id#</a></div>
			<div class="span2"><a href="javascript:list_to_task('#task_id#');">#task_name#</a></div>
			<div class="span2"><a href="javascript:list_to_project('#project_id#');">#project#</a></div>
			<div class="span2 date">
				<input type="date" name="task_due_date#task_id#" id="task_due_date#task_id#" min="#dateformat(application.application_specific_settings.workstream_start_date, 'yyyy-mm-dd')#" value="#dateformat(due_date, 'yyyy-mm-dd')#" maxlength="10" required="required" onfocus="ReleaseRowFields('accept_#task_id#');" class="span12 date" />
			</div>
			<div class="span2">
				<input type="checkbox" name="accept_#task_id#" id="accept_#task_id#" value="#task_id#"#previously_assigned# onclick="ReCalculate('accept_#task_id#');" onkeydown="ReCalculate('accept_#task_id#');" />
			</div>
			<div class="span2">#billable#</div>
		</div>
	</div>
	<div class="span5">
	<cfloop list="#variables.subordinates_user_account_id#" index="variables.user_account_id">
		<div class="row-fluid">
			<div class="span1 number">
				<cfset current_budget=replace(decimalformat(#evaluate("budget#variables.user_account_id#")#), ",", "", "all")>
				<cfif listgetat(current_budget,2,".") EQ 0><cfset current_budget=numberformat(current_budget)></cfif>
				<cfparam name="sum_#variables.user_account_id#" default="0">
				<cfif len(previously_assigned)><cfset "sum_#variables.user_account_id#"=#evaluate("budget#variables.user_account_id#")#+#evaluate("sum_#variables.user_account_id#")#><cfset "task_assign#task_id#"=#evaluate("task_assign#task_id#")#+current_budget><cfelse><cfset current_budget=0></cfif>
				<!--- ,'t#task_id#_#variables.user_account_id#' --->
				<cfinput type="text" name="t#task_id#_#variables.user_account_id#" onchange="CalculateRowFields('accept_#task_id#','e_#variables.user_account_id#');" onfocus="ReleaseRowFields('accept_#task_id#');" onblur="NonNumberComplain('t#task_id#_#variables.user_account_id#');" value="#current_budget#" class="number span12">
			</div>
		</div>
	</cfloop>
	</div>
	<div class="span3">
		<div class="row-fluid">
			<div class="span4 number">#budget#</div>
			<div class="span4 number"><input type="text" name="task_assigned#task_id#" value="#evaluate('task_assign#task_id#')#" readonly="readonly" class="number span12" /></div>
			<div class="span4 number">
				<cfset "task_remainder#task_id#"=budget-#evaluate("task_assign#task_id#")#>
				<input type="text" name="task_remainder#task_id#" value="#evaluate('task_remainder#task_id#')#" readonly="readonly" class="number span12" />
				<input type="hidden" name="task_status#task_id#" value="#previous_entry#" />
			</div>
		</div>
	</div>
</div>
</cfif>
<cfif variables.processed_counter GT 3 AND NOT variables.processed_counter MOD 15>
	<cfinclude template="dsp_forceplanner_main_head.cfm">
</cfif>
</cfoutput>
<cfelse>
<div class="alert alert-error">
	There are no prospective tasks to assign.
</div>
</cfif>
