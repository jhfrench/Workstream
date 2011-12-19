<!-- Home/dsp_overview_main_menu.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_overview_main_menu.cfm">
	<responsibilities>
		I display Main page.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/24/2007" role="FuseCoder" comments="Created File">
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
<cfoutput>
<cfobject action="create" type="java" class="gov.nasa.hq.encrypt.SimpleEncDec" name="encDec">
<cfset variables.variables.encoded_username=encDec.encryptText(session.user_name)>
<cfset variables.decUsername=encDec.decryptText(variables.encoded_username)>

<img src="images/spacer.gif" alt="" width="560" height="1" /><br/>
<table border="0" cellspacing="0" cellpadding="0" width="100%" summary="table head describes the data held in the tables below">
	<tr valign="top">
		<th align="left">
			<h2 style="margin:0px">My #application.product_name#</h2>
		</th>
		<td align="right"><form action="#application.application_specific_settings.calendar_location#" method="post" id="calForm" name="calForm" target="_blank" style="display: inline;"><input type="hidden" name="uname" value="#variables.variables.encoded_username#">
			<div style="float:right:padding:0px;"><img src="images/tools01.jpg" width="23" height="35" alt="" /><a href="index.cfm?fuseaction=Systems_Analysis.welcome"><img src="images/reports.jpg" width="35" height="35" alt="reports" border="0" /></a><img src="images/module_icon_spacer.jpg" width="20" height="35" alt="" /><a href="index.cfm?fuseaction=Home.view_calendar" target="#application.product_name#_calendar"><a href="index.cfm?fuseaction=Variance.welcome"><img src="images/variance.jpg" width="35" height="35" alt="variance" border="0" /></a><img src="images/module_icon_spacer.jpg" width="20" height="35" alt="" /><a href="index.cfm?fuseaction=Home.view_calendar" target="#application.product_name#_calendar"><a href="index.cfm?fuseaction=Phasing_Plan.welcome"><img src="images/phasing_plan.jpg" width="35" height="35" alt="phasing plan" border="0" /></a><img src="images/module_icon_spacer.jpg" width="20" height="35" alt="" /><input type="image" name="submit" id="submit" src="images/calendar.jpg" alt="Submit to view the #application.product_name# calendar"><img src="images/module_icon_spacer.jpg" width="20" height="35" alt="" /><a href="index.cfm?fuseaction=Home.view_forum"><img src="images/forum.jpg" width="35" height="35" alt="Forum" border="0" /></a><img src="images/module_icon_spacer.jpg" width="20" height="35" alt="" /><a href="index.cfm?fuseaction=Administration.welcome"><img src="images/administration.jpg" width="35" height="35" alt="administration" border="0" /></a><img src="images/tools05.jpg" width="24" height="35" alt="" /></div></form>
		</td>
	</tr>
</table>
 </cfoutput>
<ul id="sort1" type="square" class="datalist">
	<cfinclude template="dsp_fiscal_year_overview.cfm"><!--- postponed to phase 2
	<cfinclude template="dsp_pending_guidelines.cfm"> --->
	<cfinclude template="dsp_pending_phasing_plans.cfm">
	<cfinclude template="pag_bw_report_links.cfm">
</ul>
