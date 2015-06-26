(function($) {

	"use strict";


	$(document).ready(function() {

		// PARALLAX BACKGROUNDS FOR DESKTOPS

		if ($(this).width() > 768) {
			$(window).stellar({
				horizontalScrolling: false
			});
		}

		$("#navigation").headroom();

		// ADD ACTIVE CLASS TO NAVIGATION ITEM WHEN CLICKED

		$('.navigation a').on('click', function() {
			$('.navigation li').removeClass('active');
			$(this).closest('li').addClass('active');
		});


		// SMOOTH SCROLLING BETWEEN SECTIONS

		$('a[href*=#section-]').on('click', function() {

			var navHeight = $('header#navigation').height();
			var top = $(document).scrollTop();

		    if (location.pathname.replace(/^\//,'') === this.pathname.replace(/^\//,'') || location.hostname === this.hostname) {

		        var target = $(this.hash);
		        target = target.length ? target : $('[name=' + this.hash.slice(1) +']');

	           	if (target.length) {

		           	if ($(this.hash).offset().top < top ) {

		           		// scroll position includes nav height
		                $('html,body').animate({
			                 scrollTop: (target.offset().top - navHeight)
			            }, 600);
			            return false;

		            } else {

		            	// scroll position without nav height
		                $('html,body').animate({
			                 scrollTop: (target.offset().top + 2)
			            }, 600);
			            return false;
		            }
		        }
		    }
		});


		// RESPONSIVE VIDEOS - FITVIDS

		$('.fitvids').fitVids();


		// OWL CAROUSEL SLIDERS

		$("#showcase-slider, #quote-slider").owlCarousel({
			items : 1,
			loop : true,
	      	autoplay : true,
    		autoplayTimeout : 4000
		});

		$("#blog-teasers").owlCarousel({
			items : 3,
			video : true,
			autoplay : true,
    		autoplayTimeout : 4000,
    		autoplayHoverPause : true,
    		responsive : {
		        1	: {
		        	items: 1,
		        },
		        540 : {
		            items : 2,
		        },
		        767 : {
		            items : 3,
		        },
		    }
		});


		// FLEXSLIDER

		$("#gallery-slider").flexslider();

		// CONTACT FORM SUBMISSION

		$("#contact-form").submit(function() {
			var str = $(this).serialize();
			$.ajax({
				type: "POST",
				url: "php/contact.php",
				data: str,
				success: function(msg) {
					var result = '';
					if(msg === 'OK') {
						result = '<div class="form-feedback form-success">All good, message sent!</div>';
						$('input[type="submit"]').hide();
				  	} else {
						result = msg;
				  	}
				  	$('#contact-error').html(result);
			    }
			});
			return false;
		});



		// END OF SCRIPTS
	});


})(jQuery);
