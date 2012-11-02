<!-- Requirements/dsp_requirements_document.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_requirements_document.cfm">
	<responsibilities>
		I display the requirements document.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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

<cfinclude template="qry_get_all_requirements.cfm">
<cfset variables.module="">
<cfset variables.business_function="">

<h2 style="margin:0px" id="top-side">Requirements Document</h2>

<div class="datachart" style="border:1px solid ##999999">
<table width="98%" cellpadding="8" cellspacing="0" border="0" summary="table displays requriemnets documents">
<cfoutput query="get_all_requirements">
	<cfif currentrow MOD 2>
		<cfset variables.row_color="eeeeee">
	<cfelse>
		<cfset variables.row_color="dddddd">
	</cfif>
	<cfif comparenocase(get_all_requirements.business_function,variables.business_function)>
		<cfset variables.business_function=get_all_requirements.business_function>
		<cfset variables.requirement_type="">
		<tr>
			<td valign="bottom" colspan="3"><h2>#module# &gt; #business_function#</h2></td>
		</tr>
	</cfif>
	<cfif comparenocase(get_all_requirements.requirement_type,variables.requirement_type)>
		<cfset variables.requirement_type=get_all_requirements.requirement_type>
		<tr>
			<td valign="bottom" colspan="3"><strong>Requirement&nbsp;Type:</strong> #requirement_type#</td>
		</tr>
		<tr>
			<th valign="bottom" scope="column"><strong>number</strong></th>
			<th valign="bottom" scope="column"><strong>requirement</strong></th>
			<th valign="bottom" scope="column">Requirement Coded</th>
		</tr>
	</cfif>
	<tr bgcolor="###variables.row_color#" onmouseover="this.bgColor='##cccccc';this.style.cursor='hand';" onmouseout="this.bgColor='###variables.row_color#';this.style.cursor='default';">
		<cfset variables.formatted_requirement_number=ucase("#trim(acronym)#.#requirement_number#.#sort_order#")>
		<td align="right" scope="row" valign="top"><a href="index.cfm?fuseaction=Requirements.edit_requirement&requirement_id=#requirement_id#">#variables.formatted_requirement_number#</a></td>
		<td valign="top">#requirement#</td>
		<td align="center" valign="top"><cfif requirement_coded_ind>DONE</cfif>&nbsp;</td>
	</tr>
</cfoutput>
</table>
</div>