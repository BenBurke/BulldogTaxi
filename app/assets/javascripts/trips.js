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
    var hour = arrival_time.split(":")[0];
    var am_pm = arrival_time.split(" ")[1];
    if (arrival_date) {
      // console.log(arrival_date);
    } else {
      alert("Please pick a valid date. Our operational dates are August 20-23.");
      event.preventDefault();}
    if (am_pm === "AM") {
      if (hour < 8){
        alert("Please select a later time, the earliest option is 8:00 AM");
        event.preventDefault();
      }
    } else {
      if (hour >= 8){
        alert("Please select an earlier time, the latest option is 7:30 PM");
        event.preventDefault();
      }
    }
      // console.log(am_pm);
      // console.log(hour);
      // event.preventDefault();
  });
});