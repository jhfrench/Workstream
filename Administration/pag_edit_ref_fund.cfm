<!-- Administration/pag_edit_REF_Fund.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_REF_Fund.cfm">
	<responsibilities>
		I display the form for editing fund and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/26/2007" role="FuseCoder" comments="Created File">
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
<cfinclude template="../common_files/qry_get_ref_fund.cfm">
<cfinclude template="act_edit_REF_Fund.cfm">
<cfinclude template="dsp_edit_REF_Fund.cfm">