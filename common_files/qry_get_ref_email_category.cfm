<!-- common_files/qry_get_ref_email_category.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_ref_email_category.cfm">
	<responsibilities>
		I retrieve the data from the REF_Email_Categories table.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/5/2009" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.email_category_id" default="0">
<cfquery name="get_ref_email_category" datasource="#application.datasources.main#">
SELECT email_category_id, description, notes,
	sort_order
FROM REF_Email_Category
WHERE <cfif attributes.email_category_id NEQ 0>email_category_id=#attributes.email_category_id#<cfelse>active_ind=1</cfif>
ORDER BY sort_order
</cfquery>
<cfset caller.get_ref_email_category=get_ref_email_category>