
var buildPage = {


onReady: function(){
      buildPage.buildHeader();
      buildPage.buildSubHeader();
      buildPage.buildForms();
      buildPage.buildMaps();
      buildPage.buildCategories();
      buildPage.showSignUpForm();
  },


buildHeader: function(){

    var buildHeader = $("<div id='header'>");

    buildHeader.prepend("<img id='img_header_logo' src='assets/PNGs/My-Boro_Header.png'>")
                        .append("<img src='assets/PNGs/Sign_Up.png' class='img_new_session'>")
                        .append("<img src='assets/PNGs/Log_In.png' class='img_login_session'>");

   buildHeader.append("<div id='line'>");

    $("body").prepend(buildHeader);

  },



  buildSubHeader: function(){

    var buildSubHeader = $("<div id='subheader'>");

    var navBarUl = $('<ul class="subheader">');

    var li1 = $('<li class="use_location">').text("Use my current location");
    var li2 = $('<li class="bronx">').text("The Bronx");
    var li3 = $('<li class="brooklyn">').text("Brooklyn");
    var li4 = $('<li class="staten island">').text("Staten Island");
    var li5 = $('<li class="queens">').text("Queens");
    var li6 =  $('<li class="manhattan">').text("Manhattan");
    var li7 = $('<li class="find_by_zip">').text("Find by Zip");

    navBarUl.prepend(li1, li2, li3, li4, li5, li6, li7);

    buildSubHeader.append(navBarUl);

    $("body").append(buildSubHeader);

  },


  buildForms: function(){

    $("body").append("<div id='main_container'>");

    $("#main_container").append("#signUpForm");


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


  showSignUpForm: function(event){
    $("#signUpForm").slideDown();
  },


  chooseBureau: function(){
    // HIDE BORO MAP AND (REVEAL && SCROLL UP WIDGETS)--BE AWARE OF TIMING HERE!
  }

};



$(document).ready(buildPage.onReady);
