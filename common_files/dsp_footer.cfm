<!-- common_files/dsp_footer.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_footer.cfm">
	<responsibilities>
		I display application footer, which include generic NASA links. Depending on page accessed and whether or not the application uses the help module I may also display the help content.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/12/2007" role="FuseCoder" comments="Created File">
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

<!-- END MAIN BODY -->
<cfif listfindnocase("Administration.clean_up_old_accounts,Home.login,Home.forget_password,Home.forget_username", url.fuseaction)>
							</div>
						</div>
<cfelse>
					</td>
					<td bgcolor="#cccccc" width="1"><img src="images/spacer.gif" alt="" height="1" width="1" border="0" /></td>
					<td align="center" valign="top" id="help_win_area">
					<cfif application.use_help_module_ind>
						<!-- [[ RIGHT COLUMN START ]] -->
						<div style="visibility:hidden; height:1px; overflow:hidden">
						Help
						</div>
						<cfinclude template="../Help/dsp_screen_help.cfm">
						<!-- [[ RIGHT COLUMN END ]] -->
					</cfif>
					<img src="images/spacer.gif" alt="" height="10" width="252" border="0" /><br />
					<img src="images/watermark_christmas.jpg" alt="column watermark" height="345" width="200" border="0" class="screen_only" />
					</td>
</cfif>
				</tr>
			</table>
		</td>
	</tr>
	<!-- Footer starts -->
	<tr>
		<td width="1160" style="background-color: #cccccc;">
			<div style="float: left;">
				&nbsp;<cfoutput>&copy; #year(now())# Applied Internet Technologies</cfoutput>
			</div>
			<div style="float: right">
				<cfoutput>Version #application.product_release_version# (Last Updated: #dateformat(application.last_updated, "mmmm d, yyyy")#)</cfoutput>&nbsp;
			</div>
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