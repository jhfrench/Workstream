<!--Administration/qry_get_ref_date.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_ref_date.cfm">
	<responsibilities>
		I display active years in the application.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="10/4/10" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.date_id" default="0">
<cfquery name="get_ref_date" datasource="#application.datasources.main#">
SELECT *
FROM REF_Date
WHERE 1=1<cfif attributes.date_id NEQ 0>
	AND date_id=#attributes.date_id#<cfelse>
	AND odbc_date=#createodbcdate(attributes.odbc_date)#</cfif>
</cfquery>
<cfset caller.get_ref_date=get_ref_date>
