
<!--Reports/act_start_end_dates.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the date of the first and last days of the current week..
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfloop from="1" to="7" index="ii">
	<cfset variables.temp_date=dateadd("d", -ii, now())>
	<cfif dayofweek(temp_date) eq 1>
		<cfset variables.start_date=dateformat(temp_date, "mm/dd/yy")>
	<cfelseif dayofweek(temp_date) eq 7>
		<cfset variables.end_date=dateformat(dateadd("d", 7, temp_date), "mm/dd/yy")>
	</cfif>
</cfloop>
</cfsilent>
