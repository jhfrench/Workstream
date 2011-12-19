PopCalendarXP 4.50 Limited Edition (Emailware), All rights reserved.
website - http://www.geocities.com/calendarxp (www.calendarxp.net will be online soon!!)

The most powerful & feature-rich date-picker in javascript world!
-------------------------------------------
Features List of PopCalendarXP:
+ Cross-broswer(IE4,5,6 & NN4,6) with highly customizable UI and functionality.
+ Agenda support with colorful highlights, images and even DATABASE connetion!! 
+ Themes support with dynamic background available! As cool as you can imagine.
+ Powerful date parsing, Remember and Highlight the Selected Date.
+ One-Click hide, like the real dropdown box.
+ Never be blocked by any other input boxes.(tricks needed in NN4)
+ Diversified Context Sensible Actions - popups, auto-mail and any javascript statement.
+ One plug-in function let you define the holidays by yourself.
+ Easy to embed, NO Mess-up, NO Conflict with the other scripts in your page.(NN4 needs a bit more)
+ Show context info both in status-bar and tooltip.(except NN4)
+ Dynamic date-range-confinement precises to day.
+ Disable any day with line-through effect.
+ Auto-adaptive popup position.
+ American & European Calendar Layout.
+ American & European & Chinese Date Format.
+ Literal & Digital Date Format.
+ Long & Short Year Format.
+ Super fast due to optimized code, only around 11KB download size.
+ Fully configurable, tell me if you can find anything that is unconfigurable. ^_^
+ Detailed comments and easier to config with separated config files.
+ Fully tested on IE 4.01,5.0,5.5,6.0beta and Netscape 4.08,4.75,4.77,6.01,6.1.(only on Windows platform)


- Limited Edition does NOT support NN4 & IE4.
- I decide not to open the code for Netscape 4.x & IE 4.x, they will only be available in Commercial Edition after payment.
- No detailed help file, but actually you don't need one! Cause it's so simple to use.
- Except for the payers, I will not reply usage-help requests.

--------------------------------------------------------------------------------------
Note it is NOT a Freeware! Please contact me to pay a small amount of license fee!! 
emailto: popcal@yahoo.com
--------------------------------------------------------------------------------------

Hints:
0. Check the Template.htm for basic usage guide; check the NN4Help.txt if you get problems in Netscape 4.x.
1. Do you know that you can generate the agenda.js file from ASP or JSP engine? ^_^ Thus your calendar will be connected to your database!!!
2. To switch between different themes, set the name of your calendar tag in the following format: name="<date-to-show-at-start>:<theme-name>:<agenda-filename>"
3. Check the knowhow.htm for more!!!!!
4. All the agenda events & actions can be defined in agenda.js file.
5. A theme consists of 2 theme-files - <themename>.js & <themename>.css.
6. Be sure to upgrade all the necessary files when you upgrade from an old version!! Upgrading the core engine file is insufficient when the version number jumps more than 0.1.
7. All the themes are set for English fonts environment. You need to fine-tune them for yours to get perfect look.

===========================================
File List in limited package:

Template.htm        Show how to integrate this calendar to your web page.
popcjs.htm          PopCalendar core engine for IE and NN6. NON-EDITABLE
agenda.js           agenda file, contains all the events and plugin function
normal.js           theme file, contains all the calendar options, like colors and format.
normal.css          theme file, contains some extra CSS options.
****** NOTE, the above 5 files is all you need to run a PopCalendar ******

readme.txt          this file, show many basic info of this product.
license.txt         License notifications.
KnowHow.htm         Show you many great tips!
OpenAPI.txt         Show you the spec of some useful function calls.
PopDemo.htm         A powerful demo.
agendaDemo.js       agenda file for the demo.
demo.css            a CSS file for the demo
PopDemo2.htm        A demo for dynamical date range constraint.
agendaDemo2.js      agenda file for the demo2.
mini.css            css file of mini theme.
mini.js             js file of mini theme. 

Directory "demoshot" consists of the snapshot of PopCalendarXP running under NN4

===========================================
Revision History:
4.50
+ Updated OpenAPI.txt.
- Fixed minor bugs in position auto-adapt.

