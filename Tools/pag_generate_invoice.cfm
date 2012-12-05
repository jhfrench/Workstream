
<!--Tools/pag_generate_invoice.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the invoice tool invoice list.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
	END FUSEDOC --->
</cfsilent>
<cfinclude template="act_generate_invoice.cfm">

<cfif variables.continue_processing_ind>
	<cfsavecontent variable="variables.generate_invoice">
		<cfdump var="#get_customer_invoice_details" />
		<cfdump var="#get_invoice_project_summary#" />
		<cfdump var="#act_generate_invoice#" />
		<cfheader name="Content-Disposition" value="filename=Invoice_#replace(get_customer_invoice_details.description, ' ', '_', 'All')#_#dateformat(now(), 'yyyy-mm-dd')#.xlsx">
	</cfsavecontent>
	<cfset variables.file_path=gettempfile(gettempdirectory(),"excel_")/>
	<cffile action="WRITE" file="#variables.file_path#" output="#variables.generate_invoice.trim()#"/>
	<cfcontent type="application/msexcel" file="#variables.file_path#" deletefile="true"/>
</cfif>