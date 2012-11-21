
<!-- Administration/pag_list_link_tables.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_list_link_tables.cfm">
	<responsibilities>
	</responsibilities>
		I show a list of link tables that can be administered developers. 
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/10/2007" role="FuseCoder" comments="Created File">
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

<cfinclude template="qry_get_link_tables.cfm">
<cfset variables.administration_fuseactions=structkeylist(application.fusebox.circuits.administration.fuseactions)>

<ul class="breadcrumb">
	<h2>
		<li>System Configuration <span class="divider">/</span></li>
		<li class="active">Manage Link Tables</li>
	</h2>
</ul>
<table class="table table-striped table-bordered table-condensed">
	<caption><h3>List of Link Tables</h3></caption>
	<thead>
		<th>Table</th>
		<th>Notes</th>
	</thead>
	<tbody>
	<cfif get_link_tables.recordcount>
		<cfoutput query="get_link_tables">
		<tr>
				<cfif NOT comparenocase(fuseaction,"Not_Defined")>
					<td>#table_name#</td><td>no REF_Screen record</td>
				<cfelseif NOT listfind(variables.administration_fuseactions, "edit_#lower_table_name#")>
					<td>#table_name#</td><td>"edit_#lower_table_name#" not an Administration circuit</td>
				<cfelse>
					<td><a href="index.cfm?fuseaction=#fuseaction#">#table_name#</a></td><td></td>
				</cfif>
			</td>
		</tr>
		</cfoutput>
	</cfif>
	</tbody>
</table>