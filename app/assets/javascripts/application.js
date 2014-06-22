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
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require bootstrap-datepicker
//= require_tree .

$(function() {
    $('.remote')
        .on('ajax:before', function(){
            $('.ajax-loader').show();
        })
        .on('ajax:success', function(data, status, xhr) {
            $('.ajax-loader').hide();
        })
        .on('ajax:failure', function(xhr, status, error) {
        })
        .on('ajax:complete', function() {
            $('.ajax-loader').hide();
        });


    $(".edit_staff input, .edit_staff select").on("change", function(){
        $(this).closest('form').submit();
    });

    $('.pass-toggle-show a').on('click', function(e){
        e.preventDefault();
        $(this).closest('.pass').find(".pass-toggle, .pass-toggle-show").toggle();
    });

    $(".red-button").css('background-image','none').css('background-color','#FF0000');

    $('.datepicker').datepicker();

    $('#q').autocomplete({
        serviceUrl:'/credentials/suggestions',
        onSelect: function(value, data){ 
            //$("#sugg_form input").remove();
            $("#sugg_form").attr('action', '/credentials/' + data).submit();
        }
    });

});