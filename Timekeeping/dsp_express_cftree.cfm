
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
<cfswitch expression="#sort_order#">
	<cfloop from="sort_order" to="#variables.sort_order#" index="variables.close_ul_ii"></li><cfif sort_order NEQ 3></ul></cfif></cfif>
	<cfset variables.sort_order=sort_order>
	<cfcase value="1">
	<ul>
		<li>
			<span><i class="icon-calendar"></i> #date_year#, Week #date_week#</span>
	</cfcase>
	<cfcase value="2">
			<ul>
				<li>
					<span class="badge badge-<cfif hours GTE 8>success<cfelseif hours GTE 6>warning<cfelse>important</cfif>"><i class="icon-minus-sign"></i> #dayofweekasstring(day_of_week_number)#, #monthasstring(date_month)# dateformat(odbc_date, "d"): #numberformat(hours, "900.00")# hours</span>
	</cfcase>
	<cfcase value="3">
					<ul>
						<li>
							<a href="javascript:time_entry_edit(#time_entry_id#);" title="edit this entry"><span><i class="icon-time"></i> #numberformat(hours, "90.00")#</span> &ndash; #note#...</a>
	</cfcase>
	<cfdefaultcase>
		<li>This is a level of data Workstream cannot handle.</li>
	</cfdefaultcase>
</cfswitch>
		</li>
	</ul>
</cfoutput>
	<ul>
		<li>
			<span><i class="icon-calendar"></i> 2013, Week 2</span>
			<ul>
				<li>
					<span class="badge badge-success"><i class="icon-minus-sign"></i> Monday, January 7: 8.00 hours</span>
					<ul>
						<li>
							<a href=""><span><i class="icon-time"></i> 8.00</span> &ndash; Changed CSS to accomodate...</a>
						</li>
					</ul>
				</li>
				<li>
					<span class="badge badge-success"><i class="icon-minus-sign"></i> Tuesday, January 8: 8.00 hours</span>
					<ul>
						<li>
							<span><i class="icon-time"></i> 6.00</span> &ndash; <a href="">Altered code...</a>
						</li>
						<li>
							<span><i class="icon-time"></i> 2.00</span> &ndash; <a href="">Simplified our approach to...</a>
						</li>
					</ul>
				</li>
				<li>
					<span class="badge badge-warning"><i class="icon-minus-sign"></i> Wednesday, January 9: 6.00 hours</span>
					<ul>
						<li>
							<a href=""><span><i class="icon-time"></i> 3.00</span> &ndash; Fixed bug caused by...</a>
						</li>
						<li>
							<a href=""><span><i class="icon-time"></i> 3.00</span> &ndash; Comitting latest code to Git...</a>
						</li>
					</ul>
				</li>
				<li>
					<span class="badge badge-important"><i class="icon-minus-sign"></i> Wednesday, January 9: 4.00 hours</span>
					<ul>
						<li>
							<a href=""><span><i class="icon-time"></i> 2.00</span> &ndash; Create component that...</a>
						</li>
					</ul>
				</li>
			</ul>
		</li>
		<li>
			<span><i class="icon-calendar"></i> 2013, Week 3</span>
			<ul>
				<li>
					<span class="badge badge-success"><i class="icon-minus-sign"></i> Monday, January 14: 8.00 hours</span>
					<ul>
						<li>
							<span><i class="icon-time"></i> 7.75</span> &ndash; <a href="">Writing documentation...</a>
						</li>
						<li>
							<span><i class="icon-time"></i> 0.25</span> &ndash; <a href="">Reverting code back to...</a>
						</li>
					</ul>
				</li>
			</ul>
		</li>
	</ul>
</div>