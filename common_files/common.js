
// scroll the element vertically based on its width and the slider maximum value
function scrollVertical(value, element, slider) {
	element.scrollTop=Math.round(value/slider.maximum*(element.scrollHeight-element.offsetHeight));
	}
	
// scroll the element horizontally based on its height and the slider maximum value
function scrollHorizontal(value, element, slider) {
	element.scrollLeft=Math.round(value/slider.maximum*(element.scrollWidth-element.offsetWidth));
	}

//prevent pasting into a given text field
function prevent_paste(method, action) {
	var msg = "Please confirm your email address by typing it in.";
	if (method=='mouse') {
		// This function is responsible for checking which button is pressed. If user clicks the right mouse button then an alert is coming out that "Right Click Not Allowed!".
		if (action.button==2) {
			//For right click
			alert(msg);
		}
	}
	else {
		// This function is responsible for checking which key is being pressed. If user presses ctrl key then the an alert is coming out that "Sorry, this functionality is disabled.".
		var code = (document.all) ? action.keyCode:action.which;
		if (parseInt(code)==17) {
			// This is the Key code for CTRL key
			alert(msg);
			window.event.returnValue = false;
		}
	}
}

/* Use one function for multiple text areas on a page
 Limit the number of characters per textarea  */
function text_counter(field, count_display, character_limit) {
	// if too long...trim it!
	if (field.value.length > character_limit) 
		field.value = field.value.substring(0, character_limit);
	// otherwise, update 'characters left' counter
	else
		$(count_display).innerHTML = character_limit - field.value.length;
		if (field.value.length+100 > character_limit)
			$(count_display).style.backgroundColor = 'red';
		else
			$(count_display).style.backgroundColor = '#eeeeee';
}

function openUserPref(URL)
{
  userPrefWindow = window.open(URL, 'userprefs', 'toolbar=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=0,width=600,height=600,left = 372,top = 200');
  userPrefWindow.focus();
}

function redirectURL(url) 
{
  window.location.href = url;
}

function UA(){
  var v = navigator.appVersion.toLowerCase(), u = navigator.userAgent.toLowerCase(), n = navigator.appName;
  this.mac = (v.indexOf("mac")+1);
  this.win = (v.indexOf("win")+1);
  this.nn = (n == "Netscape");
  this.ie = (n == "Microsoft Internet Explorer");
  this.aol = (u.indexOf("aol")+1);
  this.opera = (u.indexOf("opera")+1);
  this.ver = (this.ie) ? parseFloat(v.split('msie ')[1]) : parseFloat(v);
  this.major = this.ver.toString().split('.')[0];
	this.minor = this.ver.toString().split('.')[1];
	this.v4 = (this.major == 4);
	this.os = (this.mac) ? 'mac' : (this.win) ? 'win' : navigator.platform;
  this.name = (this.nn) ? 'nn' : (this.ie) ? 'ie' : n;
  this.codeName = this.name +'_'+ parseInt(this.ver) + '_'+ this.os;
}
var ua = new UA();

var onloadHandlers = [];
function loadEvents() {
  for(var i=0; i<onloadHandlers.length; i++) {
    eval(onloadHandlers[i]);
  }
}
window.onload = loadEvents;

var onresizeHandlers = [];
function resizeEvents() {
  for(var i=0; i<onresizeHandlers.length;i++) {
    eval(onresizeHandlers[i]);
  }
}
window.onresize = resizeEvents;

function handleResize(init) {
  if(!(document.layers)) return;
  if(init==true) with (navigator) {
    document.pgW=innerWidth;
    document.pgH=innerHeight;
    onresizeHandlers[onresizeHandlers.length] = 'handleResize()';
  }
  else if (innerWidth!=document.pgW || innerHeight!=document.pgH) location.reload();
}
handleResize(true);

function getObjByName(name,doc) {
  var o = 0;
  if(!doc) doc = document;
  if(doc[name]) o=doc[name];
  if(document.all && doc.all[name]) o=doc.all[name];
  if(o) {
    if(!o.getElementsByTagName) o.getElementsByTagName = getElementsArray;
    return o;
  }
  if(document.layers) {
    for(var i=0;i < doc.layers.length;i++){
      var lyrdoc = doc.layers[i].document;
      if(lyrdoc[name]) return lyrdoc[name];
      if(lyrdoc.layers.length > 0) {
        var o = getObjByName(name,lyrdoc);
        if(o) return o;
      }
    }
  }
  return 0;
}
if(!document.getElementById) document.getElementById = getObjByName;

