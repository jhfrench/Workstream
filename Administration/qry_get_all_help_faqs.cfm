<!-- Administration/qry_get_all_help_faqs.cfm
	Author: Jeromy French -->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_all_help_faqs.cfm">
	<responsibilities>
		Query to retreive all system help faqs.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/17/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="get_all_help_faqs" datasource="#application.datasources.main#">
SELECT Help_FAQ.help_faq_id, Help_FAQ.question, CASE Help_FAQ.public_ind WHEN 1 THEN 'X' ELSE '' END AS public_ind,
	Help_FAQ.answer, Help_FAQ.sort_order AS sort_order, Help_FAQ.active_ind,
	NVL(Demographics.last_name, 'unknown') AS last_name, Demographics.first_name
FROM Help_FAQ
	LEFT OUTER JOIN Demographics ON Help_FAQ.asked_by=Demographics.user_account_id
		AND Demographics.active_ind=1
WHERE Help_FAQ.active_ind=1
ORDER BY Help_FAQ.sort_order, Help_FAQ.question
</cfquery>
<cfset caller.get_all_help_faqs=get_all_help_faqs>