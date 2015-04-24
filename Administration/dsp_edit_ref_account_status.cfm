<!-- Administration/dsp_edit_ref_account_status.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_ref_account_status.cfm">
	<responsibilities>
		I display the form for account status maintenance.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="9/14/2007" role="FuseCoder" comments="Created File">
			$Id:$
		</history>
	</properties>
	<IO>
		<in>

		</in>
		<passthrough>

		</passthrough>
		<out>

		</out>
	</IO>
</fusedoc>
--->
<cfparam name="attributes.method" default="">
<h2>
	<ul class="breadcrumb">
		<li>System Configuration <span class="divider">/</span></li>
		<li><a href="index.cfm?fuseaction=Administration.list_ref_tables">Manage Drop Down Lists</a> <span class="divider">/</span></li>
		<li class="active"><a href="index.cfm?fuseaction=#attributes.fuseaction#">REF_Account_Status</a></li>
	</ul>
</h2>
<cfmodule template="../common_files/qry_get_ref_account_status.cfm" account_status_id="0">
<cfoutput>
<form name="ref_account_edit_form" action="index.cfm?fuseaction=#fuseaction#" method="post" class="well form-inline">
	<select name="account_status_id">
	<cfloop query="get_ref_account_status"><option value="#account_status_id#">#description#</option></cfloop>
	</select>
	<input type="submit" name="method" value="Retrieve and edit ref account" class="btn btn-primary" />
</form>
<cfif len(attributes.method)>
<cfmodule template="../common_files/qry_get_ref_account_status.cfm" account_status_id="#attributes.account_status_id#">
	<cfset attributes.description=get_ref_account_status.description>
	<cfset attributes.sort_order=get_ref_account_status.sort_order>
</cfif>

<cfform name="REF_account_status_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="table head describes the data held in the table within this table">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.account_status_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> ACCOUNT STATUS</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="Displays account user information ">
			<tr>
				<td><label for="description">description</label>:
					<br /><cfinput type="text" name="description" id="description" value="#attributes.description#" size="30" required="yes" message="Please enter description." maxlength="4000">
				</td>
				<td>
					<label for="sort_order">Sort Order</label>:
					<br />
					<input type="number" name="sort_order" id="sort_order" value="#iif(attributes.account_status_id EQ 0, ('get_ref_account_status.recordcount+1'), ('get_ref_account_status.sort_order'))#" step="1" min="1" required="required" class="span5 number" />
				</td>
				<cfif attributes.account_status_id EQ 0>
					<input type="hidden" name="active_ind" value="1" />
				<cfelse>
				<td colspan="2"><span title="describes the purpose of the radio buttons that follow">Active?</span>
					<br /><cfinput type="radio" name="active_ind" id="active_ind_yes" value="1" checked="yes"><label for="active_ind_yes">Yes </label>
				 		<cfinput type="radio" name="active_ind" id="active_ind_no" value="0" ><label for="active_ind_no">No </label>
				</td>
				</cfif>
			</tr>
		</table>
		</td>
	</tr>
	<tr bgcolor="##dddddd">
		<td class="btn-group">
			<input type="hidden" name="created_by" value="#variables.user_identification#" />
			<input type="hidden" name="account_status_id" value="#attributes.account_status_id#" />
			<input type="submit" name="submit" value="Submit" class="btn btn-primary" />
			<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>

