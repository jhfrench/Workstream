
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
		<cfinclude template="dsp_invoice_xml.cfm">
		<cfheader name="Content-Disposition" value="filename=Invoice_#replace(get_customer_invoice_details.customer_name, ' ', '_', 'All')#_#dateformat(now(), 'yyyy_mm_dd')#.xml.xls">
	</cfsavecontent>
	<cfset variables.file_path=gettempfile(gettempdirectory(),"excel_")/>
	<cffile action="WRITE" file="#variables.file_path#" output="#variables.generate_invoice.trim()#"/>
	<cfcontent type="application/msexcel" file="#variables.file_path#" deletefile="true"/>
	
	<!--- $issue$: get rid of this as soon as invoice tool works --->
	<cfquery name="reset" datasource="#application.datasources.main#">
	DELETE FROM Billing_History
	WHERE invoice_id>15;
	DELETE FROM Link_Invoice_Time_Entry
	WHERE invoice_id>15;
	DELETE FROM Invoice
	WHERE invoice_id>15;
	</cfquery>
</cfif>
