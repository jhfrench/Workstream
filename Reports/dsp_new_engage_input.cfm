
<!--Reports/dsp_new_engage_input.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the input page that lets a user choose a set of customers to retrieve new engagement histories.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfinclude template="qry_new_engage_input.cfm">
<cfform action="index.cfm?fuseaction=Reports.new_engagement_output" name="new_engagement" method="POST" class="well form-inline">
	<fieldset>
		<label for="root_code">Customer</label>
		<cfselect name="root_code" id="root_code" query="new_engage_input" value="root_code" display="customer_name" size="#min(new_engage_input.recordcount,15)#" required="yes" message="Please choose at least one customer." multiple="yes"></cfselect>
		<input type="submit" name="submit" value="Look Up Projects" class="btn btn-primary" />
	</fieldset>
</cfform>
