
var totalHeader = {

  onReady: function(){
    $("#header").append("<img src='assets/PNGs/My-Boro_Header.png' class='img_header_logo'>");
    $("#header").append("<img src='assets/PNGs/Sign_Up.png' class='img_new_session'>");
    $("#header").append("<img src='assets/PNGs/Log_In.png' class='img_login_session'>");
    $(".img_new_session").on("click", totalHeader.showSignUpForm);
    $("#signUpForm").hide();
    $("#subheader").hide();
    $(".category").hide();
  },

  showSignUpForm: function(event){
    $("#signUpForm").slideDown();
  },

  chooseBureau: function(){
    // HIDE BORO MAP AND (REVEAL && SCROLL UP WIDGETS)--BE AWARE OF TIMING HERE!
  },
}

$(document).ready(totalHeader.onReady);
