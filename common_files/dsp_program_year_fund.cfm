
<!-- common_files/dsp_program_year_fund.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_program_year_fund.cfm">
	<responsibilities>
		I show a drop-down of program years
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/18/2007" role="FuseCoder" comments="Created File">
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

<cfinclude template="../common_files/qry_get_program_year_fund.cfm">

<cfmodule template="../common_files/act_related_selects.cfm" query="get_program_year_fund" formname="#attributes.formname#" select_boxes="2" fieldname1="program_year_id" display1="year_description" value1="program_year_id"
	html_before2="</td>
	</tr>
	<tr>
		<td nowrap><input type='checkbox' name='hide_fund_ind' value='1' id="fund_id" /></td>
		<td><label for='fund_id'>Fund</label></td>
		<td>" fieldname2="fund_id" display2="fund_description" value2="fund_id">