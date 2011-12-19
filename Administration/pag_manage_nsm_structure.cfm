<!-- Administration/pag_manage_nsm_structure.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_manage_nsm_structure.cfm">
	<responsibilities>
		I help the user maintain the NSM structure.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="9/14/2007" role="FuseCoder" comments="Created File">
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

<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="table head describes the data held in the table below">
	<tr>
		<th align="left"><h2 style="margin:0px">Manage NSM Structure</h2>
		</th>
	</tr>
</table><img src="images/spacer.gif" alt="" width="560" height="1" /><br />
<table cellspacing="1" cellpadding="3" border="0" bgcolor="#eeeeee" summary="Table displays nsm structure management">
	<tr valign="top">
		<td>
			<table cellspacing="1" cellpadding="3" border="0" bgcolor="#eeeeee" width="200" summary="Table displays upload or edit mdm data">
				<tr>
					<td bgcolor="#aaaaaa" onmouseover="this.bgColor='#eeeeee';this.style.cursor='hand';" onmouseout="this.bgColor='#aaaaaa';this.style.cursor='default';"><a href="index.cfm?fuseaction=Administration.upload_mdm_data">Upload MDM data</a>
					</td>
				</tr>
				<tr>
					<td bgcolor="#aaaaaa" onmouseover="this.bgColor='#eeeeee';this.style.cursor='hand';" onmouseout="this.bgColor='#aaaaaa';this.style.cursor='default';"><a href="index.cfm?fuseaction=Administration.edit_nsm_entity">Edit NSM Entities</a>
					</td>
				</tr>
				<tr>
					<td bgcolor="#aaaaaa" onmouseover="this.bgColor='#eeeeee';this.style.cursor='hand';" onmouseout="this.bgColor='#aaaaaa';this.style.cursor='default';"><a href="index.cfm?fuseaction=Administration.manually_add_nsm">Manually Add NSM Entity</a>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>