<!-- Administration/pag_manage_mentor_protege.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_manage_mentor_protege.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/4/2009" role="FuseCoder" comments="Created File">
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

<cfset attributes.agreement_start_date="">
<cfset attributes.agreement_end_date="">
<cfif isdefined("attributes.update_type_id")>
	<cfif attributes.update_type_id EQ 1>
		<cfinclude template="../common_files/qry_deactivate_mentor_protege.cfm">
	<cfelse>
		<cfmodule template="../common_files/qry_deactivate_business.cfm" parent_business_id="#attributes.parent_business_id#" preserve_latest_business_ind="0">
	</cfif>
</cfif>

<cfinclude template="../common_files/qry_get_mentor_protege_list.cfm">

<cfquery name="get_mentor_list" datasource="#application.datasources.main#">
SELECT Mentor_Application.parent_business_id, ISNULL(Mentor.legal_name,'unknown name') AS mentor_name,
	CASE WHEN SUM(Active_Protege.active_ind) > 0 
		THEN ' disabled="disabled"' 
		ELSE '' 
	END AS disabled
FROM Mentor_Application
	INNER JOIN Business Mentor ON Mentor_Application.parent_business_id=Mentor.parent_business_id
	LEFT OUTER JOIN (
		SELECT Mentor_Protege.parent_mentor_application_id, Mentor_Protege.active_ind
		FROM Mentor_Protege
			INNER JOIN Business ON Mentor_Protege.protege_business_id=Business.parent_business_id
		WHERE Mentor_Protege.active_ind=1
			AND Business.active_ind=1
	) Active_Protege ON Mentor_Application.parent_mentor_application_id=Active_Protege.parent_mentor_application_id
WHERE Mentor_Application.active_ind=1
	AND Mentor.active_ind=1
GROUP BY Mentor_Application.parent_business_id, Mentor.legal_name
ORDER BY Mentor.legal_name
</cfquery>

<cfoutput>
<cfform name="form_manage_protege" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
<table cols="3" width="100%" summary="Table lists proteges that can be removed from the system.">
	<thead>
		<tr>
			<th scope="col">Remove from Prot&eacute;g&eacute; List</th>
			<th scope="col">Prot&eacute;g&eacute;</th>
			<th scope="col">Mentor</th>
		</tr>
	</thead>
	<cfif get_mentor_protege_list.recordcount>
	<tbody>
	<cfloop query="get_mentor_protege_list">
		<tr<cfif currentrow MOD 2> bgcolor="##cccccc"</cfif>>
			<td align="center">
				<input type="checkbox" name="parent_mentor_protege_id" id="parent_mentor_protege_id_#parent_mentor_protege_id#" value="#parent_mentor_protege_id#" />
			</td>
			<td scope="row"><label for="parent_mentor_protege_id_#parent_mentor_protege_id#">#protege_name#</label></td>
            <td>#mentor_name#</td>
		</tr>
	</cfloop>
	</tbody>
	<tfoot>
		<tr bgcolor="##dddddd">
			<td colspan="3" align="center">
				<input type="hidden" name="update_type_id" value="1" />
				<input type="submit" alt="submit" value="Submit" />
				<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
			</td>
		</tr>
	</tfoot>
	<cfelse>
		<tr>
			<td colspan="3">
				There are no Prot&eacute;g&eacute; records in the <acronym title="Federal Assistance Award Data">FAAD</acronym>.
			</td>
		</tr>
	</cfif>
</table>
</cfform>
<br />
<cfform name="form_manage_mentor" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
<table cols="2" width="100%" summary="Table lists mentors that can be removed from the system.">
	<thead>
		<tr>
			<th scope="col">Remove from Mentor List</th>
			<th scope="col">Mentor</th>
		</tr>
	</thead>
	<cfif get_mentor_list.recordcount>
	<tbody>
	<cfloop query="get_mentor_list">
		<tr<cfif currentrow MOD 2> bgcolor="##cccccc"</cfif>>
			<td align="center">
				<input type="checkbox" name="parent_business_id" id="parent_business_id_#parent_business_id#" value="#parent_business_id#"#disabled# />
			</td>
            <td scope="row"><label for="parent_business_id_#parent_business_id#">#mentor_name#</label></td>
		</tr>
	</cfloop>
	</tbody>
	<tfoot>
		<tr bgcolor="##dddddd">
			<td colspan="2" align="center">
				<input type="hidden" name="update_type_id" value="2" />
				<input type="submit" alt="submit" value="Submit" />
				<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
			</td>
		</tr>
	</tfoot>
	<cfelse>
		<tr>
			<td colspan="3">
				There are no Mentor records in the <acronym title="Federal Assistance Award Data">FAAD</acronym>.
			</td>
		</tr>
	</cfif>
</table>
</cfform>
</cfoutput>