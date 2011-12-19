<!-- Administration/pag_upload.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_upload.cfm">
	<responsibilities>
		I help the user upload data into the aplication's backend.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/12/2007" role="FuseCoder" comments="Created File">
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

<cfinclude template="../common_files/act_upload.cfm">

<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="table head describes the data in the table below">
	<tr>
		<th align="left"><h2 style="margin:0px">Administer Actual Data</h2></th>
	</tr>
</table>
<cfinclude template="../common_files/dsp_upload.cfm">