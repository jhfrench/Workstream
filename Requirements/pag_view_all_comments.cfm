<!-- Comments/pag_view_all_comments.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_view_all_comments.cfm">
	<responsibilities>
		I display all user comments for the application.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/19/2007" role="FuseCoder" comments="Created File">
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

<cfinclude template="qry_get_all_comments.cfm">
<cfset variables.comments_type="">
<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="table headers describe the data held within this table">
	<tr>
		<th align="left"><h2 style="margin:0px" id="top-side">Comments Document</h2></th>
	</tr>
</table>

<div class="datachart" style="border:1px solid ##999999">
<table width="98%" cellpadding="8" cellspacing="0" border="0" summary="table headers deescribe the data held within this talbe">
<cfoutput query="get_all_comments">
	<cfif currentrow MOD 2>
		<cfset variables.row_color="eeeeee">
	<cfelse>
		<cfset variables.row_color="dddddd">
	</cfif>
	<cfif comparenocase(get_all_comments.comments_type,variables.comments_type)>
		<cfset variables.comments_type=get_all_comments.comments_type>
		<cfset variables.module="">
		<tr>
			<td colspan="2">&nbsp;</td>
			<td valign="bottom" colspan="2"><h1>Comments&nbsp;Type</h1></td>
			<td>&nbsp;</td>
			<td valign="bottom"><h1>#comments_type#</h1></td>
		</tr>
	</cfif>
	<cfif comparenocase(get_all_comments.module,variables.module)>
		<cfset variables.module=get_all_comments.module>
		<cfset variables.business_function="">
		<tr>
			<td valign="bottom" colspan="4"><h2>Module</h2></td>
			<td>&nbsp;</td>
			<td valign="bottom"><h3>#module#</h3></td>
		</tr>
	</cfif>
	<cfif comparenocase(get_all_comments.business_function,variables.business_function)>
		<cfset variables.business_function=get_all_comments.business_function>
		<tr>
			<td>&nbsp;</td>
			<td valign="bottom" colspan="3"><strong>Business&nbsp;Function</strong></td>
			<td>&nbsp;</td>
			<td valign="bottom"><strong>#business_function#</strong></td>
		</tr>
		<tr>
			<td colspan="3">&nbsp;</td>
			<td align="right" valign="bottom"><strong>number</strong></td>
			<td>&nbsp;</td>
			<td valign="bottom"><strong>comments</strong></td>
		</tr>
	</cfif>
	<tr bgcolor="###variables.row_color#" onmouseover="this.bgColor='##cccccc';this.style.cursor='hand';" onmouseout="this.bgColor='###variables.row_color#';this.style.cursor='default';">
		<cfset variables.formatted_comments_number=ucase("#left(variables.module,3)#.#trim(acronym)#.#comments_number#")>
		<td colspan="3">&nbsp;</td>
		<td align="right" valign="top"><a href="index.cfm?fuseaction=Requirements.edit_comment&comments_id=#comments_id#">#variables.formatted_comments_number#</a></td>
		<td>&nbsp;</td>
		<td valign="top">#comments#</td>
	</tr>
</cfoutput>
</table>
</div>