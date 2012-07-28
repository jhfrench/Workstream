// usage: log('inside coolFunc', this, arguments);
// paulirish.com/2009/log-a-lightweight-wrapper-for-consolelog/
window.log = function f(){ log.history = log.history || []; log.history.push(arguments); if(this.console) { var args = arguments, newarr; args.callee = args.callee.caller; newarr = [].slice.call(args); if (typeof console.log === 'object') log.apply.call(console.log, console, newarr); else console.log.apply(console, newarr);}};

// make it safe to use console.log always
(function(a){function b(){}for(var c='assert,count,debug,dir,dirxml,error,exception,group,groupCollapsed,groupEnd,info,log,markTimeline,profile,profileEnd,time,timeEnd,trace,warn'.split(','),d;!!(d=c.pop());){a[d]=a[d]||b;}})
(function(){try{console.log();return window.console;}catch(a){return (window.console={});}}());

if (!('console' in this)) console={}; 'log info warn error dir clear'.replace(/\w+/g,function(f) {   if (!(f in console)) console[f]=console.log||new Function; }); 

// place any jQuery/helper plugins in here, instead of separate, slower script files.
	if ( $('#help_area').length ) {
		//use JavaScript to tell screen readers that the help_area is visibly hidden
		$('#help_area:hidden').attr('aria-hidden', 'true');
		
		// bind help area reveal/conceal to relevant elements
		$('#nav_help_button, #help_close').on('click', function() {
			$('#help_area').slideToggle('slow');
			//set aria-hidden attribute to help screen-readers
			if ( $('#help_area').attr('aria-hidden')=='true' ) {
				$('#help_area').attr('aria-hidden', 'false');
			}
			else {
				$('#help_area').attr('aria-hidden', 'true');
			};
		});
		
		// when called, getHelp loads relevant help area with content from jQuery's AJAX call
		var getHelp = function (helpType, helpID) {
			console.log('$(\'div #help_main_'+helpType+'\').load(\'index.cfm?fuseaction=Help.view_help_'+helpType+'&help_'+helpType+'_id='+helpID+' dl dd\');');
			//console.log('index.cfm?fuseaction=Help.view_help_'+helpType+'&help_'+helpType+'_id='+helpID+' dl dd');
			// console.log( $('div #help_main_'+helpType) );
			$('div #help_main_'+helpType).load(
				'index.cfm?fuseaction=Help.view_help_'+helpType+'&help_'+helpType+'_id='+helpID+' dl dd',
				function(response, status, xhr) {
					if (status == 'error') {
						console.log('got here');
						$('div #help_main_'+helpType).html('<h2>Oh boy</h2><p>Sorry, but there was an error:' + xhr.status + ' ' + xhr.statusText+ '</p>');
					}
					return this;
				}
			);
		};
		
		if ( $('#help_content_article').length ) {
			console.log('help articles active2');
			
			//load article div with default content
			//getHelp('article', default_help);
			
			//assign onclick event to help article anchor tags to make use of AJAX calls instead of native HTML link functionality
			$('#help_top_article a.article').on('click', function(){
				getHelp( 'article', $(this).attr('data-id') );
			}).attr('href', '#help_area').attr('aria-controls', 'help_main_article');
			$('#help_top_article a.edit').on('click', function(){
				edit_help_article( $(this).attr('data-id') );
			}).attr('href', '#help_area');
		};
		
		if ( $('#help_content_faq').length ) {
			// console.log('help faq active');
			
			//load faq div with default content
			getHelp('faq', default_faq);
			
			//assign onclick event to help FAQ anchor tags to make use of AJAX calls instead of native HTML link functionality
			$('#help_top_faq a.question').on('click', function(){
				getHelp( 'faq', $(this).attr('data-id') );
			}).attr('href', '#help_area').attr('aria-controls', 'help_main_faq');
			$('#help_top_faq a.edit').on('click', function(){
				edit_help_faq( $(this).attr('data-id') );
			}).attr('href', '#help_area');

			//grab form actions from baseline HTML then replace with javascript that will call Ajax functions
			var faq_form_action=$('#faq_form').attr('action');
			$('#faq_form').attr('action', 'javascript:submit_faq();');
			
			// if user requests an email response to their FAQ, require that they specify an email address
			$('#email_requested_ind').on('change', function(){
				if($(this).is(':checked')){
					$('#asker_email_address').attr('required','required');
				}
				else {
					$('#asker_email_address').removeAttr('required','required');
				}
			});
			
			// handles the submission of a user's question
			function submit_faq() {
				var errorMessage='';
				var fieldFocus='';
				var emailFilter = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/; 
				
				//if user requests an email response to their FAQ, require that they specify a (valid) email address
				//console.log($('#faq_form #asker_email_address').val());
				if( $('#faq_form #asker_email_address').attr('required') === 'required' ) {
					var emailAddressValue=$('#faq_form #asker_email_address').val();
					if( !emailAddressValue.length ) {
						errorMessage+='Please enter your email address so we can send the response to you as (you requested).';
						fieldFocus='#asker_email_address';
					}
					else if( !emailFilter.test(emailAddressValue) ) {
						errorMessage+='This email address doesn\'t look right.';
						fieldFocus='#asker_email_address';
					};
				};
				
				//require a question
				//console.log($('#faq_form #question').val());
				if($('#faq_form #question').val() === '') {
					errorMessage='Please enter your question.\n'+errorMessage;
					fieldFocus='#question';
				};
				
				if( errorMessage !== '') {
					alert(errorMessage);
					$(fieldFocus).focus();
				}
				else {
					$('div #help_main_faq').load(
						faq_form_action+' #faq_result',
						$('#faq_form').serialize(),
						function(response, status, xhr) {
							if (status == 'error') {
								$('div #help_main_faq').html('<h2>Oh boy</h2><p>Sorry, but there was an error:' + xhr.status + ' ' + xhr.statusText+ '</p>');
							}
							else {
								$('#question').val('');
								$('#faq_form_legend').text('Want to ask something else?');
								$('#question_label').text('Ask another question');
							};
							return this;
						}
					);
				}
			};
		};
		
		if ( $('#help_content_search').length ) {
			//grab form actions from baseline HTML then replace with javascript that will call Ajax functions
			var help_search_form_action=$('#help_search_form').attr('action');
			$('#help_search_form').attr('action', 'javascript:submit_search();');
			
			function submit_search() {	
				$('div #help_main_search').load(
					help_search_form_action+' #search_result',
					$('#help_search_form').serialize(),
					function(response, status, xhr) {
						if (status == 'error') {
							$('div #help_main_faq').html('<h2>Oh boy</h2><p>Sorry, but there was an error:' + xhr.status + ' ' + xhr.statusText+ '</p>');
						};
						return this;
					}
				);
				$('div #help_main_search').focus();
			};
		};

	}

	$('#login_form').hide().show('slow');
	if(shake_ind) {
		$('#login_form').effect('shake');
	}