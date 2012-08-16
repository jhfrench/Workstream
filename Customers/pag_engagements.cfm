
<!--Customers/pag_engagements.cfm
	Author: Jeromy F -->
<cfsilent>
<!--- FUSEDOC
	||
	Responsibilities: I am the container for the view engagements page

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfparam name="attributes.active_ind" default="1">
</cfsilent>
<cfinclude template="qry_get_engagements.cfm">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="engagement" fuseaction="Customers.edit_engagement" field_name="project_id">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="open_tasks" fuseaction="Customers.open_tasks" field_name="project_id">
<table class="table table-striped table-bordered table-condensed">
	<caption><h2>Projects for <cfoutput>#get_engagements.cust_description#</cfoutput></h2></caption>
	<cfinclude template="dsp_engagements_row_header.cfm">
	<cfinclude template="dsp_engagements_rows.cfm">
</table>

<form name="inactive" action="index.cfm?fuseaction=Customers.engagements" method="post" class="well form-inline">
	<input type="hidden" name="client_code" value="#attributes.client_code#">
	<label for="active_ind"><input type="checkbox" name="active_ind" id="active_ind" onclick="submit();" value="<cfif compare(attributes.active_ind, 0)>0<cfelse>1</cfif>"> View <cfif compare(attributes.active_ind, 0)>Only Active<cfelse>Inactive</cfif> Projects</label>
</form>