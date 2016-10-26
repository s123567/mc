//= require jquery
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function() {
  
  $(window).scroll(function () {
      //if you hard code, then use console
      //.log to determine when you want the 
      //nav bar to stick.  
      console.log($(window).scrollTop())
    if ($(window).scrollTop() > 380) {
      $('#nav_bar').addClass('navbar-fixed');
    }
    if ($(window).scrollTop() < 381) {
      $('#nav_bar').removeClass('navbar-fixed');
    }
  });

  
  
});