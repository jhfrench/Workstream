
<!--Reports/dsp_pto_adjustment_form.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<cfform action="" method="POST" class="form-horizontal">
	<fieldset>
		<legend><h2><abbr title="Paid Time Off">PTO</abbr> Adjustment</h2></legend>
		<div class="control-group">
			<label for="date_granted">Date</label>
			<div class="controls">
				<input type="date" name="date_granted" id="date_granted" min="#application.application_specific_settings.workstream_start_date#" maxlength="10" required="required" class="span3 date" />
			</div>
		</div>
		<div class="control-group">
			<label for="granted_hours">Hours</label>
			<div class="controls">
				<input type="number" name="granted_hours" id="granted_hours" step="0.25" min="0" max="999" required="required" class="span5" />
			</div>
		</div>
		<div class="control-group">
			<label for="comments">Comment</label>
			<div class="controls">
				<cfinput type="text" name="comments" id="comments" size="50" maxlength="50" required="yes" message="Enter comment.">
			</div>
		</div>
		<div class="form-actions">
			<input type="hidden" name="adjustment_flag" value="#now()#" />
			<input type="hidden" name="emp_id" value="#attributes.emp_id#" />
			<input type="submit" value="Create Adjustment" class="btn" />
		</div>
	</fieldset>
</cfform>
</cfoutput>
<hr width="80%">