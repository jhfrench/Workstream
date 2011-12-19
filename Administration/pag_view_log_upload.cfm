<!-- Administration/pag_view_log_upload.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_view_log_upload.cfm">
	<responsibilities>
		I show a list of files that have been uploaded into the system.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="2/28/11" role="FuseCoder" comments="Created File">
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
<h2>View Uploaded Files</h2>
<cfinclude template="qry_get_log_upload.cfm">
<cfinclude template="dsp_view_log_upload.cfm">