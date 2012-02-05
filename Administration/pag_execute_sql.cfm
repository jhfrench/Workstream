<!-- Administration/pag_execute_sql.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_execute_sql.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="10/2/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.datasource" default="">
<cfparam name="attributes.sql_to_execute" default="">

<cfif session.user_account_id EQ 1>
	<cfif len(attributes.sql_to_execute)>
		<cftry>
			<!--- execute sql --->
			<cfquery name="sql_executed" datasource="#attributes.datasource#">
			#preservesinglequotes(attributes.sql_to_execute)#
			</cfquery>
			<cfcatch type="any">
				Query Oops!
				<br />
				<pre>
					<cfoutput>#preservesinglequotes(attributes.sql_to_execute)#</cfoutput>
				</pre>
			</cfcatch>
		</cftry>
		<table border="1" cellspacing="0" cellpadding="1" summary="Table displays application manager information">
		<cftry>
			<tr>
			<cfoutput>
			<cfloop list="#sql_executed.columnlist#" index="ii">
				<td>#ii#</td>
			</cfloop>
			</cfoutput>
			</tr>
			<cfoutput query="sql_executed">
			<tr>
				<cfloop list="#sql_executed.columnlist#" index="ii">
					<td>#evaluate(ii)#</td>
				</cfloop>
			</tr>
			</cfoutput>
			<cfcatch type="any">
				Display Oops!
				<br />
				<pre>
					<cfoutput>#preservesinglequotes(attributes.sql_to_execute)#</cfoutput>
				</pre>
			</cfcatch>
		</cftry>
		</table>
	</cfif>
	<cfoutput>
	<!--- temporary, for faster committed SQL runs --->
	<form action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
		<select name="datasource">
			<option value="#application.datasources.main#"<cfif NOT comparenocase(attributes.datasource,application.datasources.main)> SELECTED</cfif>>#application.datasources.main#</option>
			<option value="Application_Manager"<cfif NOT comparenocase(attributes.datasource,"Application_Manager")> SELECTED</cfif>>Application_Manager</option>
		</select>
		<br />
		<textarea cols="80" rows="20" name="sql_to_execute">#attributes.sql_to_execute#</textarea>
		<br />
		<input type="submit" alt="submit" />
	</form>
	</cfoutput>
</cfif>