
<!--Reports/act_turnover_report.cfm
	Author: Jeromy F-->
	<!--- FUSEDOC
	||
	Responsibilities: I manipulate the data returned from the 'Get_Numbers' query into a usable format for the graph.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfset temp_year=0>
<cfset reasons=valuelist(Get_Reasons.separation_reason)>
<cfset colors="FFC363,5A82B5,A5597B,6B7D63,E77963,5AA29C,63E2E7,A2835A,B55AB2,5AB55C,dda0dd,000080,2e8b57,708090,7b68ee,000000,ff69b4,dc143c">
<cfset colspan=listlen(reasons)*2+4>
<cfset xAxisLabels="">
<cfset graphed_records=Min(evaluate("#query_name#.recordcount"), maximum_records)>
<cfset chart_height=47>
<cfset plotAreaBottom=15/100>
<cfset plotAreaTop=1-plotAreaBottom>
<cfset bar_color="DE070D">
<cfset Y_TickBar="708090">
<cfset X_label="000000">
<cfset background_color="ffffff">
<cfset graph_back="ffffff">
<cfparam name="yAxisTitle" default="Percent of quarter's population">
<cfparam name="dataset0yvalues" default="">
	<cfoutput query="Get_Numbers">
		<cfset xAxisLabels=listappend(xAxisLabels,"Q#thequarter#")>
		<cfif theyear NEQ temp_year>
			<cfset xAxisLabels=listappend(xAxisLabels,theyear, " ")>
			<cfset temp_year=theyear>
		</cfif>
		<cfset counter=0>
		<cfloop list="#reasons#" index="ii">
		<cfparam name="dataset#counter#" default="">
		<cfset percent=decimalformat(evaluate("#ii#")/pop*100)>
		<cfset "dataset#counter#"=listappend(evaluate("dataset#counter#"), percent)>
		<cfset counter=incrementvalue(counter)>
		</cfloop>
	</cfoutput>
<cfswitch expression="#session.workstream_text_size#">
	<cfcase value="Lg">
		<cfset small="11">
	</cfcase>
	<cfcase value="Md">
		<cfset small="11">
	</cfcase>
	<cfdefaultcase>
		<cfset small="9">
	</cfdefaultcase>
</cfswitch>
