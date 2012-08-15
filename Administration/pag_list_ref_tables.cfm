<!-- Administration/pag_list_ref_tables.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_list_ref_tables.cfm">
	<responsibilities>
		I show a list of reference tables that can be administered by developers.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/15/2007" role="FuseCoder" comments="Created File">
			$Id:$
			(JF | 9/15/2009)
			Corrected issue in error_kj_2009_09_14_1848.msg. SEF and production use pointer schemas, so can't directly access meta data in those environments.
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

<cfinclude template="qry_get_ref_tables.cfm">
<cfset variables.administration_fuseactions=structkeylist(application.fusebox.circuits.administration.fuseactions)>
<h2 style="margin:0px" id="top-side">Manage Drop-Down Lists</h2>
<table class="table table-striped table-bordered table-condensed">
	<caption><h3>List of REF Tables</h3></caption>
	<thead>
		<th>Table</th>
		<th>Notes</th>
	</thead>
	<tbody>
	<cfif get_ref_tables.recordcount>
		<cfoutput query="get_ref_tables">
		<tr>
				<cfif NOT comparenocase(fuseaction,"Not_Defined")>
					<td>#table_name#</td><td>no REF_Screen record</td>
				<cfelseif NOT listfind(variables.administration_fuseactions, "edit_#lower_table_name#")>
					<td>#table_name#</td><td>"edit_#lower_table_name#" not an Administration circuit</td>
				<cfelse>
					<td><a href="index.cfm?fuseaction=#fuseaction#">#table_name#</a></td><td></td>
				</cfif>
			</td>
		</tr>
		</cfoutput>
	<cfelse>
		<tr>
			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_account_status">REF_ACCOUNT_STATUS</a>
			</td>

			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_address_type">REF_ADDRESS_TYPE</a>
			</td>
		</tr>
		<tr>
			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_business_category">REF_BUSINESS_CATEGORY</a>
			</td>

			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_business_function">REF_BUSINESS_FUNCTION</a>
			</td>
		</tr>
		<tr>
			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_ccr_business_type">REF_CCR_BUSINESS_TYPE</a>
			</td>

			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_ccr_certification_type">REF_CCR_CERTIFICATION_TYPE</a>
			</td>
		</tr>
		<tr>
			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_ccr_organization_type">REF_CCR_ORGANIZATION_TYPE</a>
			</td>

			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_ccr_status">REF_CCR_STATUS</a>
			</td>
		</tr>
		<tr>
			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_center">REF_CENTER</a>
			</td>

			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_comments_type">REF_COMMENTS_TYPE</a>
			</td>
		</tr>
		<tr>
			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_contact_type">REF_CONTACT_TYPE</a>
			</td>

			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_country">REF_COUNTRY</a>
			</td>
		</tr>
		<tr>
			<td class="menuItem" bgcolor="#eeeeee" width="50%">
				REF_DATE ("edit_ref_date" not an Administration circuit)
			</td>

			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_email_category">REF_EMAIL_CATEGORY</a>
			</td>
		</tr>
		<tr>
			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_form_element_type">REF_FORM_ELEMENT_TYPE</a>
			</td>

			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_fsc">REF_FSC</a>
			</td>
		</tr>
		<tr>
			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_geographic_area">REF_GEOGRAPHIC_AREA</a>
			</td>

			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_hierarchy_level">REF_HIERARCHY_LEVEL</a>
			</td>
		</tr>
		<tr>
			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_module">REF_MODULE</a>
			</td>

			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_m_p_approval_status">REF_M_P_APPROVAL_STATUS</a>
			</td>
		</tr>
		<tr>
			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_m_p_status">REF_M_P_STATUS</a>
			</td>

			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_naics">REF_NAICS</a>
			</td>
		</tr>
		<tr>
			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_numeric_multiplier">REF_NUMERIC_MULTIPLIER</a>
			</td>

			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_organization">REF_ORGANIZATION</a>
			</td>
		</tr>
		<tr>
			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_priority">REF_PRIORITY</a>
			</td>

			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_privilege">REF_PRIVILEGE</a>
			</td>
		</tr>
		<tr>
			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_product_service">REF_PRODUCT_SERVICE</a>
			</td>

			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_product_version">REF_PRODUCT_VERSION</a>
			</td>
		</tr>
		<tr>
			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_program_year">REF_PROGRAM_YEAR</a>
			</td>

			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_report_output_format">REF_REPORT_OUTPUT_FORMAT</a>
			</td>
		</tr>
		<tr>
			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_requirement_type">REF_REQUIREMENT_TYPE</a>
			</td>

			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_resource_link_type">REF_RESOURCE_LINK_TYPE</a>
			</td>
		</tr>
		<tr>
			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_screen">REF_SCREEN</a>
			</td>

			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_state_province">REF_STATE_PROVINCE</a>
			</td>
		</tr>
		<tr>
			<td class="menuItem" bgcolor="#eeeeee" width="50%">
					<a href="index.cfm?fuseaction=Administration.edit_ref_upload_source">REF_UPLOAD_SOURCE</a>
			</td>
		</tr>
	</cfif>
	</tbody>
</table>