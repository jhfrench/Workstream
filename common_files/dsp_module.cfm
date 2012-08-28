
<!--common_files/dsp_module.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the navigation images and links for workstream components at the top of the page.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<head>
	<cfoutput><title>workstream #request.pagetitle#</title>
	<cfif NOT isdefined("request.wireless_header")><script laworkstream="JavaScript" src="common_files/workstream.js"></script>
	<link href="common_files/workstream.css" rel="stylesheet">
	<LINK REL="SHORTCUT ICON" HREF="http://www.nucleusweb.com/nuc_logo_3.ico">
	<meta name="Expires" content="#dateformat(now(), "ddd")#, #dateformat(dateadd("d", now(), -1), "dd")# #dateformat(now(), "mmm")# #dateformat(now(), "yyyy")# 00:00:00 GMT"></cfif></cfoutput>
</head>
<BODY leftmargin="0" topmargin="0"<cfif isdefined("onload")> onload="<cfoutput>#onload#</cfoutput>"</cfif><cfif isdefined("bgcolor")>  bgcolor="<cfoutput>#bgcolor#</cfoutput>"</cfif>>
<cfif NOT isdefined("no_banner")><cfinclude template="dsp_banner.cfm"></cfif>

