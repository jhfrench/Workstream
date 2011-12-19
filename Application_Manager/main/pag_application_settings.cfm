<!-- Application_Manager/main/pag_application_settings.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="pag_application_settings.cfm" Specification="2.0">
	<responsibilities>
		I dump the application structure so the user can see all the application variables and settings for Application_Manager.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="3/10/2009" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->
<cfif NOT isdefined("attributes.product_id")>
	<cfinclude template="qry_get_product.cfm">
	<cfform name="product_id" action="index.cfm?fuseaction=main.application_settings" method="post">
		<cfselect name="product_id" query="qry_get_product" value="product_id" display="product_name" />
		<input type="submit" />
	</cfform>
<cfelse>
	<cfinclude template="dsp_application_settings.cfm">
</cfif>