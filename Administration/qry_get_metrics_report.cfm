<!-- Administration/qry_get_metrics_report.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_metrics_report.cfm">
	<responsibilities>
		I retrieve the metrics report. Purpose:  Provide OSBP managers' metrics on FAAD application use.
			Filter (search criteria):  Date Range (between start date and end date)
			Group by:  N/A
			Sort by:  (N/A)
			Data displayed/sequence:
			1.	Total # All Registered Vendors
			2.	Total # New Registrations
			3.	Total # Renewed Registrations
			4.	Total # Businesses Registered (note - one business may have more than one NASA Vendor POC registration)
			5.	Total # Vendor Points of Contact (Primary and Alternate)

			Distinction between "1. Total # All Registered Vendors" and "4. Total # Business Registered" and "5. Total # Vendor Points of Contact":
				1 – Primary Vendor POCs (or records) – not vendor companies.
				4 – Vendor companies (1 D&B #)
				5 – All Vendor POCs – that would be #1 plus alternates listed I guess.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/13/2009" role="FuseCoder" comments="Created File">
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

<!---if one date is defined be sure to define the other date--->
<cfif len(attributes.start_date)>
	<cfparam name="attributes.end_date" default="#now()#">
</cfif>
<cfif len(attributes.end_date)>
	<cfparam name="attributes.start_date" default="#dateadd('m', -1, attributes.end_date)#">
</cfif>
<cfquery name="get_metrics_report" datasource="#application.datasources.main#">
SELECT ISNULL(SUM(Registered_Vendor_Count.registered_vendor_count),0) AS registered_vendor_count, ISNULL(SUM(Original_Registration.active_ind),0) AS new_registration_count, ISNULL(SUM(Business_Renewal.active_ind),0) AS renewed_registrations_count,
	ISNULL(SUM(Registered_Business_Count.registered_business_count),0) AS registered_business_count, ISNULL(SUM(Vendor_POC_Count.vendor_poc_count), 0) AS vendor_poc_count
FROM Business
	INNER JOIN (
		SELECT parent_business_id, SUM(active_ind) AS registered_vendor_count
		FROM Link_Business_Contact
		WHERE active_ind=1
			AND contact_type_id=8 /*registrant*/
		GROUP BY parent_business_id
	) Registered_Vendor_Count ON Business.parent_business_id=Registered_Vendor_Count.parent_business_id
	LEFT OUTER JOIN Business Original_Registration ON Business.parent_business_id=Original_Registration.business_id<cfif len(attributes.start_date)>
		AND Original_Registration.created_date BETWEEN #createodbcdate(attributes.start_date)# AND #createodbcdate(attributes.end_date)#</cfif>
	LEFT OUTER JOIN Business_Renewal ON Business.parent_business_id=Business_Renewal.parent_business_id
		AND Business_Renewal.created_date > DATEADD('Y', -1, GETDATE())
	LEFT OUTER JOIN (
		SELECT MAX(parent_business_id) AS parent_business_id, 1 AS registered_business_count
		FROM Business
		WHERE Business.active_ind=1
			AND Business.ccr_organization_type_id IS NOT NULL
		GROUP BY duns
	) Registered_Business_Count ON Business.parent_business_id=Registered_Business_Count.parent_business_id
	LEFT OUTER JOIN (
		SELECT parent_business_id, SUM(active_ind) AS vendor_poc_count
		FROM Link_Business_Contact
		WHERE active_ind=1
			AND contact_type_id=1
		GROUP BY parent_business_id
	) Vendor_POC_Count ON Business.parent_business_id=Vendor_POC_Count.parent_business_id
WHERE Business.active_ind=1
	AND Business.ccr_organization_type_id IS NOT NULL
</cfquery>
