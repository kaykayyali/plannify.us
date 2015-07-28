// Sticky Header
$(window).scroll(function() {

    if ($(window).scrollTop() > 100) {
        $('.main_h').addClass('sticky');
    } else {
        $('.main_h').removeClass('sticky');
    }
});

// Mobile Navigation
$('.mobile-toggle').click(function() {
    if ($('.main_h').hasClass('open-nav')) {
        $('.main_h').removeClass('open-nav');
    } else {
        $('.main_h').addClass('open-nav');
    }
});

$('.main_h li a').click(function() {
    if ($('.main_h').hasClass('open-nav')) {
        $('.navigation').removeClass('open-nav');
        $('.main_h').removeClass('open-nav');
    }
});

// navigation scroll lijepo radi materem
$(function() {
    $('a.logo, nav a, .home-buttons a, a.introarrow, a.footerarrow').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1000, 'easeInOutExpo');
        event.preventDefault();
    });
});


// init animations on appear
 var wow = new WOW(
  {
    boxClass:     'wow',      // animated element css class (default is wow)   
    mobile:       false        // trigger animations on mobile devices (true is default)
  }
);
wow.init();
 

// tooltip
$(function() {
    $('.homepage a').tooltip({placement: 'bottom'});
});


