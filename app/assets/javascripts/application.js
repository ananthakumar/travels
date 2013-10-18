// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
    function stripeResponseHandler(status, response) {  
      if (response.error) {  
        $("#stripe_error").text(response.error.message);}   
      else {  
        var form$ = $("#stripe-form");  
        var token = response['id'];  
        form$.append("<input type='hidden' name='stripeToken' value='" + token + "'/>");  
        form$.get(0).submit();  
      }}  
      $(document).ready(function() {  
        Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));  
        $("#stripe-form").submit(function(event) {  
          $('.signup-button').attr("disabled", "disabled");  
          Stripe.createToken({ number: $('.credit-number').val(),  
                               cvc: $('.credit-security').val(),  
                               exp_month: $('.card-expiry-month').val(),  
                               exp_year: $('.card-expiry-year').val()  
                             }, stripeResponseHandler);  
    return false;  
    });  
    });  
  $('.datepicker').datepicker();