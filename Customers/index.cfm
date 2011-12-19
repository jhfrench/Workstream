
<!--Customers/index.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!-- FUSEDOC
	||
	Responsibilities: I am the FUSEBOX for the Customers module of workstream. 

	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:45:57  daugherty
	Initial revision

	Revision 1.3  2002-05-02 12:46:23-04  french
	Applied variable_check to engagements case.

	Revision 1.2  2002-04-09 09:51:05-04  french
	Added new case for 'Open Tasks'.

	Revision 1.1  2001-10-11 10:56:26-04  long
	Added $log $ for edits to all CFM files that have fusedocs.

	(KL | 10/2/2001) Added the circuit "instructions". This is the case for the instructions Screen on the new engagement screen.	
	||
	Variables:
	--> attributes.fuseaction: string, usually defined in the url, that dictates which page to display.
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	<-- request.pagetitle: string that is used as a part of the HTML page title
	END FUSEDOC --->
<cfswitch expression="#attributes.fuseaction#">
<!-- Begin Default Case --->
	<cfdefaultcase>
		<set name="request.pagetitle" value="customers">
		<include template="pag_customers.cfm">
	</cfdefaultcase>
</cfswitch>
</cf_bodycontent>
<include template="../common_files/app_layout.cfm">

