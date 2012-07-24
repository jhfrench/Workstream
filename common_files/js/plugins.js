// usage: log('inside coolFunc', this, arguments);
// paulirish.com/2009/log-a-lightweight-wrapper-for-consolelog/
window.log = function f(){ log.history = log.history || []; log.history.push(arguments); if(this.console) { var args = arguments, newarr; args.callee = args.callee.caller; newarr = [].slice.call(args); if (typeof console.log === 'object') log.apply.call(console.log, console, newarr); else console.log.apply(console, newarr);}};

// make it safe to use console.log always
(function(a){function b(){}for(var c="assert,count,debug,dir,dirxml,error,exception,group,groupCollapsed,groupEnd,info,log,markTimeline,profile,profileEnd,time,timeEnd,trace,warn".split(","),d;!!(d=c.pop());){a[d]=a[d]||b;}})
(function(){try{console.log();return window.console;}catch(a){return (window.console={});}}());


// place any jQuery/helper plugins in here, instead of separate, slower script files.

	// bind help area reveal/conceal to relevant elements
	$('#nav_help_button, #help_close').on('click', function() {
		$('#help_area').slideToggle('slow')
	});
	
	// load relevant help area with content from jQuery's AJAX call
	var getHelp = function (helpType, helpID) {
		// console.log('div #help_main_'+helpType);
		// console.log('index.cfm?fuseaction=Help.view_help_'+helpType+'&help_'+helpType+'_id='+helpID+' dl dd');
		$('div #help_main_'+helpType).load(
			'index.cfm?fuseaction=Help.view_help_'+helpType+'&help_'+helpType+'_id='+helpID+' dl dd',
			function(response, status, xhr) {
				if (status == 'error') {
					$('div #help_main_'+helpType).html('<h2>Oh boy</h2><p>Sorry, but there was an error:' + xhr.status + ' ' + xhr.statusText+ '</p>');
				}
				return this;
			}
		);
	}
			
	// if user requests an email response to their FAQ, require that they specify an email address
	$('#email_requested_ind').live('change', function(){
		if($(this).is(':checked')){
			$('#asker_email_address').attr('required','required');
		}
		else {
			$('#asker_email_address').removeAttr('required','required');
		}
	});
	
	$('#login_form').hide().show('slow');
	if(shake_ind) {
		$('#login_form').effect('shake');
	}