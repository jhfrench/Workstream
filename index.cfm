<!-- sourcecode/index.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="index.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="5/30/2007" role="FuseCoder" comments="Created File">
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

<cfset FUSEBOX_APPLICATION_PATH="">

<!--- include the core file runtime --->
<cfinclude template="fusebox5/fusebox5.cfm" />

<!--- had to add this line from fusebox.init.cfm here to make fb5 work with FAAD --->
<cfinclude template="common_files/act_security.cfm">
