<!-- Requirements/pag_edit_comments.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_comments.cfm">
	<responsibilities>
		I display the form for adding or editing user comments and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.comments_number" default="">
<cfparam name="attributes.description" default="">
<cfparam name="attributes.comments_type_id" default="0">
<cfparam name="attributes.comments_id" default="0">
<cfparam name="attributes.method" default="">
<cfset variables.errCount=0>
<cfset errMsg=arrayNew(1)>

<cfinclude template="../common_files/qry_get_comments_type.cfm">
<cfinclude template="qry_get_fuseactions.cfm">

<!--- set error messages to empty string --->
<cfloop from="1" to="10" index="errlist">
	<cfset errMsg[errlist]="">
</cfloop>

<!--- Process the comment if the send comment button is pressed --->
<cfif isdefined("attributes.comment_description")>
	<cfif len(attributes.comments_type_id) EQ 0>
		<cfset errMsg[1]="Please enter comments type">
		<cfset variables.errCount=variables.errCount+1>
	</cfif>
	<cfif NOT isnumeric(attributes.comments_number)>
		<cfset errMsg[2]="Please enter comments number and make sure it is a number">
		<cfset variables.errCount=variables.errCount+1>
	</cfif>
	<cfif len(attributes.comment_description) EQ 0>
		<cfset errMsg[3]="Please enter comments">
		<cfset variables.errCount=variables.errCount+1>
	</cfif>

	<!--- If there is no error --->
	<cfif errCount EQ 0>
		<cfinclude template="act_edit_comments.cfm">
	<cfelse>
		<cfoutput>
			<cfloop from="1" to="#arraylen(errMsg)#" index="errlist">
				 <cfif len(errMsg[errlist])><li>#errMsg[errlist]#</li></cfif>
			</cfloop>
		</cfoutput>
	</cfif>

</cfif>

<cfinclude template="qry_get_comment.cfm">
<cfif get_comment.recordcount NEQ 0>
	<cfset variables.screen_id=get_comment.screen_id>
<cfelse>
	<cfinclude template="qry_get_screen_id_from_referrer.cfm">
	<cfset variables.screen_id=get_screen_id_from_referrer.screen_id>
</cfif>

<cfinclude template="dsp_edit_comments.cfm">