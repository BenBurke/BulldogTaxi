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
//= require jquery-ui/datepicker
//= require turbolinks
//= require_tree .
//= require bootstrap-datepicker
//= require bootstrap-timepicker
//= require bootstrap

$(document).ready(function(){
	var div = $('#hacky');
		var divWidth = div.outerWidth();
		var parentWidth = div.parent().width();
		var marginWidth = (parentWidth - divWidth) / 2;
		div.css({
			marginLeft: marginWidth,
			marginRight: marginWidth
		});
	$(window).resize(function(e){
		var div = $('#hacky');
		var divWidth = div.outerWidth();
		var parentWidth = div.parent().width();
		var marginWidth = (parentWidth - divWidth) / 2;
		div.css({
			marginLeft: marginWidth,
			marginRight: marginWidth
		});
	});
});

$(document).ready(function(){
 var divone = $('#one')
 var divtwo = $('#two')
 var divthree = $('#three')
 var divfour = $('#four')
 var one = $('#one').outerHeight();
 var two = $('#two').outerHeight();
 var three = $('#three').outerHeight();
 var four = $('#four').outerHeight();
 var result = [one,two,three,four];
 var height = Math.max.apply( Math, result );
 divone.css({
   height: height
});
divtwo.css({
   height: height
});
divthree.css({
   height: height
});
divfour.css({
   height: height
});
});