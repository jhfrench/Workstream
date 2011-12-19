<cfsetting enablecfoutputonly="true" />
<cfprocessingdirective pageencoding="utf-8" />
<!--- circuit: Administration --->
<!--- fuseaction: view_user_access --->
<cftry>
<cfset myFusebox.thisPhase = "requestedFuseaction">
<cfset myFusebox.thisCircuit = "Administration">
<cfset myFusebox.thisFuseaction = "view_user_access">
<cftry>
<cfoutput><cfinclude template="../Administration/../common_files/act_header.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 30 and right(cfcatch.MissingFileName,30) is "../common_files/act_header.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse ../common_files/act_header.cfm in circuit Administration which does not exist (from fuseaction Administration.$prefuseaction).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
<cftry>
<cfoutput><cfinclude template="../Administration/pag_view_user_access.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 24 and right(cfcatch.MissingFileName,24) is "pag_view_user_access.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse pag_view_user_access.cfm in circuit Administration which does not exist (from fuseaction Administration.view_user_access).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
<cftry>
<cfoutput><cfinclude template="../Administration/../common_files/dsp_footer.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 30 and right(cfcatch.MissingFileName,30) is "../common_files/dsp_footer.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse ../common_files/dsp_footer.cfm in circuit Administration which does not exist (from fuseaction Administration.$postfuseaction).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
<cfcatch><cfrethrow></cfcatch>
</cftry>

