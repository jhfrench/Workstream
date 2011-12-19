
<!--Tools/dsp_forceplanner_sub_head.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the header of the section that shows team totals and efficiency.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/12/19 20:29:59  french
	Added engagement name to output. Restructured query to union results within the subquery. Added link to engagement details. Task 38852

	Revision 1.0  2005-02-15 16:01:14-05  daugherty
	Initial revision

	Revision 1.2  2001-11-05 10:55:33-05  french
	Changed 'reload form' from 'button' to 'reset' input type.

	Revision 1.1  2001-10-11 10:54:22-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
 --->
</cfsilent>
<cfoutput>
	<tr>
		<td bgcolor="##<cfif variables.show_submit_button>AE89A7<cfelse>FFFFFF</cfif>" colspan="#variables.colspan-10#" rowspan="5" align="center" valign="middle" class="RegText#session.workstream_text_size#White">
		<cfif variables.show_submit_button>
			&nbsp;<input type="reset" value="Reload Form" class="RegText#session.workstream_text_size#"><br>
			&nbsp;<input type="button" name="submit_button" value="Assign Tasks" onkeypress="document.forceplanner.submit();" onclick="document.forceplanner.submit();" class="RegText#session.workstream_text_size#"><br>
			&nbsp;Note: 'Assign Tasks' will assign only tasks that are marked for assignment (checked). workstream will update the budget for the task to match the total assigned hours. The employees with hours for a task will be assigned to that task's team.</cfif>
		</td>
		<td colspan="2" valign="bottom" align="right" class="SubHeadText#session.workstream_text_size#">
			&nbsp;
		</td><cfset variables.summary_colspan=variables.colspan+3>
		<td align="center" colspan="#variables.summary_colspan#" valign="bottom" class="SubHeadText#session.workstream_text_size#">
			Workload Summary
		</td>
	</tr>
	<tr bgcolor="##c0c0c0" class="SubHeadText#session.workstream_text_size#"><!--- 
		<td bgcolor="##ffffff" colspan="5" valign="bottom" class="SubHeadText#session.workstream_text_size#">
			&nbsp;
		</td> --->
		<td colspan="2" valign="bottom" align="right" class="SubHeadText#session.workstream_text_size#">
			&nbsp;
		</td>
	<cfloop list="#emp_init_loop#" index="ii">
		<td align="center" valign="bottom" class="SubHeadText#session.workstream_text_size#">
			#ii#
		</td>
	</cfloop>
		<td bgcolor="##5F5F5F" colspan="3" align="center" valign="bottom" class="SubHeadText#session.workstream_text_size#White">
			Team Totals
		</td>
	</tr>
</cfoutput>

