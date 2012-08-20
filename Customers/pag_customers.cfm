
<!--Customers/pag_customers.cfm
	Author: Jeromy F -->
<cfsilent>
<!--- FUSEDOC
	||
	Responsibilities: I am the container for the fuses for the Customers page.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfparam name="attributes.active_ind" default="1">
</cfsilent>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="customer" fuseaction="Customers.engagements" field_name="customer_id">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit" fuseaction="Customers.edit_customer" field_name="customer_id">
<cfinclude template="qry_get_customers.cfm">
<cfinclude template="dsp_customers_rows.cfm">

<form name="inactive" action="index.cfm?fuseaction=Customers.customers" method="post" class="well form-inline">
  	<label for="active_ind"><input type="checkbox" name="active_ind" id="active_ind" onclick="submit();" value="<cfif compare(attributes.active_ind, 0)>0<cfelse>1</cfif>"> View <cfif attributes.active_ind>Inactive<cfelse>Only Active</cfif> Customers</label>
</form>