
<!--Tools/dsp_date_locked.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the form that allows an administrator to update the date locked of a company.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfscript>
variables.date_list=valuelist(get_date_locked.date_locked);
variables.date_list=listsort( rereplace( variables.date_list, '([0-9][0-9])-([0-9][0-9][0-9][0-9])', '\2-\1', 'all' ), 'numeric', 'asc' );
variables.min_date=listFirst(variables.date_list);
</cfscript>
<cfoutput>
<cfform name="date_locked" action="index.cfm?fuseaction=Tools.date_locked" method="post" class="form-horizontal">
	<fieldset>
		<legend><h2>Change Date Locked</h2></legend>
		<div class="control-group">
			<label for="company_id">Company</label>
			<div class="controls">
				<select name="company_id" id="company_id" size="#min(get_date_locked.recordcount, 10)#" multiple="multiple" required="required"  class="span11">
					<cfloop query="get_date_locked">
						<option value="#company_id#"<cfif listlast(session.workstream_company_id) EQ company_id> selected="selected"</cfif>>#company#, <cfif len(date_locked)>#dateformat(date_locked, "mm/dd/yy")#<cfelse>NO DATE SPECIFIED</cfif></option>
					</cfloop>
				</select>
				<p class="help-block">With current date-locked.</p>
			</div>
		</div>
		<div class="control-group">
			<label for="date_locked">New Date Locked</label>
			<div class="controls">
				<input type="date" name="date_locked" id="date_locked" min="#dateformat(variables.min_date, 'yyyy-mm-dd')#" max="#dateformat(now(), 'yyyy-mm-dd')#" required="required" maxlength="10" class="span11 date" />
				<!-- Use CF to require field <cfinput type="text" name="date_locked"  message="Please specify a valid date to apply." validate="date" required="yes" size="8" /> -->
			</div>
		</div>
		<div class="form-actions">
			<input type="submit" name="submit" value="Update Date Locked" class="btn btn-primary" />
			<input type="reset" value="Reset" class="btn" />
		</div>
	</fieldset>
</cfform>
</cfoutput>