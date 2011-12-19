<cfsetting enablecfoutputonly="Yes">
<cfprocessingdirective pageencoding="utf-8">
<!--- main.login: <fusebox:set value="main" name="myFusebox.thisCircuit">         --->
<cfset myFusebox.thisCircuit="main">
<!--- main.login: <fusebox:set value="login" name="myFusebox.thisFuseaction">     --->
<cfset myFusebox.thisFuseaction="login">
<!--- main.login: <fusebox:set value="main" name="myFusebox.thisCircuit">         --->
<cfset myFusebox.thisCircuit="main">
<!--- main.login: <fusebox:set value="main" name="myFusebox.thisCircuit">         --->
<cfset myFusebox.thisCircuit="main">
<!--- main.login: <fusebox:set value="login" name="myFusebox.thisFuseaction">     --->
<cfset myFusebox.thisFuseaction="login">
<!--- main.login: <fusebox:include template="pag_login.cfm">                      --->
<cftry>
	<cfoutput><cfinclude template="../main/pag_login.cfm"></cfoutput>
	<cfcatch type="missingInclude">
		<cfif Right(cfcatch.missingFilename, len("main/pag_login.cfm") ) EQ "main/pag_login.cfm">
			<cfthrow type="fusebox.missingFuse" message="missing Fuse" detail="You tried to include a fuse pag_login.cfm in circuit main which does not exist.">
		<cfelse>
			<cfrethrow>
		</cfif>
	</cfcatch>
</cftry>
<!--- main.login: <fusebox:set value="login" name="myFusebox.thisFuseaction">     --->
<cfset myFusebox.thisFuseaction="login">
<!--- main.login: <fusebox:set value="main" name="myFusebox.thisCircuit">         --->
<cfset myFusebox.thisCircuit="main">
<!--- main.login: <fusebox:set value="main" name="myFusebox.thisCircuit">         --->
<cfset myFusebox.thisCircuit="main">
<!--- main.login: <fusebox:set value="login" name="myFusebox.thisFuseaction">     --->
<cfset myFusebox.thisFuseaction="login">
<cfsetting enablecfoutputonly="No">

