<!-- Application_Manager/index.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="index.cfm" Specification="2.0">
	<responsibilities>
		I am the main page through which all things run.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfset FUSEBOX_APPLICATION_PATH=""> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
	<head>
		<title>AIT Application Manager</title>
		<!--- $issue$: perhaps Application_Manager should be moved to its own project and Bootstrapped. --->
	</head>

<!--- had to add this line from fusebox.init.cfm here to make fb5 work with Application_Manager --->
<cfinclude template="main/act_security.cfm">

<cfinclude template="fusebox4.runtime.cfmx.cfm">
</html>
