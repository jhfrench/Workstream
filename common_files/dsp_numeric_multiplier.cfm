<!-- common_files/dsp_numeric_multiplier.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_numeric_multiplier.cfm">
	<responsibilities>
		I display numeric multiplier radio buttons.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/9/2007" role="FuseCoder" comments="Created File">
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
<cfmodule template="../common_files/qry_get_numeric_multiplier.cfm" numeric_multiplier_id="0">
<cfparam name="attributes.numeric_multiplier_id" default="0">
<cfparam name="attributes.onclick" default="">
<cfoutput query="get_numeric_multiplier">

		<input type="radio" name="numeric_multiplier_id" id="numeric_multiplier_id_#numeric_multiplier_id#" value="#numeric_multiplier_id#"<cfif len(attributes.onclick)> onclick="#attributes.onclick#('numeric_multiplier_id_#numeric_multiplier_id#');"</cfif><cfif attributes.numeric_multiplier_id EQ numeric_multiplier_id> checked="checked"</cfif>/>&nbsp;<label for="numeric_multiplier_id_#numeric_multiplier_id#">#description#	</label>

</cfoutput>