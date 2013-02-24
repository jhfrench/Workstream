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

<cfoutput>
<cfif variables.user_identification EQ 1>
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
		<cftry>
			<table class="table table-striped table-bordered table-condensed">
				<thead>
					<tr>
					<cfloop list="#sql_executed.columnlist#" index="ii">
						<th>#ii#</th>
					</cfloop>
					</tr>
				</thead>
				<tbody>
					<cfloop query="sql_executed">
					<tr>
						<cfloop list="#sql_executed.columnlist#" index="ii">
							<td>#evaluate(ii)#</td>
						</cfloop>
					</tr>
					</cfloop>
				</tbody>
			</table>
			<cfcatch type="any">
			<div class="alert alert-error">
				<strong>Display Oops!</strong>
				<br />
				<pre>
					<cfoutput>#preservesinglequotes(attributes.sql_to_execute)#</cfoutput>
				</pre>
			</div>
			</cfcatch>
		</cftry>
	</cfif>
	<form action="index.cfm?fuseaction=#attributes.fuseaction#" method="post" class="form-horizontal">
		<div class="control-group">
			<label for="datasource" class="control-label">Datasource</label>
			<div class="controls">
				<select name="datasource" id="datasource" class="span8">
					<option value="#application.datasources.main#"<cfif NOT comparenocase(attributes.datasource,application.datasources.main)> selected="selected"</cfif>>#application.datasources.main#</option>
					<option value="Application_Manager"<cfif NOT comparenocase(attributes.datasource,"Application_Manager")> selected="selected"</cfif>>Application_Manager</option>
				</select>
			</div>
		</div>
		<div class="control-group">
			<label for="sql_to_execute" class="control-label">Query</label>
			<div class="controls">
				<textarea name="sql_to_execute" id="sql_to_execute" class="span8" rows="10">#attributes.sql_to_execute#</textarea>
			</div>
		</div>
		<div class="form-actions">
			<input type="submit" name="submit" value="Submit" class="btn btn-danger" />
		</div>
	</form>
</cfif>
</cfoutput>