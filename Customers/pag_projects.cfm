
<!--Customers/pag_projects.cfm
	Author: Jeromy F -->
<cfsilent>
<!--- FUSEDOC
	||
	Responsibilities: I am the container for the view projects page

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfparam name="attributes.active_ind" default="1">
</cfsilent>
<cfinclude template="qry_get_projects.cfm">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="project" fuseaction="Customers.edit_project" field_name="project_id">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="open_tasks" fuseaction="Customers.open_tasks" field_name="project_id">
<table class="table table-striped table-bordered table-condensed">
	<caption><h2>Projects for <cfoutput>#get_projects.customer_description#</cfoutput></h2></caption>
	<cfinclude template="dsp_projects_row_header.cfm">
	<cfinclude template="dsp_projects_rows.cfm">
</table>

<form name="inactive" action="index.cfm?fuseaction=Customers.projects" method="post" class="well form-inline">
	<input type="hidden" name="client_code" value="#attributes.client_code#">
	<label for="active_ind"><input type="checkbox" name="active_ind" id="active_ind" onclick="submit();" value="<cfif compare(attributes.active_ind, 0)>0<cfelse>1</cfif>"> View <cfif compare(attributes.active_ind, 0)>Only Active<cfelse>Inactive</cfif> Projects</label>
</form>