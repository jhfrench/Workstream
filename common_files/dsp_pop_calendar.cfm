
<!--common_files/dsp_pop_calendar.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display a pop-up calendar.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:41:27  daugherty
Initial revision

Revision 1.1  2001-10-11 10:57:51-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 (DD | 10/5/2001) Added width and height attributes to the div tag.
	||
	END FUSEDOC --->
</cfsilent>
<div id="popCal" style="position:absolute; width:160px; height:170px; z-index:2; left: 0px; top: 2px; visibility: hidden"> 
	<applet mayscript codebase="<cfoutput>#request.dir_level##application.graphbase#</cfoutput>" code="tcaldate.class"  name="tL1" id="tL1" width="160" height="170">
		<param name="link" value="%Y.%M.%D">
		<param name="_jvalid" value="63">
		<param name="script" value="javascript:SeeDate('%M/%D/%Y')">
		<param name="font" value="Arial">
		<param name="startsunday" value="0">
		<param name="fontsize" value="12">
		<param name="fontstyle" value="1">
		<param name="bgcolor" value="13684944">
		<param name="bgcolor2" value="16777215">
		<param name="bgcolor3" value="420">
		<param name="t_col1" value="400">
		<param name="t_col2" value="8421520">
		<param name="t_col3" value="14737663">
		<param name="weeknumber" value="no"> 
	</applet>
</div>