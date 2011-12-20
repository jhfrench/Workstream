
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
	||
 --->
</cfsilent>
<cfoutput>
	<tr>
		<td bgcolor="##<cfif variables.show_submit_button>AE89A7<cfelse>FFFFFF</cfif>" colspan="#variables.colspan-10#" rowspan="5" align="center" valign="middle" class="RegTextWhite">
		<cfif variables.show_submit_button>
			&nbsp;<input type="reset" value="Reload Form" class="RegText"><br>
			&nbsp;<input type="button" name="submit_button" value="Assign Tasks" onkeypress="document.forceplanner.submit();" onclick="document.forceplanner.submit();" class="RegText"><br>
			&nbsp;Note: 'Assign Tasks' will assign only tasks that are marked for assignment (checked). workstream will update the budget for the task to match the total assigned hours. The employees with hours for a task will be assigned to that task's team.</cfif>
		</td>
		<td colspan="2" valign="bottom" align="right" class="SubHeadText">
			&nbsp;
		</td><cfset variables.summary_colspan=variables.colspan+3>
		<td align="center" colspan="#variables.summary_colspan#" valign="bottom" class="SubHeadText">
			Workload Summary
		</td>
	</tr>
	<tr bgcolor="##c0c0c0" class="SubHeadText"><!--- 
		<td bgcolor="##ffffff" colspan="5" valign="bottom" class="SubHeadText">
			&nbsp;
		</td> --->
		<td colspan="2" valign="bottom" align="right" class="SubHeadText">
			&nbsp;
		</td>
	<cfloop list="#emp_init_loop#" index="ii">
		<td align="center" valign="bottom" class="SubHeadText">
			#ii#
		</td>
	</cfloop>
		<td bgcolor="##5F5F5F" colspan="3" align="center" valign="bottom" class="SubHeadTextWhite">
			Team Totals
		</td>
	</tr>
</cfoutput>

