 
<!--Search/pag_search.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the search input screen for workstream.
	||
	Name: 
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->

	<script language=javascript>
function isEmpty()
	{

			 if(document.input_form.project_id.value == '')
			    {
					 alert("You must select an project");
					 return false;
				 }

		  }
		
		  return true;
	}
</script>
</cfsilent>
<cfinclude template="../common_files/qry_get_search_projects.cfm">
<cfinclude template="../common_files/qry_get_date_operator.cfm">
<cfform name="input_form" action="index.cfm?fuseaction=Search.output" method="POST">
<table align="center" cellpadding="0" cellspacing="0" border="0" width="80%">
 	<cfinclude template="dsp_search_header.cfm">
	<cfinclude template="dsp_search_row_top.cfm">
	<cfinclude template="dsp_edit_task_name.cfm">
	<cfinclude template="dsp_edit_task_id.cfm">
	<cfinclude template="dsp_edit_date_entered.cfm">
	<cfinclude template="dsp_edit_due_date.cfm">
 	<cfinclude template="dsp_edit_task_owner.cfm">
	<cfinclude template="dsp_edit_task_source.cfm">
	<cfinclude template="dsp_edit_project_code.cfm">
	<cfinclude template="dsp_edit_priority.cfm">
	<cfinclude template="dsp_edit_task_stati.cfm">
	<cfinclude template="dsp_edit_notes.cfm">
	<cfinclude template="../common_files/dsp_submit_button.cfm">
	<cfoutput>
	<input type="hidden" name="used_by_search_ind" value="1">
	<input type="hidden" name= "project_id_list" value= "#valuelist(get_search_projects.project_id)#">

	</cfoutput>
</table>
</cfform>
<br />

