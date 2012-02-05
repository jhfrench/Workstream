<!-- Administration/dsp_copy_user_access.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_copy_user_access.cfm">
	<responsibilities>
		I display the form for helping administrator to copy user access.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="8/30/2007" role="FuseCoder" comments="Created File">
			$Id:$
			(JF | 9/9/9) Making corrections depicted in 508_jm_2009_09_09_7.png.
			
			(JF | 7/19/10) Cleaning up verbiage and row coloring.
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
	
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="alphabet_navigation" fuseaction="Administration.copy_user_access" field_name="last_initial" field_value="" processform="1" source_user_account_id="#attributes.source_user_account_id#">
<h2 style="margin:0px" id="top-side">Copy User Access</h2>

<img src="images/spacer.gif" alt="" width="560" height="1"><br />
<cfoutput>#attributes.display_message#
<strong>
<div style="position:absolute;top:-90em;left:-100em;">
	<a href="##begin_table_content" title="hidden browser link to skip alphabetical navigation"></a>
</div>
<cfloop list="A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z" index="character_ii">
	<a href="javascript:alphabet_navigation('#character_ii#');">#character_ii#</a> | 
</cfloop>
<a href="javascript:alphabet_navigation('');">All</a>
</strong>
<a name="begin_table_content"></a>
<cfform name="form_copy_user_access" action="index.cfm?fuseaction=Administration.copy_user_access" method="post">
<div class="datachart" style="border:1px solid ##999999">
<table cellpadding="3" cellspacing="0" width="100%" border="0" summary="Table displays user information">
	<tr bgcolor="##999999">
		<th align="left" scope="col">&nbsp;</th>
		<th align="left" scope="col">Last Name</th>
		<th align="left" scope="col">First Name</th>
		<th align="left" scope="col">Username</th>
		<th align="left" scope="col">Center</th>
	</tr>
	<cfloop query="get_user_information">
	<cfif currentrow MOD 2>
		<cfset variables.row_color="eeeeee">
	<cfelse>
		<cfset variables.row_color="dddddd">
	</cfif>
	<tr bgcolor="###variables.row_color#" onmouseover="this.bgColor='##cfdee3';this.style.cursor='hand';" onmouseout="this.bgColor='###variables.row_color#';this.style.cursor='default';" onclick="javascript:Element.toggle('var_id_#currentrow#'); return false;">
		<td id="last_name"><cfinput type="#variables.form_element_type#" name="#variables.form_element_label#" value="#user_account_id#" id="user_account_id_#user_account_id#" required="yes" message="Please choose a user."></td>
		<td id="last_name">#last_name#</td>
		<td id="first_name">#first_name#</td>
		<td id="username" scope="row"><label for="user_account_id_#user_account_id#">#user_name#</label></td>
		<td id="center">#center_abbreviation#</td>
	</tr>
	</cfloop>
	<tr bgcolor="##999999">
		<td colspan="5" align="center">
		<cfif attributes.source_user_account_id NEQ 0>
			<input type="hidden" name="source_user_account_id" value="#attributes.source_user_account_id#"/>
		</cfif>
			<input type="submit" alt="Copy User" name="submit" value="#variables.submit_label#"/>
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)"/>
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>