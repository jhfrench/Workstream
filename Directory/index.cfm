
<!--Directory/index.cfm
	Author: Jeromy F -->
<cfsilent>
	<!-- FUSEDOC
	||
	Responsibilities: This is the FUSE BOX. This is where everything is fused together for the Directory module which is used to add/edit/delete employees/users.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.5  2006/01/20 19:46:28  stetzer
	<>

	Revision 1.4  2006-01-20 14:35:15-05  stetzer
	Bug fix

	Revision 1.3  2006-01-20 08:54:35-05  stetzer
	<>

	Revision 1.2  2006-01-19 14:02:50-05  stetzer
	<>

	Revision 1.1  2006-01-19 13:59:21-05  stetzer
	<>

	Revision 1.0  2005-02-15 15:46:45-05  daugherty
	Initial revision

	Revision 1.3  2003-03-21 11:41:57-05  blell
	added cases for scheduled mail to be sent to emplyees to update thier contact information.
	
	Revision 1.2  2002-03-08 16:17:50-05  long
	added employee edit fuse to the index
	
	Revision 1.1  2001-10-11 10:56:09-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	Variables:
	--> attributes.fuseaction: string, usually defined in the url, that dictates which page to display.
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	<-- request.pagetitle: string that is used as a part of the HTML page title
	END FUSEDOC --->


<cfswitch expression="#attributes.fuseaction#">

	<cfdefaultcase>
		<!-- <set name="attributes.object_name" value="Employee List">
		<include template="../common_files/act_object_access.cfm"> -->
		<set name="request.pagetitle" value="Employee Directory">
		<include template="pag_directory.cfm">
	</cfdefaultcase>
</cfswitch>
</cf_bodycontent>
<include template="../common_files/app_layout.cfm">

