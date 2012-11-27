(function($) { 
	$.fn.pieChart = function(options, container){
		return $(this).each(function(){

			//configuration
			var sourceTable=$(this);												// ID of the table containing the source data
			var targetCanvas=$(this).attr('id')+'_canvas';							// ID of the canvas that will hold pie graph
			var chartSizePercent = 80;												// The chart radius relative to the canvas width/height (in percent)
			var sliceBorderWidth = .5;												// Width (in pixels) of the border around each slice
			var sliceBorderStyle = "#fff";											// Color of the border around each slice
			var sliceGradientColor = "#ddd";										// Color to use for one end of the chart gradient
			var maxPullOutDistance = 25;											// How far, in pixels, to pull slices out when clicked
			var pullOutFrameStep = 4;												// How many pixels to move a slice with each animation frame
			var pullOutFrameInterval = 40;											// How long (in ms) between each animation frame
			var pullOutLabelPadding = 55;											// Padding between pulled-out slice and its label	
			var pullOutLabelFont = "bold 12px 'Trebuchet MS', Verdana, sans-serif";	// Pull-out slice label font
			var pullOutValueFont = "10px 'Trebuchet MS', Verdana, sans-serif";		// Pull-out slice value font
			var pullOutValuePrefix = "";											// Pull-out slice value prefix
			var pullOutShadowColor = "rgba( 0, 0, 0, .5 )";							// Color to use for the pull-out slice shadow
			var pullOutShadowOffsetX = 5;											// X-offset (in pixels) of the pull-out slice shadow
			var pullOutShadowOffsetY = 5;											// Y-offset (in pixels) of the pull-out slice shadow
			var pullOutShadowBlur = 5;												// How much to blur the pull-out slice shadow
			var pullOutBorderWidth = 2;												// Width (in pixels) of the pull-out slice border
			var pullOutBorderStyle = "#333";										// Color of the pull-out slice border
			var chartStartAngle = 1.57 * Math.PI;									// Start the chart at 12 o'clock instead of 3 o'clock
		
			// Declare some variables for the chart
			var canvas;											 					// The canvas element in the page
			var currentPullOutSlice = -1;											// The slice currently pulled out (-1 = no slice)
			var currentPullOutDistance = 0;											// How many pixels the pulled-out slice is currently pulled out in the animation
			var animationId = 0;													// Tracks the interval ID for the animation created by setInterval()
			var chartData = [];														// Chart data (labels, values, and angles)
			var chartColors = [];													// Chart colors (pulled from the HTML table)
			var totalValue = 0;														// Total of all the values in the chart
			var canvasWidth;														// Width of the canvas, in pixels
			var canvasHeight;														// Height of the canvas, in pixels
			var centreX;															// X-coordinate of centre of the canvas/chart
			var centreY;															// Y-coordinate of centre of the canvas/chart
			var chartRadius;														// Radius of the pie chart, in pixels
		
			// Set things up and draw the chart
			init();
		
		
			/**
			 * Set up the chart data and colors, as well as the chart and table click handlers,
			 * and draw the initial pie chart
			 */
		
			function init() {
		
				// Get the canvas element in the page
				canvas = document.getElementById(targetCanvas);
		
				// Exit if the browser isn't canvas-capable
				if ( typeof canvas.getContext === 'undefined' ) return;
		
				// Initialise some properties of the canvas and chart
				canvasWidth = canvas.width;
				canvasHeight = canvas.height;
				centreX = canvasWidth / 2;
				centreY = canvasHeight / 2;
				chartRadius = Math.min( canvasWidth, canvasHeight ) / 2 * ( chartSizePercent / 100 );
		
				// Grab the data from the table,
				// and assign click handlers to the table data cells
				
				//label color
				if ( sourceTable.find('td.graph_label_color').length ) {
					//use the background of table cells classed as graph_label_color
					sourceTable.find('td.graph_label_color').each( function(row_ii) {
						// Extract and store the cell color
						if ( rgb = $(this).css('background-color').match( /rgb\((\d+), (\d+), (\d+)/) ) {
							chartColors[row_ii] = [ rgb[1], rgb[2], rgb[3] ];
							// console.log('assigned rgb color:'+$(this).css('background-color'));
						} else if ( hex = $(this).css('background-color').match(/#([a-fA-F0-9]{2})([a-fA-F0-9]{2})([a-fA-F0-9]{2})/) ) {
							chartColors[row_ii] = [ parseInt(hex[1],16) ,parseInt(hex[2],16), parseInt(hex[3], 16) ];
							// console.log('assigned hex color:'+$(this).css('background-color'));
						} else {
							alert( "Error: Color could not be determined! Please specify table colors using the format '#xxxxxx'" );
							return;
						}
			
						// Store the slice index in this cell, and attach a click handler to it
						$(this).data( 'slice', row_ii );
						$(this).click( handleTableClick );
			
					} );
				}
				else {
					//otherwise, use a default list
					var myStringArray = ["FFC363","5A82B5","A5597B","6B7D63","E77963","5AA29","CE5D63","428A6B","F7A263","9C9A5A","FF8E5A","7B96AD","528E84","BDCB94","A56163","4A8EAD","FFE784","4A6194","C6514A","A2835A","63E2E7","B55AB2","5AB55C","DDA0DD","000080","2E8B57","708090","7B68EE","000000","FF69B4","DC143C"];
					var hex;
					for (var i = 0; i < myStringArray.length; i++) {
						if ( hex = myStringArray[i].match(/([a-fA-F0-9]{2})([a-fA-F0-9]{2})([a-fA-F0-9]{2})/) ) {
							chartColors[i] = [ parseInt(hex[1],16) ,parseInt(hex[2],16), parseInt(hex[3], 16) ];
						}
					}
				}

				//label
				sourceTable.find('td.graph_label').each( function(row_ii) {
					//store label
					chartData[row_ii] = [];
					chartData[row_ii]['graph_label'] = $(this).text();
					// console.log('label:'+ $(this).text());
		
					// Store the slice index in this cell, and attach a click handler to it
					$(this).data( 'slice', row_ii );
					$(this).click( handleTableClick );
		
				} );
				//
				sourceTable.find('td.graph_data').each( function(row_ii) {
					// store value
					var value = parseFloat($(this).text());
					totalValue += value;
					value = value.toFixed(2);
					chartData[row_ii]['value'] = value;
		
					// Store the slice index in this cell, and attach a click handler to it
					$(this).data( 'slice', row_ii );
					$(this).click( handleTableClick );
		
				} );
		
				// Now compute and store the start and end angles of each slice in the chart data
		
				var currentPos = 0; // The current position of the slice in the pie (from 0 to 1)
		
				for ( var slice in chartData ) {
					chartData[slice]['startAngle'] = 2 * Math.PI * currentPos;
					chartData[slice]['endAngle'] = 2 * Math.PI * ( currentPos + ( chartData[slice]['value'] / totalValue ) );
					currentPos += chartData[slice]['value'] / totalValue;
				}
		
				// All ready! Now draw the pie chart, and add the click handler to it
				drawChart();
				$('#'+targetCanvas).click ( handleChartClick );
			}
		
		
			/**
			 * Process mouse clicks in the chart area.
			 *
			 * If a slice was clicked, toggle it in or out.
			 * If the user clicked outside the pie, push any slices back in.
			 *
			 * @param Event The click event
			 */
		
			function handleChartClick ( clickEvent ) {
		
				// Get the mouse cursor position at the time of the click, relative to the canvas
				var mouseX = clickEvent.pageX - this.offsetLeft;
				var mouseY = clickEvent.pageY - this.offsetTop;
		
				// Was the click inside the pie chart?
				var xFromCentre = mouseX - centreX;
				var yFromCentre = mouseY - centreY;
				var distanceFromCentre = Math.sqrt( Math.pow( Math.abs( xFromCentre ), 2 ) + Math.pow( Math.abs( yFromCentre ), 2 ) );
		
				if ( distanceFromCentre <= chartRadius ) {
		
					// Yes, the click was inside the chart.
					// Find the slice that was clicked by comparing angles relative to the chart centre.
		
					var clickAngle = Math.atan2( yFromCentre, xFromCentre ) - chartStartAngle;
					if ( clickAngle < 0 ) clickAngle = 2 * Math.PI + clickAngle;
											
					for ( var slice in chartData ) {
						if ( clickAngle >= chartData[slice]['startAngle'] && clickAngle <= chartData[slice]['endAngle'] ) {
		
							// Slice found. Pull it out or push it in, as required.
							toggleSlice ( slice );
							return;
						}
					}
				}
		
				// User must have clicked outside the pie. Push any pulled-out slice back in.
				pushIn();
			}
		
		
			/**
			 * Process mouse clicks in the table area.
			 *
			 * Retrieve the slice number from the jQuery data stored in the
			 * clicked table cell, then toggle the slice
			 *
			 * @param Event The click event
			 */
		
			function handleTableClick ( clickEvent ) {
				var slice = $(this).data('slice');
				toggleSlice ( slice );
			}
		
		
			/**
			 * Push a slice in or out.
			 *
			 * If it's already pulled out, push it in. Otherwise, pull it out.
			 *
			 * @param Number The slice index (between 0 and the number of slices - 1)
			 */
		
			function toggleSlice ( slice ) {
				if ( slice == currentPullOutSlice ) {
					pushIn();
				} else {
					startPullOut ( slice );
				}
			}
		
		 
			/**
			 * Start pulling a slice out from the pie.
			 *
			 * @param Number The slice index (between 0 and the number of slices - 1)
			 */
		
			function startPullOut ( slice ) {
		
				// Exit if we're already pulling out this slice
				if ( currentPullOutSlice == slice ) return;
		
				// Record the slice that we're pulling out, clear any previous animation, then start the animation
				currentPullOutSlice = slice;
				currentPullOutDistance = 0;
				clearInterval( animationId );
				animationId = setInterval( function() { animatePullOut( slice ); }, pullOutFrameInterval );
		
				// Highlight the corresponding row in the key table
				sourceTable.find('td').removeClass('highlight');
				var labelCell = sourceTable.find('td:eq(' + (slice*3+1) + ')');
				var valueCell = sourceTable.find('td:eq(' + (slice*3+2) + ')');
				labelCell.addClass('highlight');
				valueCell.addClass('highlight');
			}
		
		 
			/**
			 * Draw a frame of the pull-out animation.
			 *
			 * @param Number The index of the slice being pulled out
			 */
		
			function animatePullOut ( slice ) {
		
				// Pull the slice out some more
				currentPullOutDistance += pullOutFrameStep;
		
				// If we've pulled it right out, stop animating
				if ( currentPullOutDistance >= maxPullOutDistance ) {
					clearInterval( animationId );
					return;
				}
		
				// Draw the frame
				drawChart();
			}
		
		 
			/**
			 * Push any pulled-out slice back in.
			 *
			 * Resets the animation variables and redraws the chart.
			 * Also un-highlights all rows in the table.
			 */
		
			function pushIn() {
				currentPullOutSlice = -1;
				currentPullOutDistance = 0;
				clearInterval( animationId );
				drawChart();
				sourceTable.find('td').removeClass('highlight');
			}
		 
		 
			/**
			 * Draw the chart.
			 *
			 * Loop through each slice of the pie, and draw it.
			 */
		
			function drawChart() {
		
				// Get a drawing context
				var context = canvas.getContext('2d');
						
				// Clear the canvas, ready for the new frame
				context.clearRect ( 0, 0, canvasWidth, canvasHeight );
		
				// Draw each slice of the chart, skipping the pull-out slice (if any)
				for ( var slice in chartData ) {
					if ( slice != currentPullOutSlice ) drawSlice( context, slice );
				}
		
				// If there's a pull-out slice in effect, draw it.
				// (We draw the pull-out slice last so its drop shadow doesn't get painted over.)
				if ( currentPullOutSlice != -1 ) drawSlice( context, currentPullOutSlice );
			}
		
		
			/**
			 * Draw an individual slice in the chart.
			 *
			 * @param Context A canvas context to draw on	
			 * @param Number The index of the slice to draw
			 */
		
			function drawSlice ( context, slice ) {
		
				// Compute the adjusted start and end angles for the slice
				var startAngle = chartData[slice]['startAngle']	+ chartStartAngle;
				var endAngle = chartData[slice]['endAngle']	+ chartStartAngle;
					
				if ( slice == currentPullOutSlice ) {
		
					// We're pulling (or have pulled) this slice out.
					// Offset it from the pie centre, draw the text label,
					// and add a drop shadow.
		
					var midAngle = (startAngle + endAngle) / 2;
					var actualPullOutDistance = currentPullOutDistance * easeOut( currentPullOutDistance/maxPullOutDistance, .8 );
					startX = centreX + Math.cos(midAngle) * actualPullOutDistance;
					startY = centreY + Math.sin(midAngle) * actualPullOutDistance;
					context.fillStyle = 'rgb(' + chartColors[slice].join(',') + ')';
					context.textAlign = "center";
					context.font = pullOutLabelFont;
					context.fillText( chartData[slice]['graph_label'], centreX + Math.cos(midAngle) * ( chartRadius + maxPullOutDistance + pullOutLabelPadding ), centreY + Math.sin(midAngle) * ( chartRadius + maxPullOutDistance + pullOutLabelPadding ) );
					context.font = pullOutValueFont;
					context.fillText( pullOutValuePrefix + chartData[slice]['value'] + " (" + ( parseInt( chartData[slice]['value'] / totalValue * 100 + .5 ) ) +	"%)", centreX + Math.cos(midAngle) * ( chartRadius + maxPullOutDistance + pullOutLabelPadding ), centreY + Math.sin(midAngle) * ( chartRadius + maxPullOutDistance + pullOutLabelPadding ) + 20 );
					context.shadowOffsetX = pullOutShadowOffsetX;
					context.shadowOffsetY = pullOutShadowOffsetY;
					context.shadowBlur = pullOutShadowBlur;
		
				} else {
		
					// This slice isn't pulled out, so draw it from the pie centre
					startX = centreX;
					startY = centreY;
				}
		
				// Set up the gradient fill for the slice
				var sliceGradient = context.createLinearGradient( 0, 0, canvasWidth*.75, canvasHeight*.75 );
				sliceGradient.addColorStop( 0, sliceGradientColor );
				sliceGradient.addColorStop( 1, 'rgb(' + chartColors[slice].join() + ')' );
		
				// Draw the slice
				context.beginPath();
				context.moveTo( startX, startY );
				context.arc( startX, startY, chartRadius, startAngle, endAngle, false );
				context.lineTo( startX, startY );
				context.closePath();
				context.fillStyle = sliceGradient;
				context.shadowColor = ( slice == currentPullOutSlice ) ? pullOutShadowColor : "rgba( 0, 0, 0, 0 )";
				context.fill();
				context.shadowColor = "rgba( 0, 0, 0, 0 )";
		
				// Style the slice border appropriately
				if ( slice == currentPullOutSlice ) {
					context.lineWidth = pullOutBorderWidth;
					context.strokeStyle = pullOutBorderStyle;
				} else {
					context.lineWidth = sliceBorderWidth;
					context.strokeStyle = sliceBorderStyle;
				}
		
				// Draw the slice border
				context.stroke();
			}
		
		
			/**
			 * Easing function.
			 *
			 * A bit hacky but it seems to work! (Note to self: Re-read my school maths books sometime)
			 *
			 * @param Number The ratio of the current distance travelled to the maximum distance
			 * @param Number The power (higher numbers = more gradual easing)
			 * @return Number The new ratio
			 */
		
			function easeOut( ratio, power ) {
				return ( Math.pow ( 1 - ratio, power ) + 1 );
			}
			
		}).next(); //returns canvas(es)
	};
})(jQuery);

$('table.pieChart').pieChart();