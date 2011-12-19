<cfsetting enablecfoutputonly="true" />
<cfprocessingdirective pageencoding="utf-8" />
<!--- circuit: Reports --->
<!--- fuseaction: pto_input --->
<cftry>
<cfset myFusebox.thisPhase = "requestedFuseaction">
<cfset myFusebox.thisCircuit = "Reports">
<cfset myFusebox.thisFuseaction = "pto_input">
<cftry>
<cfoutput><cfinclude template="../Reports/../common_files/act_header.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 30 and right(cfcatch.MissingFileName,30) is "../common_files/act_header.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse ../common_files/act_header.cfm in circuit Reports which does not exist (from fuseaction Reports.$prefuseaction).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
<cfset request.pagetitle = "PTO Report" />
<cftry>
<cfoutput><cfinclude template="../Reports/pag_pto_report_input.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 24 and right(cfcatch.MissingFileName,24) is "pag_pto_report_input.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse pag_pto_report_input.cfm in circuit Reports which does not exist (from fuseaction Reports.pto_input).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
<cftry>
<cfoutput><cfinclude template="../Reports/../common_files/dsp_footer.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 30 and right(cfcatch.MissingFileName,30) is "../common_files/dsp_footer.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse ../common_files/dsp_footer.cfm in circuit Reports which does not exist (from fuseaction Reports.$postfuseaction).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
<cfcatch><cfrethrow></cfcatch>
</cftry>

