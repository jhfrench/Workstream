<!-- common_files/dsp_abnormal_navigation_sub.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_abnormal_navigation_sub.cfm">
	<responsibilities>
		I display the weird navigation that ESMD uses.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="9/27/2007" role="FuseCoder" comments="Created File">
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
<div id="nav_d2" class="nav_d2" style="display:none;">
	<iframe src="null.html" scrolling="no" frameborder="0" class="nav_d2_inner">blank background</iframe>
	<div class="nav_d2_outer">
		<form>
		<table cellpadding="0" cellspacing="0" border="0" width="870" summary="Table displays preferences">
			<tr>
				<td width="470"> <strong style="font-size:16pt;color:white">Preferences</strong> </td>
				<td align="right" width="400">
					<table cellpadding="4" cellspacing="1" border="0" width="90%" bgcolor="white" summary="Table displays search and display criteria">
						<tr align="center">
							<td bgcolor="#555555" onmouseover="this.bgColor='#956a01';this.style.cursor='hand';" onmouseout="this.bgColor='#555555';this.style.cursor='default';"><span class="mainNav">Search</span></td>
							<td bgcolor="#555555" onmouseover="this.bgColor='#956a01';this.style.cursor='hand';" onmouseout="this.bgColor='#555555';this.style.cursor='default';"><span class="mainNav">Data</span></td>
							<td bgcolor="#044669" onmouseover="this.bgColor='#956a01';this.style.cursor='hand';" onmouseout="this.bgColor='#044669';this.style.cursor='default';"><span class="mainNav">Display</span></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<img src="images/spacer.gif" alt="" width="60" height="8" border="0" /><br />
		<table cellpadding="0" cellspacing="0" border="0" summary="table displays chart size information">
		<tr>
			<td><img src="images/spacer.gif" alt="" width="870" height="1" border="0" /></td>
		</tr>
		<tr valign="top">
			<td>
		<form id="switchform">
			<table cellpadding="0" cellspacing="0" border="0" summary="Table displays chart size">
				<tr>
					<td class="number"><strong>Chart Size:</strong></td>
					<td>&nbsp;</td>
					<td>
						<input type="radio" name="choice" value="none" onclick="chooseStyle(this.value, 365)" id="small" />
						<label for="small">Small (default)</label>
						&nbsp;&nbsp;&nbsp;
						<input type="radio" name="choice" value="alt2" onclick="chooseStyle(this.value, 365)" id="Medium" />
						<label for="Medium">Medium</label>
						&nbsp;&nbsp;&nbsp;
						<input type="radio" name="choice" value="alt3" onclick="chooseStyle(this.value, 365)" id="Large" />
						<label for="Large">Large</label>
					</td>
				</tr>
				<tr>
					<td class="number"><strong>Windows:</strong></td>
					<td>&nbsp;</td>
					<td>&nbsp;<a href="javascript:void(Effect.Grow('sys1');Effect.Grow('sys2');Effect.Grow('help_area');)" onclick="Effect.Grow('sys1');Effect.Grow('sys2');Effect.Grow('help_area');">Show All Windows</a></td>
				</tr>
			</table>
		</form>
		</td>
		</tr>
		</table>
		</form>
	</div>
	<div class="nav_control_d2">
		<table width="100%" border="0" cellpadding="4" cellspacing="0"  summary="Table displays navigation controls">
			<tr>
				<td><img src="images/spacer.gif" alt="" width="1" height="1" border="0" /></td>
				<td class="number"><a href="javascript:void(Effect.toggle('nav_d2','appear');return false;)" onclick="Effect.toggle('nav_d2','appear'); return false;">x</a></td>
			</tr>
			<tr>
				<td colspan="2"><img src="images/spacer.gif" alt="" width="760" height="1" border="0" /></td>
			</tr>
		</table>
	</div>
</div>