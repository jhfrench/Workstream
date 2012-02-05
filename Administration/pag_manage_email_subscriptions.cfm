<!-- Administration/pag_manage_email_subscriptions.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_manage_email_subscriptions.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="6/4/2009" role="FuseCoder" comments="Created File">
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

<cfif isdefined("attributes.user_account_id")>
	<!--- 1. deactivate the user's existing User_Email_Category records --->
	<cfinclude template="qry_update_user_email_subscription.cfm">
	<cfif isdefined("attributes.email_category_id")>
		<!--- 2. Insert new User_Email_Category records --->
		<cfinclude template="qry_insert_user_email_subscription.cfm">
	</cfif>
</cfif>

<!--- if user isn't explicitly editing another user's access, they are editing their own access --->
<cfparam name="attributes.user_account_id" default="#session.user_account_id#">
<cfif isdefined("session.email_address") AND len(session.email_address)>
	<cfset attributes.lookup_email_address=session.email_address>
<cfelse>
	<cfset attributes.lookup_email_address=RETURN_NO_RECORD>
</cfif>
<cfinclude template="qry_get_email_blacklist.cfm">

<cfif get_email_blacklist.recordcount>
	You will not recieve email from the Workstream system because your email address (<cfoutput>#session.email_address#</cfoutput>) has been opted-out of receiving future communications.
<cfelse>
	<cfinclude template="qry_get_user_email_subscription.cfm">
	<cfset attributes.subscribed_email_category_id=valuelist(get_user_email_subscription.email_category_id)>
	<cfform name="form_manage_email" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
		<h3>Please check the box in front of the e-mail category you would like to receive.</h3>
		<cfinclude template="../common_files/dsp_email_category.cfm">
	</cfform>
</cfif>
