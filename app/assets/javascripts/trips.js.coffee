# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	$(".trip_arrival_date").datepicker() 
	$(".trip_arrival_time").click ->
  $(".trip_arrival_time").timepicker "showWidget"
  return
