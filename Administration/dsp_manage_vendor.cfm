<!-- Administration/dsp_manage_vendor.cfm
	Author: Stephen Liu -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_manage_vendor.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="csliu@nasa.gov" author="Stephen Liu" type="create" date="8/4/2009" role="FuseCoder" comments="Created File">
			$Id:$
			(JF | 9/9/9)
			Making corrections depicted in 508_jm_2009_09_09_4.png.
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
<table cols="4" width="100%" summary="Table lists vendor information and delist it by uncheck the box">
	<thead>
		<tr>
			<th scope="col">Remove from Vendor List</th>
			<th scope="col">Business</th>
			<th scope="col">Division</th>
			<th scope="col"><abbr title="Dunn and Bradstreet Universal Numbering System">DUNS</abbr></th>
		</tr>
	</thead>
	<tbody>
	<cfloop query="get_vendor">
		<tr<cfif currentrow MOD 2> bgcolor="##cccccc"</cfif>>
			<td align="center">
				<input type="checkbox" name="parent_business_id" id="parent_business_id_#parent_business_id#" value="#parent_business_id#" />
			</td>
            <td scope="row"><label for="parent_business_id_#parent_business_id#">#legal_name#</label></td>
            <td>#division_name#</td>
			<td>#duns#</td>
		</tr>
	</cfloop>
	</tbody>
	<tfoot>
		<tr bgcolor="##dddddd">
			<td  colspan="4" align="center">
				<input type="submit" alt="submit" value="Submit" />
				<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
			</td>
		</tr>
	</tfoot>
</table>
</cfform>
</cfoutput>