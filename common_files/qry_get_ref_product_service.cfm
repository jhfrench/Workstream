<!-- common_files/pag_edit_ref_product_service.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_ref_product_service.cfm">
	<responsibilities>
		I display the form for editing ccr status and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy Frencho" type="create" date="6/19/2009" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.code" default="">
<cfparam name="attributes.product_service_id" default="0">
<cfquery name="get_ref_product_service" datasource="#application.datasources.main#">
SELECT product_service_id, code, description, 
	sort_order, active_ind
FROM REF_Product_Service
WHERE <cfif attributes.product_service_id NEQ 0>product_service_id=#attributes.product_service_id#<cfelseif len(attributes.code)>code IN (#preservesinglequotes(attributes.code)#)<cfelse>active_ind=1</cfif>
ORDER BY sort_order
</cfquery>
<cfset caller.get_ref_product_service=get_ref_product_service>