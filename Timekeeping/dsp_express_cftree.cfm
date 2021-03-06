
<!--Timekeeping/dsp_express_cftree.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the cftree for the Timekeeping module's express entry page.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
 --->
<!--- <cfparam name="session.workstream_expand" default="yes,yes,no">
<cfset variables.tree_expand=listdeleteat(session.workstream_expand,1)> --->
<cfset variables.sort_order=0>
</cfsilent>

<div class="tree">
<cfoutput query="get_express_time_entries">
	<cfloop from="#sort_order#" to="#variables.sort_order#" index="variables.close_ul_ii"></li><cfif sort_order NEQ 3></ul></cfif></cfloop>
<cfswitch expression="#sort_order#">
	<cfcase value="1">
	<ul role="tree">
		<li role="treeitem">
			<span class="badge badge-<cfif hours GTE get_employee_details.week_hours>success<cfelseif hours GTE variables.partial_week>warning<cfelse>important</cfif>"><i class="icon-calendar"></i> #date_year#, Week #date_week#</span>
	</cfcase>
	<cfcase value="2">
			<ul role="group">
				<li role="treeitem">
					<span class="badge badge-<cfif hours GTE variables.full_day>success<cfelseif hours GTE variables.partial_day>warning<cfelse>important</cfif>"><i class="icon-minus-sign"></i> #dayofweekasstring(day_of_week_number)#, #monthasstring(date_month)# #dateformat(work_date, "d")#: #numberformat(hours,'___.__')# hours</span>
	</cfcase>
	<cfcase value="3">
					<cfif variables.sort_order NEQ 3><ul></cfif>
						<li role="treeitem">
							<a href="javascript:time_entry_edit(#time_entry_id#);" title="View this entry"><span><i class="icon-time"></i> #numberformat(hours,'__.__')#<cfif billed_ind> <i class="icon-ok"></i></cfif></span> &ndash; #note#</a>
	</cfcase>
	<cfdefaultcase>
		<li>This is a level of data Workstream cannot handle.</li>
	</cfdefaultcase>
</cfswitch>
<cfset variables.sort_order=sort_order>
</cfoutput>
<cfloop from="1" to="#variables.sort_order#" index="variables.close_ul_ii"></li></ul></cfloop>
</div>