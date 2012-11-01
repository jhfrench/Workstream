
<!-- Administration/pag_reset_password.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_reset_password.cfm">
	<responsibilities>
		I reset the specified user's password.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/18/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="variables.forget_password_page_ind" default="">
<cfinclude template="../common_files/qry_get_user_information.cfm">
<cfset attributes.password="#left(ucase(get_user_information.first_name),1)##left(lcase(get_user_information.last_name),3)##dateformat(now(),"yyyymm")##attributes.user_account_id#">
<cfinclude template="../common_files/act_edit_password.cfm">
<div class="alert alert-info">
	The password has been reset<cfif NOT comparenocase(attributes.fuseaction, "Home.forget_password")> and sent to your email.<br />
	Please go to <a href="index.cfm?fuseaction=Home.login"><cfoutput>#application.product_name#</cfoutput> home page</a> and log in again</cfif>.
</div>