4.40
+ Added support to auto-adapt the popup position when it goes beyond the browser border. ^_^
+ Greatly improved the auto-hide mechanism for anti-blocking in NN4. ^_^
+ Added a new anti-block tutorial for NN4, highly detailed. ^_^
+ Updated NN4Help.txt & KnowHow.htm with new tips.
+ OpenAPI.txt updated.
- Fixed a minor bug in NN4 anti-blocking.

4.20
+ A great demo to show the dynamical date range constraint.
+ Added OpenAPI.txt to show the functions that can be used outside the calendar. ^_^
- Fixed bugs in PopDemo, and it's easier to understand now. ^_^
- Fixed a minor bug in the fParseDate(), so that it can be listed as an open API now.

4.10
+ Updated KnowHow.htm.
+ Updated FlatDemo.htm
- Fixed a bug in popup() so that the event pop-window can stay on top every time.
- Fixed the alignment deviation of the calendar title under "flat mode" in NN4.
- Fixed a minor bug in NN4.

4.01
+ Updated NN4Help.txt with IMPORTANT instructions.
+ Added new tips in KnowHow.htm to make events popup stay on top.

4.0
+ Added IE4 support!!! (IE4 doesn't support calendar auto-resizing, so you must specify width & height in the tag)
+ Added support to put the calendar control in layers under NN4! See Template.htm.
+ Added flat style to support super-mini theme! COOOOOOOOOL!!!
+ Added options to config the text of the month-navigators. Now you can hardly find anything unconfigurable in this calendar.
+ Added serveral other options and changed the theme formats a bit.(You need to upgrade everything except agenda)
+ Added more stunning themes.
* Reorganized the files in package and updated the NN4Help.txt and KnowHow.htm with new tips.
- Added a new BUGFIX trick for NN4 Resizing Bug in NN4Help & Template.htm.
- Fixed a bug that will center all the <TD> tags after the calendar tag under NN4.
- Fixed a bug that will clear the decoration of all the <A> tags after the calendar tag under NN4.

3.55
+ Updated the readme.txt with file list illustration.
+ Added 1 note to NN4Help.txt

3.54
+ Updated NN4Help.txt with brand-new instructions, PopCalendar is now much easier to be implemented in a CSS- rich page under NN4.
+ Updated Demo files and Template.
* Core files unchanged, still 3.50.
- Fixed tag name length problem by un-nesting the <iframe> and <layer> tags. See template.
- The CSS <link> tag can now work properly without any trick in NN4.

3.50 (NN4 Bliss)
+ Added BUGFIX for the infamous NN4 RESIZING BUG!!
+ Added 1 option for adjusting properties of the outmost table inside the control.
+ Updated the Template.htm for quick reference.
+ Made the theme compatible with FlatCalendarXP. They can now share the same theme.
+ Putting new themes on my website. I'm planing for a theme collection show! Email me your creative themes. ^_^
* Calendar tag has been changed to fix NN4 bugs.
* Updated the NN4Help.txt & KnowHow.htm with new instructions.
* Fine-tuned UI in NN6.
- FIXED database connection know-how for NN4 (MIME type added to JSP sample).
- FIXED calendar bug that prevent it working in Frames.
- FIXED uncertain bug that will cause NN4 crash or freeze.

3.30
+ Significantly improved the position trick in NN4. Now it is much simple and seamless!!
+ Appended an optional portion to calendar-tag name so that multiple themes or agendas may be adopted in one page.
* Updated the NN4Help.txt & KnowHow.htm with new instructions.

3.20 (Special Day Release)
+ Modified the agenda file designation to ease the process of database connection.

3.10
+ Enhanced demo shows how powerful & flexible it can be.
+ Reorganized & updated KnowHow.htm shows the great tips!
- Fixed a bug which will calculate the wrong calendar width when cellspacing changed.
- Fixed a potential bug when set no background image.
* Optimized comments.

3.0
+ Too many, can't write down all of them.
+ Added one powerful demo.
* Optimized codes.

1.01
- no context show in tooltip & statusbar when mouse over "Today".


Author: Liming(Victor) Weng	--	I am Chinese. ^_^
email: popcal@yahoo.com
2001.8.28