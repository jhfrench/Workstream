
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
	Revision 1.2  2005/12/20 20:22:40  french
	Minor modifications to line up the columns on the output and to speed up the output. Task 38852

	Revision 1.1  2005-12-19 15:29:57-05  french
	Added engagement name to output. Restructured query to union results within the subquery. Added link to engagement details. Task 38852

	Revision 1.0  2005-02-15 16:01:08-05  daugherty
	Initial revision

	Revision 1.2  2002-01-10 13:58:02-05  french
	Fixing problem caused by the unlikely scenario that a person has over 999 hours budgeted for a task. Anything over 999 caused the DecimalFormat to insert a comma into the number which breaks the following NumberFormat.

	Revision 1.1  2001-10-11 10:54:25-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
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
	<tr<cfif NOT (variables.processed_counter MOD 2)> bgcolor="##E1E1E1"</cfif> class="RegText#session.workstream_text_size#">
		<td class="RegText#session.workstream_text_size#">
			<a href="javascript:list_to_project('#project_id#');" class="RegText#session.workstream_text_size#">#project#</a>
		</td>
		<td class="RegText#session.workstream_text_size#">
			<a href="javascript:list_to_task('#task_id#');" class="RegText#session.workstream_text_size#">#task_name#</a>
		</td>
		<td class="RegText#session.workstream_text_size#">
			<a href="javascript:list_to_task('#task_id#');" class="RegText#session.workstream_text_size#">#task_id#</a>
		</td>
		<td align="center" class="RegText#session.workstream_text_size#">
			<input type="Text" name="task_due_date#task_id#" value="#dateformat(due_date,"mm/dd/yyyy")#" size="11" maxlength="11" onfocus="ReleaseRowFields('accept_#task_id#');" class="RegText#session.workstream_text_size#">
		</td>
		<td align="center" class="RegText#session.workstream_text_size#">
			<input type="checkbox"#previously_assigned# name="accept_#task_id#" value="#task_id#" onclick="ReCalculate('accept_#task_id#');" onkeydown="ReCalculate('accept_#task_id#');" class="RegText#session.workstream_text_size#">
		</td>
		<td align="center" class="RegText#session.workstream_text_size#">
			#billable#
		</td>
	<cfloop list="#emp_id_loop#" index="ii">
		<td class="RegText#session.workstream_text_size#">
			<cfset current_budget=Replace(DecimalFormat(#evaluate("budget#ii#")#), ",", "", "all")>
			<cfif listgetat(current_budget,2,".") EQ 0><cfset current_budget=numberformat(current_budget)></cfif>
			<cfparam name="sum_#ii#" default="0">
			<cfif len(previously_assigned)><cfset "sum_#ii#"=#evaluate("budget#ii#")#+#evaluate("sum_#ii#")#><cfset "task_assign#task_id#"=#evaluate("task_assign#task_id#")#+current_budget><cfelse><cfset current_budget=0></cfif>
			<!--- ,'t#task_id#_#ii#' ---><cfinput type="Text" name="t#task_id#_#ii#" onchange="CalculateRowFields('accept_#task_id#','e_#ii#');" onfocus="ReleaseRowFields('accept_#task_id#');" onblur="NonNumberComplain('t#task_id#_#ii#');" value="#current_budget#" size="2" class="RegText#session.workstream_text_size#">
		</td>
	</cfloop>
		<td align="center" class="RegText#session.workstream_text_size#">
			#budget#
		</td>
		<td align="center" class="RegText#session.workstream_text_size#">
			<input type="Text" name="task_assigned#task_id#" value="#evaluate("task_assign#task_id#")#" size="3" onfocus="blur();"  class="RegText#session.workstream_text_size#">
		</td>
		<td align="center" class="RegText#session.workstream_text_size#">
			<cfset "task_remainder#task_id#"=budget-#evaluate("task_assign#task_id#")#><input type="Text" name="task_remainder#task_id#" value="#evaluate("task_remainder#task_id#")#" size="3" onfocus="blur();" class="RegText#session.workstream_text_size#"><input type="hidden" name="task_status#task_id#" value="#previous_entry#">
		</td>
	</tr>
</cfif>
<cfif variables.processed_counter GT 3 AND NOT variables.processed_counter MOD 15>
	<cfinclude template="dsp_forceplanner_main_head.cfm">
</cfif>
</cfoutput>
<cfelse>
	<tr class="RegText#session.workstream_text_size#">
		<cfoutput><td align="center" bgcolor="##E1E1E1" colspan="#variables.colspan#" class="Note#session.workstream_text_size#">
			There are no prospective tasks to assign.
		</td></cfoutput>
	</tr>
</cfif>

