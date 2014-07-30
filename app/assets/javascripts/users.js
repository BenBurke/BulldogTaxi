$( document ).ready(function() {
   $("#userbutton").click(function(event) {
    var fname = $("#user_fname").val();
    var lname = $("#user_lname").val();
    var email = $("#user_email").val();
    var phoneNumber = $("#user_phone_number").val();
    if (fname) {
      console.log(fname);
    } else {
      alert("Please provide your first name");
      event.preventDefault();}
      if (lname) {
      console.log(lname);
    } else {
      alert("Please provide your last name");
      event.preventDefault();}
      if (email) {
      console.log(email);
    } else {
      alert("Please provide your Yale email");
      event.preventDefault();}
      if (phoneNumber) {
      console.log(phoneNumber);
    } else {
      alert("Please provide your phone number");
      event.preventDefault();}
  });
});