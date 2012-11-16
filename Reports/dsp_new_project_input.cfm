
<!--Reports/dsp_new_project_input.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the input page that lets a user choose a set of customers to retrieve new project histories.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfinclude template="qry_new_project_input.cfm">
<cfform action="index.cfm?fuseaction=Reports.new_project_output" name="new_project" method="POST" class="well form-inline">
	<fieldset>
		<label for="root_code">Customer</label>
		<cfselect name="root_code" id="root_code" query="new_project_input" value="root_code" display="customer_name" size="#min(new_project_input.recordcount,15)#" required="yes" message="Please choose at least one customer." multiple="yes"></cfselect>
		<input type="submit" name="submit" value="Update Report" class="btn btn-primary" />
	</fieldset>
</cfform>
