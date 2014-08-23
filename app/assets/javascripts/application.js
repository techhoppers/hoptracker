// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery-1.7.2.min
//= require jquery_ujs
//= require jquery-ui.min
//= require jquery.ui.touch-punch.min
//= require bootstrap.min
//= require bootstrap-editable.min
//= require trumbowyg.min
//= require theme
//= require charts
//= require excanvas.min
//= require jquery.flot
//= require jquery.flot.pie
//= require jquery.flot.orderBars
//= require jquery.flot.tooltip.min
//= require jquery.flot.resize
//= require jquery.hoverintent.min
//= require jquery.lightbox
//= require msgGrowl
//= require jquery.msgbox.min
//= require line
//= require donut

$(function () {

    Theme.init ();
    $.fn.editable.defaults.mode = 'inline';
    $.fn.editable.defaults.ajaxOptions = {
        type: "PUT"
    };
    
    $('[data-toggle="tooltip"]').tooltip();

    $('.textEditor').trumbowyg();
   
    $('.editable').editable({
        
        success: function(response, newValue) {
            if(response.status == 'error') return response.msg; //msg will be shown in editable form
        }
    });

    $(document).on('click', '.msgbox-confirm', function (e) {
        var url = $(this).attr("data-url");
        var confirm_msg = $(this).attr("confirm-message");
        $.msgbox(confirm_msg, {
            type: "confirm",
            buttons : [
            {
                type: "submit",
                value: "Yes"
            },

            {
                type: "submit",
                value: "No"
            },

            {
                type: "cancel",
                value: "Cancel"
            }
            ]
        }, function(result) {
            if(result == "Yes"){
                window.location.href = url;
            }
        });
    });

    $('.gallery-container > li').hoverIntent({
        over: showPreview,
        timeout: 500,
        out: hidePreview,
        sensitivity: 4
    });

    function showPreview () {
        $(this).find ('.preview').fadeIn ();
    }

    function hidePreview () {
        $(this).find ('.preview').fadeOut ();
    }

    setTimeout (function () {
        $('.gallery-container > li').each (function () {
            var preview, img, width, height;

            preview = $(this).find ('.preview');
            img = $(this).find ('img');

            width = img.width ();
            height = img.height ();

            preview.css ({
                width: width
            });
            preview.css ({
                height: height
            });

            preview.addClass ('ui-lightbox');
        });
    }, 500);
	

    $(".datePicker").datepicker({
        changeMonth: true,
        changeYear: true,
        yearRange: "2000:2050",
        dateFormat: "yy-mm-dd"
    });


});
