
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
		<td bgcolor="##<cfif variables.show_submit_button>AE89A7<cfelse>FFFFFF</cfif>" colspan="#variables.colspan-10#" rowspan="5" align="center" valign="middle">
		<cfif variables.show_submit_button>
			<input type="reset" name="reset" value="Reload Form" class="btn" /><br />
			<input type="button" name="submit_button" value="Assign Tasks" onkeypress="document.forceplanner.submit();" onclick="document.forceplanner.submit();" class="btn btn-danger" /><br />
		</cfif>
		</td>
		<td colspan="2" valign="bottom" align="right" class="SubHeadText">
			&nbsp;
		</td><cfset variables.summary_colspan=variables.colspan+3>
		<td align="center" colspan="#variables.summary_colspan#" valign="bottom">
			<h2>Workload Summary</h2>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			&nbsp;
		</td>
		#variables.forceplanner_subordinates#
		<td colspan="3">
			Team Totals
		</td>
	</tr>
</cfoutput>

