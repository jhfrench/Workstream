<!-- common_files/dsp_program_year.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_program_year.cfm">
	<responsibilities>
		I show a drop-down of program years.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="6/18/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.colspan" default="1">
<cfparam name="attributes.bgcolor" default="">
<cfparam name="attributes.onchange" default="">

<cfinclude template="../common_files/qry_get_program_year.cfm">
<cfoutput>
<cfif get_program_year.recordcount GT 1>
<tr<cfif len(attributes.bgcolor)> bgcolor="###attributes.bgcolor#"</cfif>>
	<td colspan="#attributes.colspan#" align="right"><label for="program_year_id">Program Year </label></td>
	<td>
		<cfselect name="program_year_id" id="program_year_id" query="get_program_year" display="description" value="program_year_id" selected="#session.program_year_id#" size="1" required="yes" message="Please choose a program year option." onChange="#attributes.onchange#">
		</cfselect>
	</td>
</tr>
<cfelse>
	<input type="hidden" name="program_year_id" value="#get_program_year.program_year_id#" />
</cfif>
</cfoutput>