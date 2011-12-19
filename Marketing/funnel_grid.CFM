
<CSSCRIPTDICT>
<SCRIPT>
<!--

CSStopExecution = false;
CSInit = new Array;
function CSScriptInit() {
	idxArray = new Array;
	for(var i=0;i<CSInit.length;i++) {
		idxArray[i] = i;
	}
	CSAction2(CSInit, idxArray);
}

CSAg = window.navigator.userAgent;
CSBVers = parseInt(CSAg.charAt(CSAg.indexOf("/")+1),10);
function IsIE() {
	return CSAg.indexOf("MSIE") > 0;
}

function CSIEStyl(s) {
	return document.all.tags("div")[s].style;
}

function CSNSStyl(s) {
	return CSFindElement(s,0);
}

function CSFindElement(n, ly) {
	if (CSBVers < 4) return document[n];
	var curDoc = ly ? ly.document : document;
	var elem = curDoc[n];
	if (!elem) {
		for (var i=0;i<curDoc.layers.length;i++) {
			elem = CSFindElement(n,curDoc.layers[i]);
			if (elem) return elem;
		}
	}
	return elem;
}

function CSButtonReturn () {
	var bAgent = window.navigator.userAgent;
	var bAppName = window.navigator.appName;
	if ((bAppName.indexOf("Explorer") >= 0) && (bAgent.indexOf("Mozilla/3") >= 0) && (bAgent.indexOf("Mac") >= 0))      return false;
	else return true;
}

CSIm = new Object();
function CSIShow(n,i) {
	if (document.images) {
		if (CSIm[n]) {
			var img = (!IsIE()) ? CSFindElement(n, 0) : document[n];
			if (img && typeof(CSIm[n][i].src) != "undefined") {
				img.src = CSIm[n][i].src;
			}
			if (i != 0)          self.status = CSIm[n][3];
			else          self.status = " ";
			return true;
		}
	}
	return false;
}

function CSILoad(action) {
	im = action[1];
	if (document.images) {
		CSIm[im] = new Object();
		for (var i=2;i<5;i++) {
			if (action[i] != '') {
				CSIm[im][i-2] = new Image();
				CSIm[im][i-2].src = action[i];
			}
			else CSIm[im][i-2] = 0;
		}
		CSIm[im][3] = action[5];
	}
}

CSStopExecution = false;
function CSAction(array) {
	return CSAction2(CSAct, array);
}

function CSAction2(fct, array) {
	var result;
	for (var i=0;i<array.length;i++) {
		if (CSStopExecution) return false;
		var actArray = fct[array[i]];
		var tempArray = new Array;
		for (var j=1;j<actArray.length;j++) {
			if ((actArray[j] != null) && (typeof(actArray[j]) == "object") && (actArray[j].length == 2)) {
				if (actArray[j][0] == "VAR") {
					tempArray[j] = CSStateArray[actArray[j][1]];
				}
				else {
					if (actArray[j][0] == "ACT") {
						tempArray[j] = CSAction(new Array(new String(actArray[j][1])));
					}
					else              tempArray[j] = actArray[j];
				}
			}
			else          tempArray[j] = actArray[j];
		}
		result = actArray[0](tempArray);
	}
	return result;
}

CSAct = new Object;
function CSSetImageURL(action) {
	var img = null;
	if (document.images) {
		if (!IsIE()) img = CSFindElement(action[1], 0);
		else img = document.images[action[1]];
		if (img) img.src = action[2];
	}
}

// -->
</SCRIPT>
</CSSCRIPTDICT>
<cfoutput>
<CSACTIONS>
	<csaction name="GoLiveAction1" class="Set Image URL" type="ONEVENT" val0="funnel_grid_13" val1="#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_13-over.gif">
	<csaction name="GoLiveAction2" class="Set Image URL" type="ONEVENT" val0="funnel_grid_13" val1="#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_13.gif">
	<csaction name="GoLiveAction3" class="Set Image URL" type="ONEVENT" val0="funnel_grid_14" val1="#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_14-over.gif">
	<csaction name="GoLiveAction4" class="Set Image URL" type="ONEVENT" val0="funnel_grid_14" val1="#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_14.gif">
	<csaction name="GoLiveAction5" class="Set Image URL" type="ONEVENT" val0="funnel_grid_15" val1="#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_15-over.gif">
	<csaction name="GoLiveAction6" class="Set Image URL" type="ONEVENT" val0="funnel_grid_15" val1="#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_15.gif">
