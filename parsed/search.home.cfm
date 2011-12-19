<cfsetting enablecfoutputonly="true" />
<cfprocessingdirective pageencoding="utf-8" />
<!--- circuit: Search --->
<!--- fuseaction: home --->
<cftry>
<cfset myFusebox.thisPhase = "requestedFuseaction">
<cfset myFusebox.thisCircuit = "Search">
<cfset myFusebox.thisFuseaction = "home">
<cftry>
<cfoutput><cfinclude template="../Search/../common_files/act_header.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 30 and right(cfcatch.MissingFileName,30) is "../common_files/act_header.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse ../common_files/act_header.cfm in circuit Search which does not exist (from fuseaction Search.$prefuseaction).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
<cfset request.pagetitle = "Search" />
<cftry>
<cfoutput><cfinclude template="../Search/pag_search.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 14 and right(cfcatch.MissingFileName,14) is "pag_search.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse pag_search.cfm in circuit Search which does not exist (from fuseaction Search.home).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
<cftry>
<cfoutput><cfinclude template="../Search/../common_files/dsp_footer.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 30 and right(cfcatch.MissingFileName,30) is "../common_files/dsp_footer.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse ../common_files/dsp_footer.cfm in circuit Search which does not exist (from fuseaction Search.$postfuseaction).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
<cfcatch><cfrethrow></cfcatch>
</cftry>

