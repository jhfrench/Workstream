<!-- Administration/dsp_list_system_notes.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_list_system_notes.cfm">
	<responsibilities>
		Page to display a list of messages.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="9/21/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.system_note_id" default="0">
<cfparam name="attributes.display_start_date" default="">
<cfparam name="attributes.display_end_date" default="">

<ul class="breadcrumb">
  <li>Administer Messages <span class="divider">/</span></li>
  <li class="active"><a href="javascript:edit_system_note(0)">Add new system message</a></li>
</ul>

<img src="images/spacer.gif" alt="" width="560" height="1"><br />

<div class="datachart" style="border:1px solid #999999">
<table cellpadding="3" cellspacing="0" width="100%" border="0" summary="Table displays system messages">
	<tr align="left" bgcolor="#999999">
		<th>System Message</th>
		<th>Start Date</th>
		<th>End Date</th>
		<th>Author</th>
	</tr>
	<cfoutput query="get_system_note">
		<cfif currentrow MOD 2>
			<cfset variables.row_color="eeeeee">
		<cfelse>
			<cfset variables.row_color="dddddd">
		</cfif>
		<tr align="left" bgcolor="###variables.row_color#" onmouseover="this.bgColor='##cfdee3';this.style.cursor='hand';" onmouseout="this.bgColor='###variables.row_color#';this.style.cursor='default';" onclick="javascript:Element.toggle('var_id_#currentrow#'); return false;">
			<!--- <td id="system_note_id"><a href="javascript:edit_system_note(#system_note_id#)">#note_text#</a></td> --->
			<td id="system_note_id" width="40%">
				<a href="javascript:edit_system_note(#system_note_id#)">#jsstringformat(left(note_text, 50))#<cfif len(note_text) GT 50>...</cfif></a>
			</td>
			<td id="display_start_date">#dateformat(display_start_date, 'm/d/yyyy')#</td>
			<td id="display_end_date">#dateformat(display_end_date, 'm/d/yyyy')#</td>
			<td id="created_by">#created_by#</td>
		</tr>
	</cfoutput>
</table>
</div>
