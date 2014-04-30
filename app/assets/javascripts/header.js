var buildPage = {


onReady: function(){
      buildPage.buildHeader();
      buildPage.buildSubHeader();
      buildPage.buildForms();
      buildPage.buildMaps();
      buildPage.buildCategories();
      buildPage.hideForm();
      $(".img_new_session").on("click", buildPage.showSignUpForm);
      $("form").on("click", buildPage.signUpNewUser)
      $("#weather_icon").on("click", buildPage.showWeather)
  },


buildHeader: function(){

    var buildHeader = $("<div id='header'>");

    buildHeader.append("<img class='img_header_logo' src='assets/PNGs/My-Boro_Header.png'>")
                        .append("<img src='assets/PNGs/Sign_Up.png' class='img_new_session'>")
                        .append("<img src='assets/PNGs/Log_In.png' class='img_login_session'>");

   buildHeader.append("<div id='line'>");

    $("body").prepend(buildHeader);

  },



  buildSubHeader: function(){

    var buildSubHeader = $("<div id='subheader'>");

    var navBarUl = $('<ul class="subheader">');

    var li1 = $('<li class="use_location">').html('<img src="assets/PNGs/Use_current_location.png">');
    var li2 = $('<li class="bronx">').html('<img src="assets/PNGs/The_Bronx_button.png">');
    var li3 = $('<li class="brooklyn">').html('<img src="assets/PNGs/Brooklyn_button.png">');
    var li4 = $('<li class="staten island">').html('<img src="assets/PNGs/Staten_Island_button.png">');
    var li5 = $('<li class="queens">').html('<img src="assets/PNGs/Queens_button.png">');
    var li6 =  $('<li class="manhattan">').html('<img src="assets/PNGs/Manhattan_button.png">');
    var li7 = $('<li class="find_by_zip">').html('<img src="assets/PNGs/Find_by_Zip_Header.png">');
    navBarUl.prepend(li1, li2, li3, li4, li5, li6, li7);

    buildSubHeader.append(navBarUl);

    $("body").append(buildSubHeader);

  },


  buildForms: function(){
    var form = $("#signUpForm")
    $("body").append("<div id='main_container'>");
    $("#main_container").append(form);

  },


  buildMaps: function(){

    var maps = $("<div id='maps'>");


    var map1 = $("<div class='category_container_boro' id='manhattan_map'>");
    map1.append('<img src="assets/PNGs/Manhattan.png" class="boro_image">');

    var map2 = $("<div class='category_container_boro' id='brooklyn_map'>");
    map2.append('<img src="assets/PNGs/Brooklyn.png" class="boro_image">');

    var map3 = $("<div class='category_container_boro' id='queens_map'>");
    map3.append('<img src="assets/PNGs/Queens.png" class="boro_image_queens">');

    var map4 = $("<div class='category_container_boro' id='the_bronx_map'>");
    map4.append('<img src="assets/PNGs/The_Bronx.png" class="boro_image">');

    var map5 = $("<div class='category_container_boro' id='staten_island_map'>");
    map5.append('<img src="assets/PNGs/Staten_Island.png" class="boro_image">');

    var map6 = $("<div class='category_container_boro' id='find_by_zip_map'>");
    map6.append('<img src="assets/PNGs/Find_by_Zip.png" class="boro_image">');

    maps.prepend(map1, map2, map3, map4, map5, map6);


    $("#main_container").append(maps);


  },


buildCategories: function(){

    var categories = $("<div id='categories'>");

    var category1 = $("<div class='category_container' id='weather_icon'>");
    category1.append('<img src="assets/PNGs/Weather_SUNNY_CLOUDY.png" class="category_image">');

    var category2 = $("<div class='category_container' id='subway_icon'>");
    category2.append('<img src="assets/PNGs/Subway.png" class="category_image">');

    var category3 = $("<div class='category_container' id='movies_icon'>");
    category3.append('<img src="assets/PNGs/Movies.png" class="category_image">');

    var category4 = $("<div class='category_container' id='bike_icon'>");
    category4.append('<img src="assets/PNGs/Bike.png" class="category_image">');

    var category5 = $("<div class='category_container' id='news_icon'>");
    category5.append('<img src="assets/PNGs/News.png" class="category_image">');

    var category6 = $("<div class='category_container' id='food_icon'>");
    category6.append('<img src="assets/PNGs/Food.png" class="category_image">');

    categories.prepend(category1, category2, category3, category4, category5, category6);


    $("#main_container").append(categories);


},

  hideForm: function(){
    $("#signUpForm").hide();
  },

  showSignUpForm: function(event){
    $("#signUpForm").slideDown();
  },

  signUpNewUser: function(event){
    event.preventDefault();
    console.log(this)
    var form = ("form")
    var name = $("#user_name").val()
    var email = $("#user_email").val()
    var password = $("#user_password").val()
    var password_confirmation = $("#user_password_confirmation").val();

        $.ajax({
          type: 'POST',
          url: '/users',
          data: {
            name: name,
            email: email,
            password: password,
            password_confirmation: password_confirmation
            }
          }).done(function(){
            // var message = $('<p>' + data.message + '</p>');
            // form.after(message);
          });
  },

  showWeather: function(){
    var container = $("#weather_icon.category_container")

    $.ajax({
          type: 'GET',
          url: '/users',
          dataType: 'json'
          }).done(function(response){
            console.log(response);
          });
  },

  chooseBureau: function(){
    // HIDE BORO MAP AND (REVEAL && SCROLL UP WIDGETS)--BE AWARE OF TIMING HERE!
  }

};



$(document).ready(buildPage.onReady);
