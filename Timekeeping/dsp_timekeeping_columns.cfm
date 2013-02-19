
<!--Timekeeping/dsp_timekeeping_columns.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the main timekeeping page.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>

<cfoutput>
		<div class="row-fluid">
			<section id="blurb_PTO" class="span3">
				<h2><abbr title="Paid Time Off">PTO</abbr></h2>
				<p>#variables.pto_blurb#</p>
				<p><a href="index.cfm?fuseaction=Reports.#variables.pto_action#" class="btn">View details &raquo;</a></p>
			</section>
			<section id="blurb_life" class="span3">
				<h2>#listlast(session.workstream_company_name)# Life</h2>
				<p>#variables.life_blurb#</p>
			</section>
			<section id="blurb_hours" class="span3">
				<h2>Hours Worked</h2>
				<p>#variables.hours_blurb#</p>
				<cfif listfind(variables.allowed_modules, 3)>
					<p><a href="index.cfm?fuseaction=Reports.personal_summary" class="btn">View details &raquo;</a></p>
				</cfif>
			</section>
			<section id="blurb_revenue" class="span3">
				<h2>Revenue Goal</h2>
				<cfinclude template="dsp_revenue_progress.cfm">
				<cfif listfind(variables.allowed_modules, 3)>
					<p><a href="index.cfm?fuseaction=Reports.revenue_report" class="btn">View details &raquo;</a></p>
				</cfif>
			</section>
		</div>
		<div class="row-fluid">
		<cfif operations_blurb.recordcount>
			<cfinclude template="dsp_operations_blurb.cfm">
		</cfif>
		<cfinclude template="dsp_time_allocation_chart.cfm">
		</div>
</cfoutput>