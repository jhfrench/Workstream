<!---$issue$ Steven: correct this fusedoc--->
<!-- Administration/dsp_compose_email.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_manage_vendor.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="8/4/2009" role="FuseCoder" comments="Created File">
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

<cfoutput>
<cfform name="form_manage_vendor" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
<table cols="6" width="100%" summary="Table lists vendor information and delist it by uncheck the box">
	<thead>
		<tr valign="bottom">
			<th scope="col">Remove from Vendor List</th>
			<th scope="col">Parent Business <abbr title="identification">ID</abbr></th>
			<th scope="col">Business</th>
			<th scope="col">Division</th>
			<th scope="col"><abbr title="Dunn and Bradstreet Universal Numbering System">DUNS</abbr></th>
			<th scope="col">Registrant</th>
		</tr>
	</thead>
	<tbody>
	<cfloop query="get_vendor">
		<tr<cfif currentrow MOD 2> bgcolor="##cccccc"</cfif>>
			<td align="center">
				<input type="checkbox" name="parent_business_id" id="parent_business_id_#parent_business_id#" value="#parent_business_id#" />
			</td>
			<td scope="row"><label for="parent_business_id_#parent_business_id#">#parent_business_id#</label></td>
			<td><a href="javascript:view_vendor_record(#parent_business_id#)">#legal_name#</a></td>
			<td>#division_name#</td>
			<td>#duns#</td>
			<td>#first_name# #last_name#<cfif len(email_address)> (#email_address#)</cfif></td>
		</tr>
	</cfloop>
	</tbody>
	<tfoot>
		<tr bgcolor="##dddddd">
			<td colspan="6" align="center">
				<input type="submit" name="submit" value="Submit" class="btn btn-primary" />
				<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
			</td>
		</tr>
	</tfoot>
</table>
</cfform>
</cfoutput>

<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="view_vendor_record" fuseaction="Search.view_vendor_record" field_name="parent_business_id">