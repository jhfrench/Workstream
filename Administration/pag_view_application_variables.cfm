<!-- Administration/pag_view_application_variables.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_view_application_variables.cfm">
	<responsibilities>
		I show a list of reference tables that can be administered by FAAD developers.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/19/2007" role="FuseCoder" comments="Created File">
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
<!---
<cfset variables.throw_error=variables.will_never_exist> --->

<cfdump var="#variables#">
<cfdump var="#application#">