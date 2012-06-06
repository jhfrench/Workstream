
<!--Timekeeping/pag_pre_name.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the big team list page that lets the user see more employees at one time (easier scrolling).
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
 --->
<cfset bgcolor="##78A0EB">
</cfsilent>
<cfinclude template="act_pre_name_okbutton.cfm">
<cfinclude template="qry_get_predefined_names.cfm">
<cfset variables.select_size=min(get_predefined_names.recordcount,10)>
<cfform name="pre_defined" action="index.cfm?fuseaction=#attributes.fuseaction#" method="POST">
<table align="center" border="0" cellpadding="1" cellspacing="0" width="100%">
	<tr>
		<td class="SubHeadText">
			Choose A Name:
		</td>
	</tr>
	<tr>
		<td align="center" class="SubHeadText">
			<cfselect query="get_predefined_names" name="task_name" display="pre_task_name" value="pre_task_name" size="#variables.select_size#" onChange="OKButton()"></cfselect>
		</td>
	</tr>
	<cfinclude template="../common_files/dsp_big_list_submit.cfm">
</table>
</cfform>

