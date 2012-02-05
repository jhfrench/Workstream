<!-- Application_Manager/main/pag_create_product.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="pag_create_product.cfm" Specification="2.0">
	<responsibilities>
		I provide an interface for defining a new product.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfform name="create_product" action="index.cfm?fuseaction=main.insert_product" method="post">
<table width="60%">
	<tr>
		<td colspan="2" class="Forum_AltHeaderText">Product</td>
	</tr>
	<tr>
		<td width="50">What is the name of this application?</td>
		<td>
			<cfinput type="text" name="product_name" value="" maxlength="400" size="40" required="yes" message="Please enter the product name.">
		</td>
	</tr>
	<tr>
		<td class="Forum_AltHeaderText">Is browser navigation enabled?</td>
		<td>
			<input type="radio" name="browser_navigation_enabled_ind" value="1" /> Yes
			<input type="radio" name="browser_navigation_enabled_ind" value="1" /> No
		</td>
	</tr>
	<tr>
		<td class="Forum_AltHeaderText">When the application is "down", where is the page that users should see (relative to the application's root)?</td>
		<td>
			<input type="text" name="inactive_link" value=""  maxlength="400" size="40"/>
		</td>
	</tr>
	<tr>
		<td colspan="2" class="Forum_AltHeaderText"><input type="submit" value="Create new product record" /></td>
	</tr>
</table>
</cfform>
