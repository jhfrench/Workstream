
<!--Reports/act_over_under_date_select.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the overtime report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfinclude template="../common_files/qry_get_date_locked.cfm">
<cfset variables.go_back_to=datediff("d",get_date_locked.date_locked,now())-1>
<cfif isdefined("attributes.date")>
	<cfset variables.start_date=attributes.date>
	<cfset variables.end_date=dateadd("d", 6, attributes.date)>
</cfif>
<cfloop from="1" to="7" index="variables.ii">
	<cfset variables.temp_date=dateadd("d", -variables.ii, now())>
	<cfif dayofweek(variables.temp_date) EQ 1>
		<cfset variables.select_start_date=variables.temp_date>
		<cfset variables.select_end_date=dateadd("d", 6, variables.temp_date)>
		<cfif NOT isdefined("attributes.date")>
			<cfset variables.start_date=variables.select_start_date>
			<cfset variables.end_date=variables.select_end_date>
		</cfif>
	</cfif>
</cfloop>
</cfsilent>