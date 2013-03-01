
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
	<cfset variables.last_month=dateadd("d", -day(now()), now())>
	<cfsavecontent variable="variables.generate_invoice">
		<cfinclude template="dsp_invoice_xml.cfm">
		<cfheader name="Content-Disposition" value="filename=Invoice_#replace(get_customer_invoice_details.customer_name, ' ', '_', 'All')#_#dateformat(variables.last_month, 'yyyy_mm_dd')#.xml.xls">
	</cfsavecontent>
	<cfset variables.file_path=gettempfile(gettempdirectory(),"excel_")/>
	<cffile action="WRITE" file="#variables.file_path#" output="#variables.generate_invoice.trim()#"/>
	<cfcontent type="application/msexcel" file="#variables.file_path#" deletefile="true"/>
</cfif>