function getElementsArray(el) {
  if(document.layers) {
    var doc = (this == document) ? document : this.document;
    switch(el) {
      case 'img' : return doc.images;
      case 'a' : return doc.links;
      case 'div' : return doc.layers;
      case 'form' : return doc.forms;
      default : return 0;
    }
  }
  if(document.all) return this.all.tags(el);
  return 0;
}
if(!document.getElementsByTagName) document.getElementsByTagName = getElementsArray;
if(document.layers) Layer.prototype.getElementsByTagName = getElementsArray;

function show(div){
  if(document.all) window.document.all[div].style.visibility = 'visible';
  else if(document.layers) getObjByName(div).visibility = 'show';
  else document.getElementById(div).style.visibility = 'visible';
}
function hide(div){
  if(document.all) window.document.all[div].style.visibility = 'hidden';
  else if(document.layers) getObjByName(div).visibility = 'hide';
  else document.getElementById(div).style.visibility = 'hidden';
}

function swapImg() {
  if(!document.images) return;
  var args = swapImg.arguments;
  for(var i=0;i < args.length;i+=2) {
    var imgSrc = (args[i + 1].indexOf('[') != -1) ? eval(args[i + 1] + '.src') : args[i + 1];
    if(getObjByName(args[i])) getObjByName(args[i]).src = imgSrc;
  }
}

function setCookie(name,value,expires) {
  document.cookie = escape(name)+'='+escape(value)+'; expires='+expires.toGMTString();
}

function getCookie(name) {
  var value,nl,cl,i,j,e;
  name+='=';
  value = 0;
  nl = name.length;
  cl = document.cookie.length;
  i = 0;
  while (i < cl) {
    j = i+nl;
    if(document.cookie.substring(i,j) == name) {
      e = document.cookie.indexOf(';',j);
      if(e == -1) e = document.cookie.length;
      value = unescape(document.cookie.substring(j,e));
      break;
    }
    i = document.cookie.indexOf(' ', i) + 1;
    if (i == 0) break;
  }  
  return value;
}

function openNASAWindow(url)
{
  if (url != "#")
  {
    var positionX = screen.width;
    var positionY = ((screen.height)/2);

    var sizeX = 720;
    var sizeY = 640;
    
    var strWindowFeatures = "";
    strWindowFeatures += 'menubar=yes,location=yes,toolbar=yes,directories=yes,scrollbars=yes,status=yes,resizable=yes,outerWidth='+720+',outerHeight='+640+',width='+720+'height='+640+',left='+80+',top='+60+'screenX='+80+',screenY='+60;
    winPopupWindow = window.open(url, "nasawindow", strWindowFeatures);
    winPopupWindow.focus();
  }
}

function openWorldBook(url)
{
  if (url != "#")
  {
    var strWindowFeatures = "";
    strWindowFeatures += 'menubar=yes,location=yes,toolbar=yes,directories=yes,scrollbars=yes,status=yes,resizable=yes,outerWidth='+625+',outerHeight='+720+',width='+625+',height='+720+',left='+80+',top='+0+',screenX='+80+',screenY='+0;
    winPopupWindow = window.open(url, "worldbook", strWindowFeatures);
    winPopupWindow.focus();
  }
}

function openDeepImpactViewer(url)
{
  if (url != "#")
  {
    var strWindowFeatures = "";
    strWindowFeatures += 'menubar=no,location=no,toolbar=no,directories=no,scrollbars=no,status=no,resizable=no,outerWidth='+746+',outerHeight='+600+',width='+746+',height='+600+',left='+100+',top='+100+',screenX='+100+',screenY='+100;
    winPopupWindow = window.open(url, "viewer", strWindowFeatures);
    winPopupWindow.focus();
  }
}

// This function from has been modified to take a single string of all images separated by commas
/*
function preLoad(a) {
  var o = [];
  for(var i=0; i<a.length; i++) {
    o[i] = new Image();
    o[i].src = '/images/'+a[i]+'_1.gif';
  }
}
*/

function preLoad(str) {
  var a = str.split(',') ;
  var o = [];
  for(var i=0; i<a.length; i++) {
    o[i] = new Image();
    //o[i].src = '/images/'+a[i]+'_1.gif';
    o[i].src = a[i]+'_1.gif';
  }
}

