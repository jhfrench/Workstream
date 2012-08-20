<!-- Reports/qry_get_footer_file.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I 

	||
	Edits: 
	$Log$
	||
	Variables:

	END FUSEDOC --->
<cfquery name="get_pto_footer_file" datasource="#application.datasources.main#">
SELECT COALESCE(pto_footer_file, 'dsp_pto_detail_footer.cfm') AS pto_footer_file
FROM REF_Company
WHERE company_id = #session.workstream_company_id#
</cfquery>
</cfsilent>
