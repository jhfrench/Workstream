<!-- Administration/qry_get_external_demographics_data.cfm
	Author: Omoniyi Fajemidupe-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_external_demographics_data.cfm">
	<responsibilities>
		I query the LDAP to get the information needed for populating form for new users.
	</responsibilities>
	<properties>
		<history email="omoniyi.fajemidupe-1@nasa.gov" author="Omoniyi Fajemidupe" type="create" date="6/18/2007" role="FuseCoder" comments="Created File">
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

<!--- look for a population based on last name and maybe center--->
<cfif NOT (isdefined("attributes.uupic") AND len(attributes.uupic))>
	<cfset variables.searchParameters="&(sn=#attributes.last_name#*)">
	<cfif len(attributes.center_description)>
		<cfset variables.searchParameters="&(ou=#attributes.center_description#)&(sn=#attributes.last_name#*)">
	</cfif>

	<cfhttp url="#application.application_specific_settings.hqts_template_url#" charset="utf-8" method="get" result="hqts_response">
	   <cfhttpparam type="url" encoded="yes" name="method" value="getNasaDirInfo" />
	   <cfhttpparam type="url" encoded="yes" name="appname" value="#application.product_name#" /> 
	   <cfhttpparam type="url" encoded="yes" name="referPage" value="https://#cgi.http_host##cgi.script_name#" />
	   <cfhttpparam type="url" encoded="yes" name="searchParameters" value="(#variables.searchParameters#)" />          
	   <cfhttpparam type="url" encoded="yes" name="returnAttributes" value="employeeNumber,givenname,initials,ou,sn" />
	</cfhttp>
	
<!--- but, if we know the employee's unique number, get the one record--->
<cfelse>
	<cfset variables.searchParameters="&(employeeNumber=#attributes.uupic#)">

	<cfhttp url="#application.application_specific_settings.hqts_template_url#" charset="utf-8" method="get" result="hqts_response">
	   <cfhttpparam type="url" encoded="yes" name="method" value="getNasaDirInfo" />
	   <cfhttpparam type="url" encoded="yes" name="appname" value="#application.product_name#" /> 
	   <cfhttpparam type="url" encoded="yes" name="referPage" value="https://#cgi.http_host##cgi.script_name#" />
	   <cfhttpparam type="url" encoded="yes" name="searchParameters" value="(&(employeeNumber=#attributes.uupic#))" />          
	   <cfhttpparam type="url" encoded="yes" name="returnAttributes" value="agencyuid,employeeNumber,givenname,initials,nasaPrimaryEmail,ou,sn,telephonenumber" />
	</cfhttp>
</cfif>

<cfset variables.hqts_query=deserializeJSON("#listlast(listfirst(hqts_response.filecontent, '}'), '/')#}", false)><!---
<cfdump var="#variables.hqts_query#">--->

<cfif hqts_query.recordcount GT 1>
	
	<cfset hqts_results_temp=hqts_query>
	
	<!--- duplicate the first record --->
	<cfset variables.new_row=queryaddrow(hqts_results_temp)>
	<cfset variables.row_count=hqts_results_temp.recordcount>
	<cfloop list="#hqts_results_temp.columnlist#" index="column_ii">
		<cfset variables.new_row=querysetcell(hqts_results_temp, column_ii, evaluate("hqts_results_temp.#column_ii#[1]"), variables.row_count)>
	</cfloop>
	
	<!--- set the employeenumber of first record to have a letter, which will force q of q to know that field is varchar --->
	<cfset variables.first_row=querysetcell(hqts_results_temp, "employeenumber", "force_varchar", 1)>
	
	<cftry>
		<!--- alphabetize results, dropping the first record --->
		<cfquery name="get_external_demographics_data" dbtype="query">
		SELECT *, UPPER(sn) AS last_name, UPPER(givenname) AS first_name, UPPER(initials) AS middle_initial
		FROM hqts_results_temp
		WHERE employeeNumber <> 'force_varchar' <!--- drops the first record --->
		ORDER BY last_name, first_name, middle_initial
		</cfquery>
		
		<cfcatch>
			<!--- the employeeNumber is often not a number, which will break the above query. Handle with this instead: --->
			<cfquery name="get_external_demographics_data" dbtype="query">
			SELECT *
			FROM hqts_results_temp
			WHERE employeeNumber <> 'force_varchar' <!--- drops the first record --->
			ORDER BY sn, givenname, initials
			</cfquery>
		</cfcatch>
	</cftry>
<cfelse>
	<cfif hqts_query.recordcount EQ 1>
		<!--- sometimes employeenumbers are missing their leading 0 --->
		<cfset variables.employeenumber=hqts_query.employeenumber>
		<cfset variables.employeenumber_length=len(variables.employeenumber)>
		
		<cfif variables.employeenumber_length LT 9>
			<cfloop from="1" to="#9-variables.employeenumber_length#" index="len_ii">
				<cfset variables.employeenumber="0#variables.employeenumber#">
			</cfloop>
		</cfif>
		
		<cfset variables.first_row=querysetcell(hqts_query, "employeenumber", variables.employeenumber, 1)>
	</cfif>
	<cfset get_external_demographics_data=hqts_query>
</cfif>
<cfif session.user_account_id EQ 1>
	<cfdump var="#get_external_demographics_data#" expand="yes" />
</cfif>