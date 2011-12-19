<!-- Application_Manager/main/pag_create_ref_environment.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="pag_create_ref_environment.cfm" Specification="2.0">
	<responsibilities>
		I provide an interface for defining a new environment.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfform name="create_ref_environment" action="index.cfm?fuseaction=#variables.circuit_label#.insert_ref_environment" method="post">
<table width="60%">
	<tr>
		<td width="50">Environment name</td>
		<td>
			<cfinput type="text" name="environment_name" value="" maxlength="400" size="40" required="yes" message="Please enter the environment's name.">
		</td>
	</tr>
	<tr>
		<td colspan="2" class="Forum_AltHeaderText"><input type="submit" value="Create new environment" /></td>
	</tr>
</table>
</cfform>
