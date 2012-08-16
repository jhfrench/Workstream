<!-- Administration/pag_lock_business_function.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_lock_business_function.cfm">
	<responsibilities>
		I lock business functions.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="8/9/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.business_function_id" default="0">
<cfparam name="attributes.method" default="">
<!--- get all privileges except read --->
<cfoutput>
<cfif NOT comparenocase(attributes.method, "Submit")>
<!--- deactivate all locked business functions --->
	 <cfinclude template="qry_deactivate_business_function.cfm">
	 <cfif isdefined("attributes.business_function_id") AND attributes.business_function_id NEQ 0>
		<cfloop list="#attributes.business_function_id#" index="i">
		<cfset business_function_comments=evaluate("comments_"&"#i#")>
			<cfinclude template="qry_insert_lock_business_function.cfm">
		</cfloop>
	</cfif>
	<cflocation url="index.cfm?fuseaction=Administration.lock_business_function">
</cfif>
</cfoutput>

<cfinclude template="qry_get_business_function_list.cfm">
<cfloop query="get_business_function_list">
	<cfparam name="comments_#business_function_id#" default="">
</cfloop>

<cfset variables.module_description="never_match">

<form name="form_lock_business_function" action="index.cfm?fuseaction=<cfoutput>#attributes.fuseaction#</cfoutput>" method="post">
<table summary="Table displays business function list">
<cfoutput query="get_business_function_list">
<cfset comment_value=evaluate("comments_"&"#business_function_id#")>
<cfif comparenocase(module_description, variables.module_description)>
	<tr>
		<th colspan="2">
				#module_description#
				<cfset variables.module_description=module_description>
		</th>
	</tr>
</cfif>
	<tr>
		<td>
			<input type="checkbox" name="business_function_id" id="business_function_id_#business_function_id#" value="#business_function_id#" #checked_ind# />
		</td>
		<td>
			<label for="business_function_id_#business_function_id#">#business_function_description#</label>
		</td>
		<td>
		<input type="text" name="comments_#business_function_id#" size="40" maxlength="40" value="<cfif len(get_business_function_list.comments)>#get_business_function_list.comments#<cfelse>#comment_value#</cfif>" title="Enter comments for business funtion" />
		</td>
	</tr>
</cfoutput>
	<tr>
		<td colspan="2">
			<input type="submit" name="method" value="Submit" class="btn btn-primary" />
		</td>
	</tr>
</table>
</form>
