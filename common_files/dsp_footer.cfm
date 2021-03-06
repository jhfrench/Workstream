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
<cfif variables.show_footer_ind>
		</section>
	</div>
	<cfif application.help.active_ind>
	<div class="row-fluid">
		<aside id="help_area" role="complementary" class="span12 alert alert-info">
			<cfinclude template="../Help/dsp_screen_help.cfm">
		</aside>
	</div>
	</cfif>
	<footer role="contentinfo" class="row-fluid visible-desktop">
		<div class="span4">
			&nbsp;<cfoutput>&copy; #year(now())# #application.application_specific_settings.organization#</cfoutput>
		</div>
		<div class="span4">
			<noscript>
			This application provides the optimal experience when JavaScript is enabled.
			</noscript>
		</div>
		<div class="span4 pull-right">
			<cfoutput>Version #application.product_release_version# (Last Updated: #dateformat(application.last_updated, "mmmm d, yyyy")#)</cfoutput>
		</div>
	</footer>
	<!--- I provide a hidden div within which you can have Ajax load (and process) a specified fuseaction. This is useful for things like ordering lots of data after an upload (without making the upload wait for the ordering), or setting session variables without reloading the controlling page (like hiding the navigation bar). --->
	<div id="hidden_process" style="display:none;" aria-hidden="true"></div>
</cfif>
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
</body>
</html>
<!-- Footer ends -->
