
<!--Reports/dsp_code_report_input.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I dispaly a drop down box that has a list of all active projects for the compaies that you have selected to view.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfif NOT isdefined("attributes.used_by_search")>
	<cfset attributes.used_by_search=0>
</cfif>
</cfsilent><a href="index.cfm?fuseaction=code_report_input&used_by_search=<cfif attributes.used_by_search EQ 1>0">Hide<cfelse>1">Show</cfif> non-billable engagements</a><br />
<cfselect name="project_id" size="10" display="display" value="project_id" query="project" required="Yes" message="Please specify an engagement."></cfselect>