function openPDF()
{
    var baseLink = '/tvschedule/pdf/tvsked_';
    var pdfExt = '.pdf';
    var linkURL = baseLink + pdfLink + pdfExt;
    window.location=linkURL; 
}

function openXLS()
{
    var baseLink = '/tvschedule/xls/tvsked_';
    var xlsExt = '.xls';
    var linkURL = baseLink + xlsLink + xlsExt;
    window.location=linkURL;
}

function NewWindow(mypage, myname, w, h, scroll) {
	var winl = (screen.width - w) / 2;
	var wint = (screen.height - h) / 2;
	winprops = 'height='+h+',width='+w+',top='+wint+',left='+winl+',scrollbars='+scroll+',resizable'
	win = window.open(mypage, myname, winprops)
	if (parseInt(navigator.appVersion) >= 4) { win.window.focus(); }
}

function popup(copyURL,newwidth,newheight)
{
       window.open(copyURL, 'theconfirmWin','top=0,left=0,toolbar=no,location=no,directories=no,status=no,scrollbars=no,menubar=no,width='+newwidth + ',height=' + newheight);
}
 
function popup2(copyURL,newwidth,newheight)
{
        window.open(copyURL, 'theconfirmWin','top=0,left=0,toolbar=no,location=no,directories=no,status=no,scrollbars=yes,menubar=no,width='+newwidth + ',height=' + newheight);
}

function openPopUpWindowNoMenubar(url)
{
  if (url != "#")
  {
    var positionX = screen.width;
    var positionY = ((screen.height)/2);

    var sizeX = 720;
    var sizeY = 640;
    
    var strWindowFeatures = "";
    strWindowFeatures += 'menubar=no,location=no,toolbar=no,directories=no,scrollbars=yes,status=no,resizable=yes,outerWidth='+720+',outerHeight='+640+',width='+720+'height='+640+',left='+80+',top='+60+'screenX='+80+',screenY='+60;
    winPopupWindow = window.open(url, "nasawindow", strWindowFeatures);
    winPopupWindow.focus();
  }
}

function submitPopUpEmail() {
     newwin = window.open("","myNewWin","menubar=no,location=no,toolbar=no,directories=no,scrollbars=yes,status=no,resizable=yes,width=720,height=640,toolbar=0"); 
     newwin.focus();
     var a = window.setTimeout("document.emailForm.submit();",500); 
}

function submitPopUpEmailWithMenuBar() {
     newwin = window.open("","myNewWin","menubar=yes,location=yes,toolbar=no,directories=no,scrollbars=yes,status=no,resizable=yes,width=720,height=640,toolbar=0"); 
     newwin.focus();
     var a = window.setTimeout("document.emailForm.submit();",500); 
}

/*
preLoad('placeholder/navigation/topnav/nav_top_0','placeholder/navigation/topnav/nav_top_1','placeholder/navigation/topnav/nav_top_2','placeholder/navigation/topnav/nav_top_3','placeholder/navigation/topnav/nav_top_4','placeholder/navigation/topnav/nav_top_5');
*/

preLoad('images/nav_top_0,images/nav_top_1,images/nav_top_2,images/nav_top_3,images/nav_top_4,images/nav_top_5');

 
function printThis() {
  var agt = navigator.userAgent.toLowerCase();
  if (window.print) {
     window.print();
  }
  else if (agt.indexOf("mac") != -1) {
     alert("Press 'Cmd+p' on your keyboard to print article. ");
  }
  else {
     alert("Press 'Ctrl+p' on your keyboard to print article. ");
  }
  
}

function closeThis() {
    var agt = navigator.userAgent.toLowerCase();
    var is_major = parseInt(navigator.appVersion);

    var is_ie     = ((agt.indexOf("msie") != -1) && (agt.indexOf("opera") == -1));
	var is_ie3    = (is_ie && (is_major < 4));
	var is_ie4    = (is_ie && (is_major == 4) && (agt.indexOf("msie 4")!=-1) );
	var is_ie5up  = (is_ie && !is_ie3 && !is_ie4);

    if (window.open && !window.closed) {
        if (agt.indexOf("mac") != -1 && is_ie5up ) {
            window.close();
        }
        else if (agt.indexOf("mac") != -1) {
            alert("Press 'Cmd+w' on your keyboard to close window. ");
        }
        else {
            window.close();
        }
    }
}

