
<!--Tools/dsp_forceplanner_title_bar.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: 
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
<cfset variables.colspan=decrementvalue(variables.colspan)>
</cfsilent>
<cfoutput>
<form name="ChangeMonth" action="index.cfm?fuseaction=#attributes.fuseaction#" method="POST">
	<tr bgcolor="##772862" class="HeadTextWhite">
		<td colspan="#variables.colspan#" align="left" valign="bottom" class="HeadTextWhite">
			&nbsp;#session.workstream_company_name# ForcePlanner for <select name="force_month" onchange="form.submit();" class="ToolTextSm">
				<cfloop from="1" to="12" index="ii"><option value="#ii#"<cfif ii EQ attributes.force_month> selected="selected"</cfif>>#MonthAsString(ii)#</option>
				</cfloop>
				</select>
				<select name="force_year" onchange="form.submit();" class="ToolTextSm">
					<cfloop from="#get_years.min_year#" to="#get_years.max_year#" index="ii"><option value="#ii#"<cfif ii EQ attributes.force_year> selected="selected"</cfif>>#ii#</option>
				</cfloop>
				</select>
		</td>
	</tr>
</form>
</cfoutput>

