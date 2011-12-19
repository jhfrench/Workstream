<cfsetting enablecfoutputonly="true" />
<cfprocessingdirective pageencoding="utf-8" />
<!--- circuit: Timekeeping --->
<!--- fuseaction: pre_name --->
<cftry>
<cfset myFusebox.thisPhase = "requestedFuseaction">
<cfset myFusebox.thisCircuit = "Timekeeping">
<cfset myFusebox.thisFuseaction = "pre_name">
<cftry>
<cfoutput><cfinclude template="../Timekeeping/../common_files/act_header.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 30 and right(cfcatch.MissingFileName,30) is "../common_files/act_header.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse ../common_files/act_header.cfm in circuit Timekeeping which does not exist (from fuseaction Timekeeping.$prefuseaction).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
<cfset request.pagetitle = "Pre Defined Task Names" />
<cftry>
<cfoutput><cfinclude template="../Timekeeping/pag_pre_name.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 16 and right(cfcatch.MissingFileName,16) is "pag_pre_name.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse pag_pre_name.cfm in circuit Timekeeping which does not exist (from fuseaction Timekeeping.pre_name).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
<cfset no_banner = "1" />
<cftry>
<cfoutput><cfinclude template="../Timekeeping/../common_files/dsp_footer.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 30 and right(cfcatch.MissingFileName,30) is "../common_files/dsp_footer.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse ../common_files/dsp_footer.cfm in circuit Timekeeping which does not exist (from fuseaction Timekeeping.$postfuseaction).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
<cfcatch><cfrethrow></cfcatch>
</cftry>

