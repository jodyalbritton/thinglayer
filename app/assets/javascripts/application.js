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
//= require jquery
//= require jquery_ujs
//= require jquery-ui/autocomplete
//= require jquery-ui/sortable
//= require jquery-ui/slider
//= require jquery-ui/draggable
//= require jquery-ui/accordion
//= require jquery.jcrop
//= require packery.min
//= require pixel-admin
//= require events
//= require respond.min
//= require utils
//= require pixel-tasks
//= require jquery.slimscroll
//= require pixel-slimscroll
//= require raphael.min
//= require morris
//= require amcharts
//= require serial
//= require themes/light
//= require papercrop
//= require bootstrap
//= require main-navbar
//= require main-menu
//= require microphone.min
//= require bootstrap-toggle
//= require fastclick
//= require jquery.searchable
//= require jquery.timer
//= require jquery.ui.touch-punch
//= require jquery.tokeninput
//= require file-input
//= require expanding-input
//= require froala-editor.min.js
//= require jquery.bind_with_delay
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require dataTables/extras/dataTables.responsive
//= require dataTables/extras/dataTables.tableTools
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl
//= require eventPause
//= require_self


var ready;
ready = function() {

  PixelAdmin.start(init);
};

$(document).ready(ready);
$(window).on('page:load', ready);
