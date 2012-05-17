<!-- common_files/dsp_report_footer.cfm
	Author: Marithe Le-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_report_footer.cfm">
	<responsibilities>
		I display footer for application reports.
	</responsibilities>
	<properties>
		<history email="marithe.le@nasa.gov" author="Marithe Le" type="create" date="4/21/2008" role="FuseCoder" comments="Created File">
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

<cfdocumentitem type="footer">
	<cfoutput>
	<table border="0" cellspacing="0" cols="2" width="100%" summary="Report footer">
		<tr bgcolor="##999999">
			<td align="left">
				#dateformat(now(),"mm/dd/yyyy")#
			</td>
			<td class="number">
				#cfdocument.currentpagenumber# of #cfdocument.totalpagecount#
			</td>
		</tr>
	</table>
	</cfoutput>
</cfdocumentitem>