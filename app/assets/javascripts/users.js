$( document ).ready(function() {
  function IsEmail(email) {
     var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
      return regex.test(email);
  }

   $("#userbutton").click(function(event) {
    var fname = $("#user_fname").val();
    var lname = $("#user_lname").val();
    var email = $("#user_email").val();
    var phoneNumber = $("#user_phone_number").val();
    if (fname) {
      $("#user_fname").css({ borderColor: '#cccccc' });
      // console.log(fname);
    } else {
      alert("Please provide your first name");
      $("#user_fname").css({ borderColor: 'Red' });
      event.preventDefault();
      return;
    }
    if (lname) {
      $("#user_lname").css({ borderColor: '#cccccc' });
      // console.log(lname);
    } else {
      alert("Please provide your last name");
      $("#user_lname").css({ borderColor: 'Red' });
      event.preventDefault();
      return;
    }
    if (email) {
      if (IsEmail(email)){
      $("#user_email").css({ borderColor: '#cccccc' });
      // console.log(email);
      } else {
        alert("Invalid Email, please provide your Yale email")
        $("#user_email").css({ borderColor: 'Red' });
        event.preventDefault();
        return;
      }
    } else {
      alert("Please provide your Yale email");
      $("#user_email").css({ borderColor: 'Red' });
      event.preventDefault();
      return;
    }
    if (phoneNumber) {
      if (phoneNumber.match(/\d/g).length === 10 || phoneNumber.match(/\d/g).length === 11){
      $("#user_phone_number").css({ borderColor: '#cccccc' });
      // console.log(phoneNumber);
      } else {
        alert("Please retype your phone number");
        $("#user_phone_number").css({ borderColor: 'Red' });
        event.preventDefault();
        return;
      }
    } else {
      alert("Please provide your phone number");
      $("#user_phone_number").css({ borderColor: 'Red' });
      event.preventDefault();
      return;
    }
  });
});