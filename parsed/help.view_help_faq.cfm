<cfsetting enablecfoutputonly="true" />
<cfprocessingdirective pageencoding="utf-8" />
<!--- circuit: Help --->
<!--- fuseaction: view_help_faq --->
<cftry>
<cfset myFusebox.thisPhase = "requestedFuseaction">
<cfset myFusebox.thisCircuit = "Help">
<cfset myFusebox.thisFuseaction = "view_help_faq">
<cftry>
<cfoutput><cfinclude template="../Help/dsp_view_help_faq.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 21 and right(cfcatch.MissingFileName,21) is "dsp_view_help_faq.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse dsp_view_help_faq.cfm in circuit Help which does not exist (from fuseaction Help.view_help_faq).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
<cfcatch><cfrethrow></cfcatch>
</cftry>

