<!-- Administration/pag_edit_ref_priority.cfm
	Author: Lyudmila Klimenko-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_ref_business_category.cfm">
	<responsibilities>
		I display the form for editing priority and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="6/19/2007" role="FuseCoder" comments="Created File">
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
<cfmodule template="../common_files/qry_get_ref_business_category.cfm" business_category_id="0">
<cfoutput>
<form name="edit_ref_business_category_form" action="index.cfm?fuseaction=#fuseaction#" method="post">
	<select name="business_category_id">
	<cfloop query="get_ref_business_category"><option value="#business_category_id#" <cfif not comparenocase(get_ref_business_category.business_category_id, attributes.business_category_id)>selected</cfif>>#description#</option></cfloop>
	</select>
	<input name="method" type="submit" alt="Retrieve and edit business category" value="Retrieve and edit business category"/>
</form>
<cfif len(attributes.method)>
	<cfmodule template="../common_files/qry_get_ref_business_category.cfm" business_category_id="#attributes.business_category_id#">
	<cfset attributes.description=get_ref_business_category.description>
	<cfset attributes.business_category_id=get_ref_business_category.business_category_id>
</cfif>
<cfform name="REF_business_category_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">

<div class="datachart" style="border:1px solid ##999999" title="table head describes the data held in the table within this table">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="Table displays user account information">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.business_category_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> business category</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="table displays user account information">
			<tr>
				<td><label for="description">description</label>: 
					<br /><cfinput type="text" name="description" id="description" size="30" value="#attributes.description#" required="yes" tabindex="1" message="Please enter description." maxlength="400">
				</td>
				<td><label for="sort_order">Sort Order</label>: 
					<br /><cfinput type="text" name="sort_order" id="sort_order" value="#iif(attributes.business_category_id EQ 0, ('get_ref_business_category.recordcount+1'), ('get_ref_business_category.sort_order'))#" size="3" maxlength="3" required="yes" tabindex="2" validate="integer" message="Please enter sort order.">
				</td>
				<cfif attributes.business_category_id EQ 0>
					<input type="hidden" name="active_ind" value="1"/>
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
		<td align="center">
			<input type="hidden" name="created_by" value="#session.user_account_id#"/>
			<input type="hidden" name="business_category_id" value="#attributes.business_category_id#"/>
			<input type="submit" alt="submit" value="Submit" />
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>
