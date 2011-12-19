/********** JS theme file for CalendarXP 4.0 ********/
// ---- FlatCalendar Specific Options ----
var gbCMFocus=true;	// true: auto jump to current month when Today-Part is clicked. ; false: no jump.

// ---- PopCalendar Specific Options ----
var gsSplit="/";	// Separator of date string, AT LEAST one char.
var giDatePos=1;	// Date format  0: D-M-Y ; 1: M-D-Y; 2: Y-M-D
var gbDigital=true;	// Month format   true: 01-05-2001 ; false: 1-May-2001
var gbShortYear=false;   // Year format   true: 2-digits; false: 4-digits

// ---- Common Options ----
var gsPopConfig="top=200,left=200,width=250,height=250,scrollbars=0,resizable=0";	// the look of popup event

var gMonths=new Array("01", "02","03","04","05","06","07","08","09","10","11","12");
var gWeekDay=new Array("S","M","T","W","T","F","S");

var gBegin=[1910,1,1];	// Valid Range begin from [Year,Month,Date]
var gEnd=[2050,12,31];	// Valid Range end at [Year,Month,Date]
var gsOutOfRange="Sorry, you cannot go beyond the designate range!";	// Range Error Message

var gbEuroCal=false;	// Show European Calendar Layout - Sunday goes after Saturday

var giDCStyle=0;	// the style of Date Controls.	0:3D; 1:flat; 2:text-only;
var gsCalTitle="gMonths[gCurMonth[1]-1]+' '+gCurMonth[0]";	// dynamic statement to be eval-ed as the title when giDCStyle>0.
var gbDCSeq=true;	// when giDCStyle is 3D, true: show month box before year box; false: vice-versa;
var gsYearInBox="i";	// dynamic statement to be eval-ed as the text shown in the year box. i.e. "'A.D.'+i" will show A.D.2001
var gsNavPrev="&lt;";	// The text of left navigator button
var gsNavNext="&gt;";	// The text of right navigator button

var gbHideToday=false;	// Remove the Today Part from the bottom
var gsToday="Today :"+gMonths[gToday[1]-1]+"/"+gToday[2]+"/"+gToday[0];	// The expression of Today-Part.

var giCellWidth=18;	// Calendar cell width;
var giCellHeight=18;	// Calendar cell height;
var gpicBG=null;	// url of background image
var gsBGRepeat="repeat";// repeat mode of background image, NN4 always does repeat. [no-repeat,repeat,repeat-x,repeat-y]
var gsCalTable="border=0 cellpadding=1 cellspacing=0 bordercolor=#18AEB6 bordercolordark=silver bordercolorlight=add8e6";	// properties of the calendar inside <table> tag
var gsPopTable="border=0 cellpadding=0 cellspacing=0 bordercolor=6495ed bordercolordark=6495ed bordercolorlight=add8e6";	// properties of the outmost container <table> tag

var gcBG="";	// Background color of the cells. Use "" for transparent!!!
var gcCalBG="#ffffff";	// Background color of the calendar
var gcFrame="white";	// Frame color
var gcTodayBG="#18AEB6";	// The background highlight color of the cell showing today
var gcSat="darkcyan";	// Saturday color
var gcSun="red";	// Sunday color
var gcWorkday="black";	// Workday color
var gcOtherDay="gray";	// The day color of other months
// gcOtherDay must be set in literal format, digital & rgb() format will not work in either NN6 or NN4!
var gcToggle="#18AEB6";	// highlight color of the focused cell
