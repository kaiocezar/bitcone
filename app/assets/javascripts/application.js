// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require materialize
//= require jQuery-Mask-Plugin
//= require_tree .

$(document).ready(function() {

  // Update TextFields
  Materialize.updateTextFields();

  // Initialize collapse button
  $(".button-collapse").sideNav({
    menuWidth: 250
  });

  $('.tooltipped').tooltip({
    delay: 0
  });

  // Mask Phone
  var MaskBehavior = function(val) {
      return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
    },
    spOptions = {
      onKeyPress: function(val, e, field, options) {
        field.mask(MaskBehavior.apply({}, arguments), options);
      }
    };

  // Masks
  $('.phone').mask(MaskBehavior, spOptions);
  $('.zipcode').mask('00000-000');

  // Chips
  $('.chips').material_chip();

  // Tabs
  $('ul.tabs').tabs();

  // Select
  $('select').material_select();

  // ScrollSpy
  $('.scrollspy').scrollSpy();

  // Time Picker
  $('.timepicker').pickatime({
    default: 'now', // Set default time: 'now', '1:30AM', '16:30'
    fromnow: 1800000, // set default time to * milliseconds from now (using with default = 'now')
    twelvehour: false, // Use AM/PM or 24-hour format
    donetext: 'OK', // text for done-button
    cleartext: 'Fechar', // text for clear-button
    canceltext: 'Cancelar', // Text for cancel-button
    autoclose: false, // automatic close timepicker
    ampmclickable: true, // make AM PM clickable
    aftershow: function() {} //Function for after opening timepicker
  });
});
