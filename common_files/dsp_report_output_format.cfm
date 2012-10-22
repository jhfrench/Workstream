<!-- common_files/dsp_report_output_format.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_report_output_format.cfm">
	<responsibilities>
		I show the report output selection criteria.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="1/10/2008" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.colspan" default="">
<tr bgcolor="#eeeeee">
	<td nowrap width="20%"<cfif len(attributes.colspan)> colspan="<cfoutput>#attributes.colspan#</cfoutput>"</cfif> valign="top"><label for="report_output_format_id">Output</label></td>
	<td width="80%" valign="top">
		<select name="report_output_format_id" id="report_output_format_id">
			<option value="1" selected="selected">HTML</option>
			<option value="2">Excel</option>
			<option value="3">PDF</option>
		</select>
		<br />
		<a href="http://www.adobe.com/products/acrobat/readstep2.html" target="_blank">
			<i class="icon_file_pdf" title="P D F logo"></i> <abbr title="Postrscript Document Format">PDF</abbr> output requires PDF viewer.
		</a>
		<br />
		<a href="http://office.microsoft.com/downloads/2000/xlviewer.aspx" target="_blank">
			<i class="icon_file_xls" title="Microsoft Excel logo"></i> Excel output requires Excel viewer.
		</a>
	</td>
</tr>