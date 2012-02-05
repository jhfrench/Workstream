<!-- Administration/pag_view_sent_email.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_view_sent_email.cfm">
	<responsibilities>
		I show a list of emails that have been sent by the system.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="2/28/11" role="FuseCoder" comments="Created File">
			$Id:$
			(JF | 6/15/11)
			Added ability to view emails sent through the application.
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
<cfinclude template="qry_get_log_email.cfm">
<cfinclude template="dsp_view_sent_email.cfm">