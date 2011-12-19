
<!--Timekeeping/dsp_task_print_table.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the attributes of a task in an easily printed format.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
	<cfparam name="attributes.expand" default="0">
</cfsilent>


<cfoutput>
	<tr>
		<td align="right" width="3%" class="SubHeadText#session.workstream_text_size#">
			Owner:
		</td>
		<td class="RegText#session.workstream_text_size#">
			#convert_owner.name# #convert_owner.lname#
		</td>
		<td align="right" width="3%" class="SubHeadText#session.workstream_text_size#">
			Source:
		</td>
		<td class="RegText#session.workstream_text_size#">
			#convert_source.name# #convert_source.lname#
		</td>
		<td align="right" width="3%" class="SubHeadText#session.workstream_text_size#">
			QA:
		</td>
		<td class="RegText#session.workstream_text_size#">
			#convert_qa.name# #convert_qa.lname#
		</td>
	</tr>
	<tr>
		<td align="right" valign="top" class="SubHeadText#session.workstream_text_size#">
			Team:
		</td>
		<td colspan="5" class="RegText#session.workstream_text_size#"></cfoutput>
			<cfset variables.task_team=""><cfoutput query="convert_team_members"><cfset variables.task_team=listappend(variables.task_team," #name# #lname#")></cfoutput><cfoutput>#trim(variables.task_team)#</cfoutput>
		</td>
	</tr>
<cfoutput query="get_task_details">
	<tr>
		<td align="right" class="SubHeadText#session.workstream_text_size#">
			Customer:
		</td>
		<td class="RegText#session.workstream_text_size#">
			#customer_name#
		</td>
		<td align="right" class="SubHeadText#session.workstream_text_size#">
			Project:
		</td>
		<td class="RegText#session.workstream_text_size#">
			#replace(project_name,"#customer_name#-","")#
		</td>
		<td align="right" class="SubHeadText#session.workstream_text_size#">
			Priority:
		</td>
		<td class="RegText#session.workstream_text_size#">
			#priority#
		</td>
	</tr>
	<tr>
		<td align="right" class="SubHeadText#session.workstream_text_size#">
			Assigned:
		</td>
		<td class="RegText#session.workstream_text_size#">
			#DateFormat(date_assigned,"mm/dd/yy")#
		</td>
		<td align="right" class="SubHeadText#session.workstream_text_size#">
			Due:
		</td>
		<td class="RegText#session.workstream_text_size#">
			#DateFormat(due_date,"mm/dd/yy")#
		</td>
		<td align="right" class="SubHeadText#session.workstream_text_size#">
			Status:
		</td>
		<td class="RegText#session.workstream_text_size#">
			#status_id#
		</td>
	</tr>
	<tr>
		<td align="right" valign="top" class="SubHeadText#session.workstream_text_size#">
			Description:
		</td>
		<td colspan="5" class="RegText#session.workstream_text_size#">
			#description#
		</td>
	</tr>
</cfoutput>

<cfoutput>
	<tr>
		<td align="right" valign="top" class="SubHeadText#session.workstream_text_size#">
			Resolution:
		</td>
		<td colspan="5" class="RegText#session.workstream_text_size#"></cfoutput>
		<cfset qa_note_type_id_list = "2,5">
			<cfif time_entry_details.recordcount><cfoutput query="time_entry_details"><cfif time_entry_details.currentrow GT 1 and attributes.expand EQ 1 ><p></cfif>(#initials#: #DateFormat(date,"m/d")# #TimeFormat(date,"h:mm tt")#<cfif ListFindNoCase(qa_note_type_id_list,time_entry_details.notes_type_id)>, <b>QA</b></cfif>)  - #trim(note)#&nbsp;&nbsp;</cfoutput><cfelse>Resolution notes not yet entered for this task.</cfif>
		</td>
	</tr>
<!---<cfoutput>
	<tr>
		<td align="right" valign="top" class="SubHeadText#session.workstream_text_size#">
			QA Notes:
		</td>
		<td colspan="5" class="RegText#session.workstream_text_size#"></cfoutput>
			<cfif qa_entry_details.recordcount><cfloop query="qa_entry_details"><cfoutput><cfif qa_entry_details.currentrow gt 1 and attributes.expand eq 1><p></cfif>#notes_type_id#(#initials# #DateFormat(date,"m/d")# #TimeFormat(date,"h:mm tt")#) -  #trim(note)#&nbsp;&nbsp;</cfoutput></cfloop><cfelse>QA notes not yet entered for this task.</cfif>
		</td>
	</tr>--->
<cfoutput>
	<tr>
		<td align="right" valign="top" class="SubHeadText#session.workstream_text_size#">
			Associated Files:
		</td>
		<td colspan="5" class="RegText#session.workstream_text_size#"></cfoutput>
			<cfif get_associated_files.recordcount><cfoutput query="get_associated_files">#file_path#<br></cfoutput><cfelse>No files currently associated with this task.</cfif>
		</td>
	</tr>
<cfoutput>



<tr>
		<td align="right" valign="top" class="SubHeadText#session.workstream_text_size#">
			Associated Tasks:
		</td>
		<td colspan="5" class="RegText#session.workstream_text_size#"></cfoutput>
			<cfif get_associated_tasks.recordcount><cfoutput query="get_associated_tasks"><a href="index.cfm?fuseaction=Timekeeping.print_task&task_id=#task_id#&expand=1"><img src="http://monitor.promisweb.com/document.gif" width=16 height=16 alt="" border="0"></a><a href="index.cfm?fuseaction=Timekeeping.task_details&task_id=#task_id#">#Task_ID#</a> - #name#<br></cfoutput><cfelse>No tasks currently associated with this task.</cfif>
		</td>
	</tr>

	<cfinclude template="dsp_custom_fields_print.cfm">

<cfoutput>
	<tr>
		<td align="center" bgcolor="##000000" colspan="6" class="RegText#session.workstream_text_size#White">
			The electronic version of this <a href="javascript:task_details('#attributes.task_id#');" title="'View the digital version of this task.">document</a> is the source document and all printed versions must be verified against it to ensure the accuracy of the information contained herein.
		</td>
	</tr>
</cfoutput>
<tr>
	<td></td>
	<td></td>
</tr>