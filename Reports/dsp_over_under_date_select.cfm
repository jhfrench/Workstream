
<!--Reports/dsp_over_under_date_select.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the overtime report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfinclude template="../common_files/qry_express_check_date.cfm">
<cfset variables.go_back_to=datediff("d",express_check_date.date_locked,now())-1>
</cfsilent>
<cfoutput>
<cfif isdefined("attributes.date")>
	<cfset variables.start_date=attributes.date>
	<cfset variables.end_date=dateadd("d", 6, attributes.date)>
</cfif>
<cfloop from="1" to="7" index="ii">
	<cfset variables.temp_date=dateadd("d", -ii, now())>
	<cfif dayofweek(variables.temp_date) EQ 1>
		<cfset variables.select_start_date=variables.temp_date>
		<cfset variables.select_end_date=dateadd("d", 6, variables.temp_date)>
		<cfif NOT isdefined("attributes.date")>
			<cfset variables.start_date=variables.select_start_date>
			<cfset variables.end_date=variables.select_end_date>
		</cfif>
	</cfif>
</cfloop>
<cfif variables.overtime_ind>
	<cfset variables.action="index.cfm?fuseaction=Reports.overtime">
<cfelse>
	<cfset variables.action="index.cfm?fuseaction=Reports.undertime">
</cfif>
<cfform action="#variables.action#" method="POST">
	<tr bgcolor="##5F5F5F" class="SubHeadTextWhite">
		<td colspan="2" align="center" valign="bottom" class="SubHeadTextWhite">
			For
	<select name="Date" onchange="document.forms[0].submit();">
		<cfloop from="0" to="#variables.go_back_to#" step="7" index="ii">
		<cfset variables.value_date=dateadd("d", -ii, variables.select_start_date)>
		<option value="#variables.value_date#"<cfif NOT comparenocase(dateformat(variables.start_date,"mm/dd/yyyy"), dateformat(variables.value_date,"mm/dd/yyyy"))> SELECTED</cfif>>#dateformat(variables.value_date, "mmmm dd, yyyy")#-#dateformat(dateadd("d", 6, variables.value_date), "mmmm dd, yyyy")#</option>
		</cfloop>
	</select>
		</td>
	</tr>
</cfform>
</cfoutput>
