<!-- common_files/dsp_footer.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_footer.cfm">
	<responsibilities>
		I display application footer, which include generic AIT links. Depending on page accessed and whether or not the application uses the help module I may also display the help content.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/12/2007" role="FuseCoder" comments="Created File">
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
					</div>
				</td>
			</tr>
		</table>
<cfelse>
		</section>
	  	<div class="span2">
					<cfif application.use_help_module_ind>
						<!-- [[ RIGHT COLUMN START ]] -->
						<div style="visibility:hidden; height:1px; overflow:hidden">
						Help
						</div>
						<cfinclude template="../Help/dsp_screen_help.cfm">
						<!-- [[ RIGHT COLUMN END ]] -->
					</cfif>
					<img src="images/spacer.gif" alt="" height="10" width="252" border="0" /><br />
					<img src="images/watermark_digital.jpg" alt="column watermark" height="345" width="200" border="0" class="screen_only" style="opacity:0.6;position:relative;z-index:1;" />
		</div>
	  </div>
	  
      <hr>

	<footer>
			<div style="float: left;">
				&nbsp;<cfoutput>&copy; #year(now())# Applied Internet Technologies</cfoutput>
			</div>
			<div style="float: right">
				<cfoutput>Version #application.product_release_version# (Last Updated: #dateformat(application.last_updated, "mmmm d, yyyy")#)</cfoutput>&nbsp;
			</div>
	</footer>
<script>window.jQuery || document.write('<script src="common_files/js/libs/jquery-1.7.1.js"><\/script>')</script>
<script src="common_files/js/libs/bootstrap/transition.js"></script>
<script src="common_files/js/libs/bootstrap/collapse.js"></script>
<script src="common_files/js/libs/bootstrap/dropdown.js"></script>

<script src="common_files/js/plugins.js"></script>
<script src="common_files/js/script.js"></script>
</cfif>
<!--- I provide a hidden div within which you can have Ajax load (and process) a specified fuseaction. This is useful for things like ordering lots of data after an upload (without making the upload wait for the ordering), or setting session variables without reloading the controlling page (like hiding the navigation bar). --->
<div id="hidden_process" style="display:none;"></div>
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