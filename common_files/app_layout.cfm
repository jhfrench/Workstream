<!--common_files/app_layout.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: Call the top navigation banners and pass perameters that determine what they display.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	<-- request.headerfile: 
	<-- request.navigation: 
	<-- request.subnav: 
	<-- request.footerfile: 
	<-- request.bodycontent: 
	<-- attributes.showbody: 
	END FUSEDOC --->
<cfparam name="menu_test" default="false">
<cfparam name="request.headerfile" default="dsp_module.cfm">
<cfparam name="request.subnav" default="">
<cfparam name="request.footerfile" default="dsp_footer.cfm">
<cfparam name="request.bodycontent" default="">
<cfparam name="request.pagetitle" default="">
<cfparam name="attributes.showbody" default="yes">
</cfsilent>

<cfif len(request.headerfile)><cfinclude template="#request.headerfile#"></cfif>
<!--- <cfif len(request.navigation)><cfinclude template="#request.navigation#"></cfif>
<cfif len(request.subnav)><cfinclude template="#request.subnav#"></cfif> --->
<cfif attributes.showbody><cfoutput>#request.bodycontent#</cfoutput></cfif>
<cfif len(request.footerfile)><cfinclude template="#request.footerfile#"></cfif>

