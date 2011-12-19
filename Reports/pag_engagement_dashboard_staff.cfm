
<!--Reports/pag_engagement_dashboard.cfm
	Author: Jeromy F  -->
<cfsilent>
<!--- FUSEDOC
	||
	Responsibilities: I am the container for the view engagements page

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:11:02  stetzer
<>

Revision 1.1  2001-10-11 10:56:24-04  long
Added $log $ for edits to all CFM files that have fusedocs.


	 
	(KL | 9/14/2001) added logic to make the access to the edit function database driven.
	||
	END FUSEDOC --->
<cfparam name="attributes.inactive" default="0">
</cfsilent>
<cfinclude template="qry_get_engagement_dashboard.cfm">
<cfinclude template="qry_get_engagement_ie.cfm">

<table align="center" border="1" cellpadding="0" cellpadding="0" bordercolor="gray"  cellspacing="0" width="98%">
	<cfinclude template="dsp_engagement_dashboard_row_header_staff.cfm">	
	<cfinclude template="dsp_Engagement_dashboard_rows_staff.cfm">  
 
</table>

