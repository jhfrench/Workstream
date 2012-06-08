<!-- common_files/pag_edit_ref_priority.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_ref_business_category.cfm">
	<responsibilities>
		I display the form for editing priority and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/19/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.business_category_id" default="0">
<cfquery name="get_ref_business_category" datasource="#application.datasources.main#">
SELECT business_category_id, description, sort_order
FROM REF_Business_Category
WHERE <cfif attributes.business_category_id NEQ 0>business_category_id IN (#attributes.business_category_id#)<cfelse>active_ind=1</cfif>
ORDER BY sort_order
</cfquery>
<cfset caller.get_ref_business_category=get_ref_business_category>