$(document).ready(function(){
  $("#arrival_date").datepicker({minDate: 0});
  // var min = $("#arrival_date").datepicker('option','minDate');
  // console.log(min);
  $(".trip_arrival_time").timepicker({
  	minuteStep: 5,
  	showInputs: false,
  	disableFocus: true
  });
  $(".trip_arrival_time").click(function() {
    $(".trip_arrival_time").timepicker("showWidget");
  });
});