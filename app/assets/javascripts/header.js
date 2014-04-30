
var totalHeader = {

  onReady: function(){
    $("body").append("#main_container")
    $("#main_container").append("#header")
    $("#header").append("<img src='assets/PNGs/My-Boro_Header.png' class='img_header_logo'>");
    $("#header").append("<img src='assets/PNGs/Sign_Up.png' class='img_new_session'>");
    $("#header").append("<img src='assets/PNGs/Log_In.png' class='img_login_session'>");
    $("#header").append("<div id='line'>");
    $("#signUpForm").hide();
    $(".img_new_session").on("click", totalHeader.showSignUpForm);
    $("form").on("submit", totalHeader.signUpUser);
    $("#subheader").hide();
    $(".category").hide();
  },

  showSignUpForm: function(event){
    $("#signUpForm").slideDown();
  },

  signUpUser: function(event){
    event.preventDefault();
    var name = $("#user_name").val()
    var email = $("#user_email").val()
    var password = $("#user_password").val()
    var password_confirmation = $("#user_password_confirmation").val();

        $.ajax({
          type: 'POST',
          url: '/users',
          data: {
            "name": name,
            "email": email,
            "password": password,
            "password_confirmation": password_confirmation }
          }).done(function(data){
            debugger
            console.log(this);
          });
  }


  // chooseBureau  function(){
  //   // HIDE BORO MAP AND (REVEAL && SCROLL UP WIDGETS)--BE AWARE OF TIMING HERE!
  // },
}

$(document).ready(totalHeader.onReady);
