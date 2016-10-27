//= require jquery
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function() {

  AOS.init({
    duration: 1200
  });

  $(window).scroll(function(e){
      if ($(this).scrollTop() > 0) {
        $(".navbar").css({
          "background": "rgba(0, 0, 0, 0.7)",
          "box-shadow": "0 0 2px black"
        });
      }
      else {
        $(".navbar").css({
          "background": "transparent",
          "box-shadow": "0 0 0px transparent"
        });
      }
    });

  $(function() {
    $('a[href*="#"]:not([href="#"])').click(function() {
      if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
        var target = $(this.hash);
        target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
        if (target.length) {
          $('html, body').animate({
            scrollTop: target.offset().top
          }, 1000);
          return false;
        }
      }
    });
  });
  
  $(window).scroll(function () {
      //if you hard code, then use console
      //.log to determine when you want the 
      //nav bar to stick.  
      console.log($(window).scrollTop())
    if ($(window).scrollTop() > 284) {
      $('#nav_bar').addClass('navbar-fixed');
    }
    if ($(window).scrollTop() < 285) {
      $('#nav_bar').removeClass('navbar-fixed');
    }
  });

  
  
});