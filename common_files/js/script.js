/* Author: Jeromy French
	JavaScript that executes with each page-load
	NOTE: jQuery plugins should go in common_files\js\plugins.js
*/	
$(document).ready(
	function () {
		if ( $('help_area')) {
			getHelp('article', default_help);
			getHelp('faq', default_faq);
		};
		
		var menu = document.getElementById('menu');
		var init = menu.offsetTop;
		var docked;
		
		window.onscroll = function () {
			if (!docked && (menu.offsetTop - scrollTop() < 0)) {
				menu.style.top = 0;
				menu.style.position = 'fixed';
				menu.className = 'docked';
				docked = true;
			} else if (docked && scrollTop() <= init) {
				menu.style.position = 'absolute';
				menu.style.top = init + 'px';
				menu.className = menu.className.replace('docked', '');
				docked = false;
			}
		};
	}
);