<!--common_files/dsp_banner.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I 
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	Variables:
	
	END FUSEDOC --->
<table border=0 cellPadding=0 cellSpacing=0 width="100%" bgcolor="0000ff">
<tr>
	<td>
<table border=0 cellPadding=0 cellSpacing=0 width="100%" bgcolor="0000ff">
	<tr valign="middle">
		<td align="right" width="276" valign="middle"><img src="<cfoutput>#request.dir_level##application.application_specific_settings.image_dir#</cfoutput>banner_left.jpg" width="270" height="81" alt="" border="0"></td>
		<td width="276" height="100"><cfset counter=1></td>
	<td></td>
	<td></td>
	</tr>
	<tr bgcolor="000000">
		<td colspan="2" background="<cfoutput>#request.dir_level##application.application_specific_settings.image_dir#border_top.gif"><img src="#request.dir_level##application.application_specific_settings.image_dir#border_top.gif</cfoutput>" border="0" height="3"></td>
		<td bgcolor="#0000ff"><img src="<cfoutput>#request.dir_level##application.application_specific_settings.image_dir#angle_top.gif</cfoutput>" border="0" height="3" width="3"></td>
	</tr>
	<cfinclude template="#request.navigation#">
	<tr bgcolor="#000000">
		<td colspan="2" background="<cfoutput>#request.dir_level##application.application_specific_settings.image_dir#border_bottom.gif"><img src="#request.dir_level##application.application_specific_settings.image_dir#border_bottom.gif</cfoutput>" border="0" height="2"></td>
		<td align="left" bgcolor="#0000ff"><img src="<cfoutput>#request.dir_level##application.application_specific_settings.image_dir#angle_bottom.gif</cfoutput>" border="0" height="2" width="23"></td>
	</tr>
</table>
	</td>
	<td></td>
	<td align="center" rowspan="2" width="440"><cfif session.workstream_display_chat><OBJECT classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
 codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0"
 WIDTH="340" HEIGHT="127">
	<PARAM name="MOVIE" value="http://10.1.1.3/flashchat/newchatinterface.swf?userID=<cfoutput>#session.workstream_authuser#</cfoutput>">
	<PARAM name="PLAY" value="true">
	<PARAM name="LOOP" value="false">
	<PARAM name="QUALITY" value="high">
	<PARAM name="MENU" value="false">
	<PARAM name="BGCOLOR" value="#0000ff">
	<EMBED SRC="http://10.1.1.3/flashchat/newchatinterface.swf?userID=<cfoutput>#session.workstream_authuser#</cfoutput>"
	WIDTH="340" HEIGHT="127"
	BGCOLOR="#0000FF"
	PLAY="true"
	LOOP="false"
	QUALITY="high"
	MENU="false"
	TYPE="application/x-shockwave-flash"
	PLUGINSPAGE="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash">
	</EMBED>
</OBJECT><cfelse>&nbsp;</cfif></td>
</tr>
<cfoutput>
<tr bgcolor="##ff0000">
	<td bgcolor="##ffffff"></td>
	<td align="left" bgcolor="##0000ff"><img src="#request.dir_level##application.application_specific_settings.image_dir#angle_abs_bottom.gif" border="0" height="8" width="8"></td>
</tr>
<tr valign="top" bgcolor="##ffffff">
	<td align="right" colspan="2" bgcolor="##ffffff"></td>
	<td align="left" colspan="1" background="#request.dir_level##application.application_specific_settings.image_dir#border_top2.gif"><img src="#request.dir_level##application.application_specific_settings.image_dir#border_top2.gif" border="0" height="2"></td>
</tr>
</cfoutput>
</table>

