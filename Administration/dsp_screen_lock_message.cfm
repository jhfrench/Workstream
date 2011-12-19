<!-- Administration/dsp_screen_lock_message.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_screen_lock_message.cfm">
	<responsibilities>
		I display message for locked screens.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="9/6/2007" role="FuseCoder" comments="Created File">
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


<cfoutput>
<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="table head describes the data held in the table below">
	<tr>
		<th align="left"><h2 style="margin:0px">SCREEN LOCK MESSAGE</h2></th>
	</tr>
</table>

<div class="datachart" style="border:1px solid black;">
<table width="100%" border="0" cellspacing="0" cellpadding="6" summary="Table displays page locked by administrator details">
	<tr>
		<td align="center"><h3 style="margin:0px">The page you are trying to access is locked by the administrator. Please contact administrator for details.</h3></td>
	</tr>
</table>
</div>
</cfoutput>

