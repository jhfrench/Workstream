<!-- Application_Manager/qry_get_last_updated.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="qry_get_last_updated.cfm" Specification="2.0">
	<responsibilities>
		I am a very, very, important query that retrieves a date/time stamp for the Application_Manager database. This stamp is used as a string to control ColdFusion's query caching on the query that retrieves all the application-level variables for a given installation. This date is maintained automatically by the Application_Manager DB through the use of triggers. Do not modify me without serious soul-searching AND consultation with Jeromy French (or his replacement if he gets hit by a bus).
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfquery name="qry_get_last_updated" datasource="#application.datasources.main#">
SELECT last_updated
FROM Last_Updated
</cfquery>