</CSACTIONS>
<CSACTIONDICT>
<SCRIPT>
<!--

CSInit[CSInit.length] = new Array(CSILoad,/*CMP*/'funnel_grid_13',/*URL*/'#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_13-over.gif',/*URL*/'images/funnel_grid_13-over.gif',/*URL*/'','');
CSInit[CSInit.length] = new Array(CSILoad,/*CMP*/'funnel_grid_14',/*URL*/'#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_14-over.gif',/*URL*/'#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_14-over.gif',/*URL*/'','');
CSInit[CSInit.length] = new Array(CSILoad,/*CMP*/'funnel_grid_15',/*URL*/'#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_15-over.gif',/*URL*/'#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_15-over.gif',/*URL*/'','');
CSAct[/*CMP*/ 'GoLiveAction1'] = new Array(CSSetImageURL,/*CMP*/ 'funnel_grid_13',/*URL*/ '#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_13-over.gif');
CSAct[/*CMP*/ 'GoLiveAction2'] = new Array(CSSetImageURL,/*CMP*/ 'funnel_grid_13',/*URL*/ '#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_13.gif');
CSAct[/*CMP*/ 'GoLiveAction3'] = new Array(CSSetImageURL,/*CMP*/ 'funnel_grid_14',/*URL*/ '#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_14-over.gif');
CSAct[/*CMP*/ 'GoLiveAction4'] = new Array(CSSetImageURL,/*CMP*/ 'funnel_grid_14',/*URL*/ '#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_14.gif');
CSAct[/*CMP*/ 'GoLiveAction5'] = new Array(CSSetImageURL,/*CMP*/ 'funnel_grid_15',/*URL*/ '#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_15-over.gif');
CSAct[/*CMP*/ 'GoLiveAction6'] = new Array(CSSetImageURL,/*CMP*/ 'funnel_grid_15',/*URL*/ '#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_15.gif');
// -->
</SCRIPT>
</CSACTIONDICT>
<!-- End Preload Script -->
</HEAD>
<cfset onload="CSScriptInit();">
<!-- ImageReady Slices (funnel_grid.psd) -->
<TABLE WIDTH=305 BORDER=0 CELLPADDING=0 CELLSPACING=0>

	<TR>
		<td><img SRC="#request.dir_level##application.application_specific_settings.image_dir#spacer.gif" WIDTH="7" HEIGHT="1"></TD>
		<td><img SRC="#request.dir_level##application.application_specific_settings.image_dir#spacer.gif" WIDTH="75" HEIGHT=1></TD>
		<td><img SRC="#request.dir_level##application.application_specific_settings.image_dir#spacer.gif" width="9" height="1"></td>
		<td><img SRC="#request.dir_level##application.application_specific_settings.image_dir#spacer.gif" width="6" height="1"></td>
		<td><img SRC="#request.dir_level##application.application_specific_settings.image_dir#spacer.gif" width="9" height="1"></td>
		<td><img SRC="#request.dir_level##application.application_specific_settings.image_dir#spacer.gif" width="2" height="1"></td>
		<td><img SRC="#request.dir_level##application.application_specific_settings.image_dir#spacer.gif" width="25" height="1"></td>
		<td><img SRC="#request.dir_level##application.application_specific_settings.image_dir#spacer.gif" width="89" height="1"></td>
		<td><img SRC="#request.dir_level##application.application_specific_settings.image_dir#spacer.gif" width="83" height="1"></td>
	</TR>
	<tr class="RegText#session.workstream_text_size#">Total suspects currently not in any phase: #marketing_home.Not_Active#
		<td COLSPAN="9"><img SRC="#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_01.gif" WIDTH=305 HEIGHT=48></td>
	</tr>
	<tr>
		<td ROWSPAN="5"><img SRC="#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_02.gif" WIDTH=7 HEIGHT=171></td>
		<td align="right" class="RegText#session.workstream_text_size#">
			<img SRC="#request.dir_level##application.application_specific_settings.image_dir#zzz_funnel_grid_03.gif" WIDTH=10 HEIGHT=32><a href="index.cfm?fuseaction=home_Drill&variable=Prospecting" class="RegText#session.workstream_text_size#">#marketing_home.Prospecting#</a>&nbsp;&nbsp;</td>
		<td COLSPAN=7>
		<a href="index.cfm?fuseaction=home_Drill&variable=Prospecting">	<img SRC="#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_04.gif" WIDTH=223 HEIGHT=40 border="0"></a></td>
	</tr>
	<tr>
		<td COLSPAN=2 align="right" valign="middle" class="RegText#session.workstream_text_size#">
			<a href="index.cfm?fuseaction=Marketing.home_Drill&variable=Qualifying" class="RegText#session.workstream_text_size#">#marketing_home.Qualifying#</a>&nbsp;&nbsp;</td>
		<td COLSPAN=6>
			<a href="index.cfm?fuseaction=Marketing.home_Drill&variable=Qualifying"><img SRC="#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_06.gif" WIDTH="214" HEIGHT="41" border="0"></a></td>
	</tr>
	<tr>
		<td COLSPAN=3 align="right">
			<img SRC="#request.dir_level##application.application_specific_settings.image_dir#zzz_funnel_grid_07.gif" align="absmiddle" WIDTH=10 HEIGHT=38><font size="2" face="arial"><a href="index.cfm?fuseaction=Marketing.home_Drill&variable=Proposing" class="RegText#session.workstream_text_size#">#marketing_home.Proposing#</a>&nbsp;&nbsp;</td>
		<td COLSPAN=5>
			<a href="index.cfm?fuseaction=home_Drill&variable=Proposing"><img SRC="#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_08.gif" WIDTH="208" HEIGHT="41" border="0"></a></td>
	</tr>
	<tr>
		<td COLSPAN=5 align="right" class="RegText#session.workstream_text_size#">
			<img SRC="#request.dir_level##application.application_specific_settings.image_dir#zzz_funnel_grid_09.gif" align="absmiddle" WIDTH="10" HEIGHT="40" border="0" alt=""><a href="index.cfm?fuseaction=home_Drill&variable=Closing" class="RegText#session.workstream_text_size#">#marketing_home.Closing#</a>&nbsp;&nbsp;</td>
		<td COLSPAN=3 ROWSPAN=2>
			<a href="index.cfm?fuseaction=home_Drill&variable=Closing"><img SRC="#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_10.gif" WIDTH=197 HEIGHT=49 border="0"></a></td>
	</tr>
	<tr>
		<td COLSPAN=4>
			<img SRC="#request.dir_level##application.application_specific_settings.image_dir#zzz_do_not_remove.gif" WIDTH=99 HEIGHT=7></td>
		<td>
			<img SRC="#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_12.gif" WIDTH=2 HEIGHT=7></td>
	</tr>
	<tr>
		<td COLSPAN=7>
			<CSOBJ W=133 H=28 T="Button" HT="#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_13-over.gif" ST="" AL="" CSOVER="GoLiveAction1" CSOUT="GoLiveAction2">
			<A HREF="index.cfm?fuseaction=home_Drill&variable=All"
				ONMOUSEOVER="CSAction(new Array(/*CMP*/'GoLiveAction1'));return CSIShow(/*CMP*/'#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_13', 1);"
				ONMOUSEOUT="CSAction(new Array(/*CMP*/'GoLiveAction2'));">
				<img name="funnel_grid_13" SRC="#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_13.gif" WIDTH=133 HEIGHT=28 BORDER=0></A></CSOBJ></td>
		<td>
			<CSOBJ W=89 H=28 T="Button" HT="#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_14-over.gif" ST="" AL="" CSOVER="GoLiveAction3" CSOUT="GoLiveAction4">
			<A HREF="index.cfm?fuseaction=Line"
				ONMOUSEOVER="CSAction(new Array(/*CMP*/'GoLiveAction3'));return CSIShow(/*CMP*/'#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_14', 1);"
				ONMOUSEOUT="CSAction(new Array(/*CMP*/'GoLiveAction4'));">
				<img name="funnel_grid_14" SRC="#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_14.gif" WIDTH=89 HEIGHT=28 BORDER=0></A></CSOBJ></td>
		<td>
			<CSOBJ W=83 H=28 T="Button" HT="#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_15-over.gif" ST="" AL="" CSOVER="GoLiveAction5" CSOUT="GoLiveAction6">
			<A HREF="index.cfm?fuseaction=Grid"
				ONMOUSEOVER="CSAction(new Array(/*CMP*/'GoLiveAction5'));return CSIShow(/*CMP*/'#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_15', 1);"
				ONMOUSEOUT="CSAction(new Array(/*CMP*/'GoLiveAction6'));">
				<img name="funnel_grid_15" SRC="#request.dir_level##application.application_specific_settings.image_dir#funnel_grid_15.gif" WIDTH=83 HEIGHT=28 BORDER=0></A></CSOBJ></td>
	</tr></cfoutput>
</TABLE>
<!-- End ImageReady Slices -->