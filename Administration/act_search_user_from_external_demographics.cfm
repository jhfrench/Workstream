<!-- Administration/act_search_user_from_external_demographics.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="act_search_user_from_external_demographics.cfm">
	<responsibilities>
		I display the result of the center and dlastname search of external demographics warehouse. I also allow a selection for further processing.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/18/2007" role="FuseCoder" comments="Created File">
			$Id:$
			(JF | 7/19/10) Cleaning up verbiage and row coloring.
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

<cfparam name="attributes.uupic" default="">
<cfparam name="attributes.method" default="">

<!--- get the query that processes the data submitted in external demographics warehouse --->
<cfinclude template="qry_get_external_demographics_data.cfm">
<cfmodule template="../common_files/qry_get_ref_center.cfm" display_all_centers_ind="0" center_abbreviation="#attributes.center_description#">

<!--- display the result of the query in a form --->
<cfoutput>
<form name="external_demographics_user_form" action="index.cfm?fuseaction=Administration.add_user" method="POST">
<div class="datachart" style="border:1px solid ##999999">
<table width="100%" cellspacing="1" cellpadding="4" border="0" bgcolor="##cccccc" summary="table head describes the data held in the table within this table">
	<tr bgcolor="##cccccc">
		<th><strong>Add New User using HQTS information from #get_ref_center.abbreviation#</strong></th>
	</tr>
	<!--- <cfloop query="get_external_demographics_data"> --->
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="Table displays users based on demographics">
			<cfloop query="get_external_demographics_data">
			<cfset variables.employeenumber=employeenumber>
			<cfset variables.employeenumber_length=len(variables.employeenumber)>

			<cfif variables.employeenumber_length LT 9>
				<cfloop from="1" to="#9-variables.employeenumber_length#" index="len_ii">
					<cfset variables.employeenumber="0#variables.employeenumber#">
				</cfloop>
			</cfif>
			<cfif currentrow MOD 2>
				<cfset variables.row_color="eeeeee">
			<cfelse>
				<cfset variables.row_color="dddddd">
			</cfif>
			<tr bgcolor="###variables.row_color#" onmouseover="this.bgColor='##cfdee3';this.style.cursor='hand';" onmouseout="this.bgColor='###variables.row_color#';this.style.cursor='default';" onclick="javascript:Element.toggle('var_id_#currentrow#'); return false;">

				<td>
					<input type="radio" name="uupic" id="uupic_#variables.employeenumber#" value="#variables.employeenumber#"<cfif get_external_demographics_data.recordcount EQ 1> checked="checked"</cfif> />
				</td>
				<td>
					<label for="uupic_#variables.employeenumber#">#sn#, #givenname#</label>
				</td>
				<td>
					#ou#
				</td>
			</tr>
			</cfloop>
			<cfif NOT get_external_demographics_data.recordcount MOD 2>
				<cfset variables.row_color="eeeeee">
			<cfelse>
				<cfset variables.row_color="dddddd">
			</cfif>
			<tr bgcolor="###variables.row_color#" onmouseover="this.bgColor='##cfdee3';this.style.cursor='hand';" onmouseout="this.bgColor='###variables.row_color#';this.style.cursor='default';">
			<cfif application.application_specific_settings.allow_non_demographics_user_ind>
				<td>
					<input type="radio" name="uupic" id="uupic_0" value="0"<cfif get_external_demographics_data.recordcount EQ 0> checked="checked"</cfif> />
				</td>
				<td>
					<label for="uupic_0">Add a user that does not show in the external demographics warehouse.</label>
				</td>
			<cfelseif get_external_demographics_data.recordcount EQ 0>
				<td colspan="2">
					Your search returned no records
				</td>
			</cfif>
			</tr>
		</table>
		</td>
	</tr>
	<cfif application.application_specific_settings.allow_non_demographics_user_ind OR get_external_demographics_data.recordcount>
	<tr bgcolor="##dddddd">
		<td class="btn-group">
			<input type="hidden" name="method" value="select_user" />
			<input type="submit" name="submit" value="Next Step" class="btn btn-primary" />
			<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
		</td>
	</tr>
	</cfif>
</table>
</div>
</form>
</cfoutput>
