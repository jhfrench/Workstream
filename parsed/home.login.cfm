<cfsetting enablecfoutputonly="true" />
<cfprocessingdirective pageencoding="utf-8" />
<!--- circuit: Home --->
<!--- fuseaction: login --->
<cftry>
<cfset myFusebox.thisPhase = "requestedFuseaction">
<cfset myFusebox.thisCircuit = "Home">
<cfset myFusebox.thisFuseaction = "login">
<cftry>
<cfoutput><cfinclude template="../Home/../common_files/act_header.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 30 and right(cfcatch.MissingFileName,30) is "../common_files/act_header.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse ../common_files/act_header.cfm in circuit Home which does not exist (from fuseaction Home.login).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
<cftry>
<cfoutput><cfinclude template="../Home/pag_login.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 13 and right(cfcatch.MissingFileName,13) is "pag_login.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse pag_login.cfm in circuit Home which does not exist (from fuseaction Home.login).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
<cftry>
<cfoutput><cfinclude template="../Home/../common_files/dsp_footer.cfm"></cfoutput>
<cfcatch type="missingInclude"><cfif len(cfcatch.MissingFileName) gte 30 and right(cfcatch.MissingFileName,30) is "../common_files/dsp_footer.cfm">
<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse ../common_files/dsp_footer.cfm in circuit Home which does not exist (from fuseaction Home.login).">
<cfelse><cfrethrow></cfif></cfcatch></cftry>
<cfcatch><cfrethrow></cfcatch>
</cftry>

