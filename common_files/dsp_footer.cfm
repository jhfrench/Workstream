<!-- common_files/dsp_footer.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_footer.cfm">
	<responsibilities>
		I display application footer, which include generic NASA links. Depending on page accessed and whether or not the application uses the help module I may also display the help content.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/12/2007" role="FuseCoder" comments="Created File">
			$Id:$
			(3/15/11 | JF)
			Adding right-hand column shuttle watermark.
			
			(8/5/11 | JF)
			Instead of loading the help area to the screen then fading it out with the on-load event, we should just load it with style display:none.
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
<cfsavecontent variable="variables.odd_footer">
								</div>
							</div>
						</td>
</cfsavecontent>
<cfparam name="attributes.odd_footer" default="#variables.odd_footer#">

<!-- END MAIN BODY -->
<cfif listfindnocase("Administration.clean_up_old_accounts,Home.login,Home.forget_password,Home.forget_username", url.fuseaction)>
<cfoutput>#attributes.odd_footer#</cfoutput>
<cfelse>
					</td>
					<td bgcolor="#cccccc" width="1"><img src="images/spacer.gif" alt="" height="1" width="1" border="0" /></td>
					<td align="center" valign="top" id="help_win_area" class="screen_only">
					<cfif application.use_help_module_ind>
						<!-- [[ RIGHT COLUMN START ]] -->
						<div style="display:none; height:1px; overflow:hidden;">
						Help
						</div>
						<cfinclude template="../Help/dsp_screen_help.cfm">
						<!-- [[ RIGHT COLUMN END ]] -->
					</cfif>
					<img src="images/spacer.gif" alt="" height="10" width="252" border="0" /><br />
					<img src="images/watermark_shuttle.jpg" alt="space shuttle watermark" height="345" width="200" border="0" />
					</td>
</cfif>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<!-- Footer starts -->
			<table bgcolor="#cccccc" border="0" cellpadding="4" cellspacing="0" cols="3" width="100%" summary="Table displays footer information" class="screen_only">
				<tr valign="top">
					<td align="left" bgcolor="#cccccc">
						<img src="images/spacer.gif" alt="" width="400" height="1" border="0" /><br />
						<!--- xml file should eventually point to NASA public portal (like http://www.nasa.gov/includes/NASA_Footer.rss)--->
						<!--- <iframe src="common_files/NASA_Footer.xml" width="400" height="185" marginwidth="0" marginheight="0" hspace="0" vspace="0" frameborder="0" scrolling="no">NASA Footer</iframe>--->
						<a href="http://www.hq.nasa.gov/office/pao/FOIA/agency/">+ Freedom of Information Act</a><br />
						<a href="http://www.nasa.gov/about/budget/index.html">+ Budgets, Strategic Plans and Accountability Reports</a><br />
						<a href="http://www.nasa.gov/about/highlights/HP_Management.html">+ The President's Management Agenda</a><br />
						<a href="http://www.nasa.gov/about/highlights/HP_Privacy.html">+ Privacy Policy and Important Notices</a><br />
						<a href="http://www.hq.nasa.gov/office/oig/hq/hotline.html">+ Inspector General Hotline</a><br />
						<a href="http://www.hq.nasa.gov/office/codee/nofear.html">+ Equal Employment Opportunity Data Posted Pursuant to the No Fear Act</a><br />
						<a href="http://www.nasa.gov/about/contact/information_inventories_schedules.html">+ Information-Dissemination Priorities and Inventories</a><br />
						<a href="http://www.usa.gov/">+ USA.gov-Your First Click to the US Government</a><br />
						<a href="http://www.whitehouse.gov/omb/expectmore/">+ ExpectMore-A Program Which Determines Whether Government Programs Are Effective</a><br /> 
					</td>
					<td align="right" style="white-space: nowrap;"><a href="http://www.nasa.gov/home/index.html" title="NASA.gov homepage"><img src="images/footer_logo_nasa.gif" alt="National Aeronautics and Space Administration" width="49" height="48" border="0" /></a><img src="images/spacer.gif" alt="" width="6" align="right" height="48" border="0" /></td>
					<td class="footerLnk">
						<img src="images/spacer.gif" alt="" width="170" height="10" border="0" /><br /><cfoutput>
						<acronym title="National Aeronautics and Space Administration">NASA</acronym> Official: #application.application_specific_settings.nasa_official#<br />
						Curator: <acronym title="Headquarters Information Technology Support Services">HITSS</acronym><br />
						Last Updated: #dateformat(application.last_updated, "mmmm d, yyyy")#<!-- #application.product_release_version# --></cfoutput><br />
						<a class="footerLnk" href="http://www.nasa.gov/about/contact/index.html">+ Contact <acronym title="National Aeronautics and Space Administration">NASA</acronym></a><br />
						<a class="footerLnk" href="http://www.nasa.gov/sitemap/sitemap_nasa.html">+ SiteMap</a><br />
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<!--- I provide a hidden div within which you can have Ajax load (and process) a specified fuseaction. This is useful for things like ordering lots of data after an upload (without making the upload wait for the ordering), or setting session variables without reloading the controlling page (like hiding the navigation bar). --->
<div id="hidden_process" style="display:none;">
</div>
	<cfif application.application_specific_settings.show_requirements_ind EQ 1>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<p>&nbsp;</p>
		<cfinclude template="../Requirements/dsp_screen_requirements.cfm">
		<cfinclude template="../Requirements/dsp_screen_comments.cfm">
	</cfif>
	<noscript>
	Please enable JavaScript so you can use this application.
	</noscript>
	</body>
</html>
<!-- Footer ends -->