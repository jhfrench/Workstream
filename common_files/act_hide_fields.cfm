
<!-- common_files/act_hide_fields.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I enable a wizard style of input by taking the fields that are on a page and putting them into hidden fields to be passed to the next page.

	||
	Edits: 
	$Log$
	Revision 1.0  2005/02/15 20:41:04  daugherty
	Initial revision

	||
	Variables:
	END FUSEDOC --->
<cfparam name="attributes.Exclude" default="">
</cfsilent>
<cfif isdefined("Form.Fieldnames")>
	<cfset fieldnames_processed="">
	<cfloop list="#Form.Fieldnames#" index="ii">
		<cfif ListFind(fieldnames_processed, ii) EQ 0 AND ListFindNoCase(attributes.Exclude, ii) EQ 0>
			<cfoutput><input type="hidden" name="#ii#" value="#HTMLEditFormat(form[ii])#"></cfoutput>
			<cfset fieldnames_processed=ListAppend(fieldnames_processed, ii)>
		</cfif>
	</cfloop>
</cfif>

