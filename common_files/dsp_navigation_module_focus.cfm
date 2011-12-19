<!-- common_files/dsp_navigation_module_FAAD.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_navigation_module_FAAD.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/17/2007" role="FuseCoder" comments="Created File">
			$Id:$
		</history>
	</properties>
	<IO>
		<in>
		</in>
		<passthrough>
		</passthrough>
		<out>
		</out>
	</IO>
</fusedoc>
--->
<cfset variables.reset_password_ind=1>
<div id="mast">
	<!--- display system notes --->
	<div id="banner">
	<cfoutput>
		<table align="center" cellpadding="0" cellspacing="0" border="0" cols="2" width="750" summary="Table displays navigation module">
			<tr>
				<td bgcolor="black" width="1%" align="right"><img src="images/mast.jpg" alt="#application.html_title#" width="730" height="120" border="0"></td>
				<td bgcolor="black" width="99%" align="center">
					<div id="ad_area"<cfif get_system_note.recordcount EQ 0> style="display:none;"</cfif>>
						<div id="ad_space" style="width:250px;padding:6px;background-color:black;color:white;font-size:9pt;border:1px dashed ##c28400;" align="left">
						<strong>Message:</strong><cfif get_system_note.recordcount GT 0><cfloop query="get_system_note" startrow="#get_system_note.recordcount#" endrow="#get_system_note.recordcount#">
							<span id="ad_message">#(left(note_text,200))#</span>
						</div>
						<div style="width:260px;padding:2px;background-color:black;color:##c28400;font-size:8pt;text-align:right;font-style:italic;">
							&raquo;<span id="ad_owner">#created_by#</span>
							&ndash;<span id="ad_date">#dateformat(created_date,"mm/dd/yyyy")#</span>
						</div></cfloop></cfif>
					</div>
				</td>
			</tr>
		</table>
	</div>
	</cfoutput>
	<div id="mastnav">
		<table align="center" cellpadding="0" cellspacing="0" border="0" cols="1" width="750" bgcolor="black" summary="table displays navigation module">
			<tr>
				<td><img src="images/spacer.gif" alt="" width="750" height="1" border="0"></td>
			</tr>
			<tr>
				<td>
					<table cellpadding="0" cellspacing="0" border="0" cols="2" width="100%" bgcolor="black" summary="Table contains navigation">
						<tr valign="top">
							<td class="toolbar" align="left" title="Table includes options for jumping to the main FAAD page, toggling the appearance of navigation links, and toggling the appearance of the help content.">
								<img src="images/end1.jpg" alt="" width="16" height="46" align="left"><a href="index.cfm?fuseaction=Home.main"><img src="images/home.jpg" alt="home" width="27" height="27" align="left" border="0"></a><cfif application.application_specific_settings.normal_navigation_ind EQ 0><a href="javascript:void(Element.toggle('sys2'); return false;)" onclick="Element.toggle('sys2'); return false;"><img src="images/nav.jpg" alt="my FAAD" width="27" height="27" align="left" border="0" style="margin-left:5px;"></a></cfif><a href="javascript:void(Element.toggle('help_win_area'); return false;)" onclick="javascript:Effect.toggle('help_area','appear'); return false;"><img src="images/help.jpg" alt="help" width="27" height="27" align="left" hspace="8" border="0" style="cursor:help;"></a>
							</td>
							<td class="toolbar" align="right"><img src="images/end2.jpg" alt="" width="16" height="46" align="right">
							<cfif isdefined("session.user_account_id") AND session.password_created_by EQ session.user_account_id>
								<cfset variables.reset_password_ind=0>
								<table cellpadding="4" cellspacing="0" border="0" height="26" align="right" cols="1" summary="table displays logout link">
									<tr>
										<td><span class="mainNav"><a href="index.cfm?fuseaction=Home.logout"><strong>Logout <cfoutput>#session.first_name# #session.last_name#</cfoutput></strong></a></span></td>
									</tr>
								</table>
							</cfif>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
</div>
