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
			<!-- [[ RIGHT COLUMN START ]] -->
			<cfif application.use_help_module_ind>
				<cfinclude template="../Help/dsp_screen_help.cfm">
			</cfif>
			<div id="watermark"></div>
			<!-- [[ RIGHT COLUMN END ]] -->
		</div>
	  </div>
	  
      <hr>

	<footer role="contentinfo" class="row-fluid screen_only">
			<div style="float: left;">
				&nbsp;<cfoutput>&copy; #year(now())# Applied Internet Technologies</cfoutput>
			</div>
			<div style="float: right">
				<cfoutput>Version #application.product_release_version# (Last Updated: #dateformat(application.last_updated, "mmmm d, yyyy")#)</cfoutput>&nbsp;
			</div>
	</footer>
<!-- load JavaScript here to speed page load time -->
	<script src="common_files/js/libs/less-1.2.1.min.js"></script>

	<script type="text/javascript">			
		(function () {
			if (/Microsoft/.test(navigator.appName)) { return }
			
			window.onload = function () {
				<cfoutput>#get_screen_details.body_onload#</cfoutput>
				var menu = document.getElementById('menu');
				var init = menu.offsetTop;
				var docked;
				
				window.onscroll = function () {
					if (!docked && (menu.offsetTop - scrollTop() < 0)) {
						menu.style.top = 0;
						menu.style.position = 'fixed';
						menu.className = 'docked';
						docked = true;
					} else if (docked && scrollTop() <= init) {
						menu.style.position = 'absolute';
						menu.style.top = init + 'px';
						menu.className = menu.className.replace('docked', '');
						docked = false;
					}
				};
			};
		})();
	</script>

	<script type="text/javascript">
		$(document).ready(function () {
			<cfif application.use_help_module_ind>
			getHelp('article', default_help);
			getHelp('faq', default_faq);
			</cfif>
		});
	</script>
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