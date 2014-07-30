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

$( document ).ready(function() {
   $("#tripbutton").click(function(event) {
    var arrival_date = $("#arrival_date").val();
    var arrival_time = $("#arrival_time").val();
    if (arrival_date) {
      console.log(arrival_date);
    } else {
      console.log(arrival_time);
      alert("Please Pick a valid Date");
      event.preventDefault();}
  });
});