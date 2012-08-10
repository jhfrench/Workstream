<!-- Administration/dsp_manage_opt-out_list.cfm
	Author: Steven Liu -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_manage_opt-out_list.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="csliu@nasa.gov" author="Steven Liu" type="create" date="7/23/2009" role="FuseCoder" comments="Created File">
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

<cfoutput>
<cfform name="form_manage_opt-out" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
<table cols="4" width="100%" summary="Table lists email addresses which qualify based on your selected criteria. If the user has 'opted-out' of receiving emails that fact is noted, and that user will not be sent this message.">
	<thead>
		<tr>
			<th>Remove from Opt-Out List</th>
			<th>Email</th>
			<th>Created By</th>
			<th>Created Date</th>
		</tr>
	</thead>
	<tbody>
	<cfloop query="get_email_blacklist">
		<tr<cfif currentrow MOD 2> bgcolor="##cccccc"</cfif>>
			<td align="center">
				<input type="checkbox" name="email_blacklist_id" id="email_blacklist_id_#email_blacklist_id#" value="#email_blacklist_id#" />
			</td>
			<td scope="row"><label for="email_blacklist_id_#email_blacklist_id#">#email_address#</label></td>
			<td>#created_by#&nbsp;</td>
			<td align="right">#dateformat(created_date,"m/d/yyyy")#</td>
		</tr>
	</cfloop>
	</tbody>
	<tfoot>
		<tr bgcolor="##dddddd">
			<td  colspan="4" align="center">
				<input type="hidden" name="created_by" value="#session.user_account_id#" />
				<input type="submit" alt="submit" value="Submit" class="btn btn-primary" />               
				<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
			</td>
		</tr>
	</tfoot>
</table>
</cfform>
</cfoutput>