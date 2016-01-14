var $grid_color = "#eee";
var $border_color = "#e1e8ed";
var $default_black = "#666";
var $red = "#3693cf";

// Monthly Revenue & Growth
var $border_color = "#F5F8FA";
var $grid_color = "#F5F8FA";
var $default_black = "#666";
//Datepicker
$(function() {
  $("#datepicker" ).datepicker();
});

// Appointments
$( "ul.appointments li" ).click(function() {
  $(this).css('text-decoration', 'line-through');
});
