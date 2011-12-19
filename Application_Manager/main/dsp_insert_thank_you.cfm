<!-- Application_Manager/main/dsp_insert_thank_you.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="dsp_insert_thank_you.cfm" Specification="2.0">
	<responsibilities>
		I ackowledge (to the user) that their new record has been created.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfoutput>
	A new record for '#attributes.value_inserted#' has been created.
</cfoutput>