// User Preferences code begins

redirectToPref();

function setCookie(name, value, expires, path, domain, secure)
{
  var curCookie = name + "=" + escape(value) +
          ((expires) ? "; expires=" + expires.toGMTString() : "") +
          ((path) ? "; path=" + path : "") +
          ((domain) ? "; domain=" + domain : "") +
          ((secure) ? "; secure" : "");
  document.cookie = curCookie;
}

function getCookie(name)
{
  var dc = document.cookie;
  var prefix = name + "=";
  var begin = dc.indexOf("; " + prefix);
  if (begin == -1) {
        begin = dc.indexOf(prefix);
        if (begin != 0) return null;
  } else
        begin += 2;
  var end = document.cookie.indexOf(";", begin);
  if (end == -1)
        end = dc.length;
  return unescape(dc.substring(begin + prefix.length, end));
}

function updateSessionPref()
{
  var sessionCk = getCookie("sessionpref");
  if (sessionCk == null) {
    return;
  }

  var prevSessionCk = parseInt(sessionCk);
  var url = document.location.href;

  var lb_idx = url.indexOf("/lb/");
  var nonflash_idx = url.indexOf("flash=0");
  var para_idx = url.indexOf("flash=");

  if(lb_idx != -1) {
    setCookie("sessionpref", 2, null, "/", null, null);
  } else if((nonflash_idx != -1) || ((para_idx == -1)&&(prevSessionCk == 1))) {
    setCookie("sessionpref", 1, null, "/", null, null);
  } else {
    setCookie("sessionpref", 0, null, "/", null, null);
  }
}

function redirectToPref()
{
  updateSessionPref();
  var sessionCk = getCookie("sessionpref");
  if (sessionCk != null) {
    return;
  }
  var siteVersion = parseInt(getCookie("viewsite"));

  switch(siteVersion) {
    case 0:
    case 1:
      var url = document.location.href;
      var idx = url.indexOf("/lb/");
      if (idx != -1) {
        newurl = url.substring(0, idx) + "/" + url.substring(idx + "/lb/".length, url.length);
        url = newurl;
        document.write("Redirecting to user preferences...");
		window.location = url;
      }
      break;
    case 2:
      var url = document.location.href;
      var textval = url.indexOf("/lb/");
      if(textval == -1) {
        var url_except_http = url.substring("http://".length, url.length);
        var idx = url_except_http.indexOf("/");
        var url_domain = url_except_http.substring(0, idx);
        var lb_url = "http://" + url_domain + "/lb/" + url_except_http.substring(idx+1, url_except_http.length);
        document.write("Redirecting to user preferences...");
        window.location = lb_url;
      }
      break;
  }

  setCookie("sessionpref", siteVersion, null, "/", null, null);
}

// User Preferences code ends


var ns = (navigator.appName.indexOf("Netscape") != -1);
var d = document;
function JSFX_FloatDiv(id, sx, sy)
{
	var el=d.getElementById?d.getElementById(id):d.all?d.all[id]:d.layers[id];
	var px = document.layers ? "" : "px";
	window[id + "_obj"] = el;
	if(d.layers)el.style=el;
	el.cx = el.sx = sx;el.cy = el.sy = sy;
	el.sP=function(x,y){this.style.left=x+px;this.style.top=y+px;};

	el.floatIt=function()
	{
		var pX, pY;
		pX = (this.sx >= 0) ? 0 : ns ? innerWidth : 
		document.documentElement && document.documentElement.clientWidth ? 
		document.documentElement.clientWidth : document.body.clientWidth;
		pY = ns ? pageYOffset : document.documentElement && document.documentElement.scrollTop ? 
		document.documentElement.scrollTop : document.body.scrollTop;
		if(this.sy<-280) 
		pY += ns ? innerHeight : document.documentElement && document.documentElement.clientHeight ? 
		document.documentElement.clientHeight : document.body.clientHeight;
		this.cx += (pX + this.sx - this.cx)/8;this.cy += (pY + this.sy - this.cy)/8;
		this.sP(this.cx, this.cy);
		setTimeout(this.id + "_obj.floatIt()", 40);
	}
	return el;
}

function change_parent_url(url) {
	document.location=url;
}