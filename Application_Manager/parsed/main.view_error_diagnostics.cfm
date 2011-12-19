<cfsetting enablecfoutputonly="Yes">
<cfprocessingdirective pageencoding="utf-8">
<!--- main.view_error_diagnostics: <fusebox:set value="main" name="myFusebox.thisCircuit"> --->
<cfset myFusebox.thisCircuit="main">
<!--- main.view_error_diagnostics: <fusebox:set value="view_error_diagnostics" name="myFusebox.thisFuseaction"> --->
<cfset myFusebox.thisFuseaction="view_error_diagnostics">
<!--- main.view_error_diagnostics: <fusebox:set value="main" name="myFusebox.thisCircuit"> --->
<cfset myFusebox.thisCircuit="main">
<!--- main.view_error_diagnostics: <fusebox:set value="main" name="myFusebox.thisCircuit"> --->
<cfset myFusebox.thisCircuit="main">
<!--- main.view_error_diagnostics: <fusebox:set value="view_error_diagnostics" name="myFusebox.thisFuseaction"> --->
<cfset myFusebox.thisFuseaction="view_error_diagnostics">
<!--- main.view_error_diagnostics: <fusebox:include template="../errortemplates/dsp_view_error_diagnostics.cfm"> --->
<cftry>
	<cfoutput><cfinclude template="../main/../errortemplates/dsp_view_error_diagnostics.cfm"></cfoutput>
	<cfcatch type="missingInclude">
		<cfif Right(cfcatch.missingFilename, len("main/../errortemplates/dsp_view_error_diagnostics.cfm") ) EQ "main/../errortemplates/dsp_view_error_diagnostics.cfm">
			<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse ../errortemplates/dsp_view_error_diagnostics.cfm in circuit main which does not exist.">
		<cfelse>
			<cfrethrow>
		</cfif>
	</cfcatch>
</cftry>
<!--- main.view_error_diagnostics: <fusebox:set value="view_error_diagnostics" name="myFusebox.thisFuseaction"> --->
<cfset myFusebox.thisFuseaction="view_error_diagnostics">
<!--- main.view_error_diagnostics: <fusebox:set value="main" name="myFusebox.thisCircuit"> --->
<cfset myFusebox.thisCircuit="main">
<!--- main.view_error_diagnostics: <fusebox:set value="main" name="myFusebox.thisCircuit"> --->
<cfset myFusebox.thisCircuit="main">
<!--- main.view_error_diagnostics: <fusebox:set value="view_error_diagnostics" name="myFusebox.thisFuseaction"> --->
<cfset myFusebox.thisFuseaction="view_error_diagnostics">
<cfsetting enablecfoutputonly="No">

