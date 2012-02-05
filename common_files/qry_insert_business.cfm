<!-- common_files/qry_insert_business.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_business.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/1/2009" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.parent_business_id" default="0">
<cfif isdate(attributes.start_date)>
	<cfset attributes.start_date=createodbcdatetime(attributes.start_date)>
<cfelse>
	<cfset attributes.start_date="NULL">
</cfif>

<cfquery name="insert_business" datasource="#application.datasources.main#">
INSERT INTO Business (<cfif attributes.parent_business_id NEQ 0>parent_business_id, </cfif>duns, cage_code,
	legal_name, doing_business_as, division_name,
	company_url, start_date, ccr_organization_type_id,
	construction_bl_contract, construction_bl_aggregate, service_bl_contract,
	service_bl_aggregate, ccr_status_id, created_by)
VALUES (<cfif attributes.parent_business_id NEQ 0>#attributes.parent_business_id#, </cfif>LPAD('#trim(attributes.duns)#',9, '0'), RTRIM('#attributes.cage_code#'),
	RTRIM('#attributes.legal_name#'), RTRIM('#attributes.doing_business_as#'), RTRIM('#attributes.division_name#'),
	RTRIM('#attributes.company_url#'), #attributes.start_date#, #attributes.ccr_organization_type_id#,
	#attributes.construction_bl_contract#, #attributes.construction_bl_aggregate#, #attributes.service_bl_contract#,
	#attributes.service_bl_aggregate#, #attributes.ccr_status_id#, #variables.created_by#)
</cfquery>

<cfif attributes.parent_business_id EQ 0>
	<cfquery name="get_parent_business_id" datasource="#application.datasources.main#">
	SELECT IDENT_CURRENT('BUSINESS') AS parent_business_id
	</cfquery>
	<cfset attributes.parent_business_id=get_parent_business_id.parent_business_id>
</cfif>
<cfset caller.attributes.parent_business_id=attributes.parent_business_id>