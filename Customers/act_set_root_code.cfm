

<!--Customers/act_set_root_code.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I select the root code for the new customer insert.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:45:32  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:39-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	(KL | 9/7/2001) removed the hard code for the code prefix and replaced it with the client variable "prefix"
	||
	END FUSEDOC --->
<cfinclude template="qry_get_prefix.cfm">
	<cfif NOT len(root_code)>
		<!--- <cfif NOT compare(attributes.company_id,"1")>
			<cfset Code_Prefix=1> 
		<cfelseif NOT compare(attributes.company_id,"8")>
			<cfset Code_Prefix=2>
		<cfelseif NOT compare(attributes.company_id,"7")>
			<cfset Code_Prefix=3>
		<cfelseif NOT compare(attributes.company_id,"4")>
			<cfset Code_Prefix=4>
		<cfelseif NOT compare(attributes.company_id,"2")>
			<cfset Code_Prefix=5>
		<cfelseif NOT compare(attributes.company_id,"9")>
			<cfset Code_Prefix=6>
		<cfelseif NOT compare(attributes.company_id,"5")>
			<cfset Code_Prefix=7>
		<cfelseif NOT compare(attributes.company_id,"6")>
			<cfset Code_Prefix=8>
		<cfelseif NOT compare(attributes.company_id,"3")>
			<cfset Code_Prefix=9> 
		</cfif>--->
		<cfset code_prefix=get_prefix.prefix>
<cfquery name="New_Root" datasource="#application.datasources.main#">
SELECT MAX(root_code)+1 AS 'new_code'
FROM customers
WHERE root_code LIKE '#Code_Prefix#%' 
	AND root_code NOT LIKE '9999%'
	AND root_code NOT LIKE '9998%'
</cfquery>
	<cfset new_code=new_root.new_code>
<cfelse>
	<cfset new_code=attributes.root_code>	
</cfif>
