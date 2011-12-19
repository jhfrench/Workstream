
<!--Search/pag_search.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the search output screen for workstream.
	||
	Name: 
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->

<cfparam name="attributes.priority_id" default="">
<cfparam name="attributes.task_id" default="">
<cfparam name="attributes.customers_id" default="">
<cfparam name="attributes.project_id" default="">
<cfparam name="attributes.task_stati" default="">
<cfparam name="attributes.task_owner" default="">
<cfparam name="attributes.task_source" default="">
<cfparam name="attributes.used_by_search" default="1">
<cfparam name="attributes.notes" default="">
<cfparam name="attributes.date_entered_operator" default="">
<cfparam name="attributes.date_entered" default="">
<cfparam name="attributes.due_date" default="">
<cfparam name="attributes.due_date_operator" default="">
<cfparam name="attributes.task_name" default="">
</cfsilent>
<cfinclude template="../common_files/act_client_vars.cfm">
<cfinclude template="../timekeeping/act_task_list_order.cfm">
<cfinclude template="qry_search.cfm">
<table align="center" cellpadding="0" cellspacing="0" border="0" width="100%">
	<!---<cfinclude template="../timekeeping/dsp_dropdowns.cfm">--->
    <cfinclude template="../timekeeping/dsp_task_list_header.cfm"> 
	<cfinclude template="../timekeeping/dsp_task_list.cfm">
 

</table>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="order_by" field_name="order_by" fuseaction="output" processform="true" field2_name="reorder" field2_value="1">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_task" field_name="task_id" directory_action="../Timekeeping/" fuseaction="task_details">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_time" directory_action="../Timekeeping/" field_name="task_id" fuseaction="time_details">


<cfoutput>

<table align="center" cellpadding="0" cellspacing="0" border="0" width="100%">
<tr>
<td align="center">&nbsp;</td>
<td class="RegText#session.workstream_text_size#">
 <form name="edit_form" action="index.cfm?fuseaction=edit_search" method="POST" >
    <cfif isdefined("attributes.task_name_box")>
   <input type="hidden" name="task_name_box" value= "1">
   </cfif>
  	<input type="hidden" name="Task_Name"    value="#attributes.Task_Name#">
	<cfif isdefined("attributes.task_id_box")>
	<input type="hidden" name="task_id_box" value= "1">
	</cfif>
  	<input type="hidden" name="task_id"    value="#attributes.task_id#">
	<cfif isdefined("attributes.date_entered_box")>
    <input type="hidden" name="date_entered_box" value="1">
	</cfif>

	<input type="hidden" name="date_entered_operator" value= "#attributes.date_entered_operator#">
	<input type="hidden" name="date_entered"    value="#attributes.date_entered#">
	<cfif isdefined("attributes.date_entered_box")>
	<input type="hidden" name="date_entered_box" value="1">
	</cfif>
	<input type="hidden" name="due_date_operator" value= "#attributes.due_date_operator#">
    <input type="hidden" name="due_date"    value="#attributes.due_date#">
	<cfif isdefined("attributes.due_date_box")>
	<input type="hidden" name="due_date_box" value= "1">
	</cfif>
	
  	<input type="hidden" name="priority_id"    value="#attributes.priority_id#">
	<cfif isdefined("attributes.task_stati_box")>
	<input type="hidden" name="task_stati_box" value= "1">
	</cfif>
  	<input type="hidden" name="task_stati"    value="#attributes.task_stati#">
	<cfif isdefined("attributes.note_box")>
	<input type="hidden" name="note_box" value= "1">
	</cfif>
  	<input type="hidden" name="notes"    value="#attributes.notes#">
	<cfif isdefined("attributes.customer_id_box")>
	<input type="hidden" name="customer_id_box" value= "1">
	</cfif>
  	<input type="hidden" name="customers_id"    value="#attributes.customers_id#">
	<cfif isdefined("attributes.project_id_box")>
	<input type="hidden" name="project_id_box" value= "1">
	</cfif>
  	<input type="hidden" name="project_id"    value="#attributes.project_id#">
  	<input type="hidden" name="task_owner"    value="#attributes.task_owner#">
	<cfif isdefined("attributes.task_source_box")>
	<input type="hidden" name="task_source_box" value= "1">
	</cfif>
  	<input type="hidden" name="task_source"    value="#attributes.task_source#">
	
	</td>
	<td class="RegText#session.workstream_text_size#">&nbsp;</td>
	</tr>
		<tr>
		<td align="center" colspan="3" class="RegText#session.workstream_text_size#">
			<br><input type="submit" value="Edit Search" class="RegText#session.workstream_text_size#">
		</td>
	</tr>
 </form>
 </table>
 </cfoutput>

