
<!--Reports/dsp_pto_report_input.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the container for the PTO roport input page.

	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
<cfset variables.only_one=0>
<cfif get_pto_names.recordcount EQ 1 AND NOT get_all_option.all_option>
	<cfset variables.only_one=1>
</cfif>
</cfsilent>
<div class="control-group">
	<label class="control-label" for="user_account_id">Name</label>
	<div class="controls">
		<cfselect name="user_account_id" id="user_account_id" message="Please select an employee for your PTO report." required="yes" multiple="yes" size="#min(get_pto_names.recordcount,15)#">
		<cfoutput>
			<option value="#valuelist(get_pto_names.user_account_id)#" selected="selected">ALL</option>
			<cfloop query="get_pto_names">
			<option value="#user_account_id#"<cfif variables.only_one> selected="selected"</cfif>>#last_name#, #first_name#</option>
			</cfloop>
		</cfoutput>
		</cfselect>
		<input type="hidden" name="flag_name" value="true" />
	</div>
</div>
<div class="form-actions">
	<input type="submit" value="Update Report" class="btn btn-primary" />
</div>