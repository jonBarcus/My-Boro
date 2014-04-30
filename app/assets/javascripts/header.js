var buildPage = {

onReady: function(){
      buildPage.buildHeader();
      buildPage.buildSubHeader();
      buildPage.buildForms();
      buildPage.buildMaps();
      buildPage.buildCategories();
      buildPage.hideForm();
      buildPage.hideSubHeader();
      $("#sign_up").on("click", buildPage.showSignUpForm);
      $("form").on("submit", buildPage.signUpNewUser);
      $("#weather_icon").click(buildPage.showWeather);
      $("#news_icon").click(buildPage.showNews);
      $("#food_icon").on("click", buildPage.showFood);
      $("#movies_icon").click(buildPage.showMovies);

  },


buildHeader: function(){

    var buildHeader = $('<div id="header">');

    buildHeader
      .append('<img class="img_header_logo" src="assets/PNGs/My-Boro_Header.png">')
      .append('<a href="" id="sign_up"><img src="assets/PNGs/Sign_Up.png" class="img_new_session"></a>')
      .append('<img src="assets/PNGs/Log_In.png" class="img_login_session">');

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

  hideSubHeader: function(){
    $("#subheader").hide();
  },

  showSignUpForm: function(event){
    event.preventDefault();
    $("#signUpForm").slideDown();
  },

  signUpNewUser: function(event){
    event.preventDefault();

    var form = $("form")
    var name = $("#user_name").val()
    var email = $("#user_email").val()
    var password = $("#user_password").val()
    var password_confirmation = $("#user_password_confirmation").val();

        $.ajax({
          type: 'POST',
          url: '/users',
          data: { user: {
                        name: name,
                        email: email,
                        password: password,
                        password_confirmation: password_confirmation}
                }
          }).done(function(response){
            form.after(response.message);
            form.fadeOut();
          });
  },

  showWeather: function(event){
    var container = $("#weather_icon.category_container");

    var location = "Brooklyn";

    $.ajax({
          type: 'GET',
          url: "/weather/", /* Weather.initialize(params[:location])-- get 'weather/:location => "weather#show*/
          dataType: 'json',
          data: { location: location }
          }).done(function(response){
            console.log(response.currentTemp)
            var temperature = response.currentTemp
            var humidity = response.currentHumidity
            var wind = response.currentWind
            var description = response.currentWeather
            var bundle = $('<div class="inner_information">').html("<p><strong>Current Temperature: </strong>"+temperature+"</p><p><strong>Humidity: </strong>"+humidity+"</p><p><strong>Wind: </strong>"+wind+"</p><p><strong>Info: </strong>"+description+"</p>");
            container.append(bundle);
          });
  },


    showNews: function(event){
    var container = $("#news_icon.category_container");
    var location = "Brooklyn";
    $.ajax({
        type: 'GET',
        url: "/news/",
        dataType: 'json',
        data: { location: location }
        }).done(function(response){
            var headlines = response.currentHeadlines;
            var urls = response.currentUrls;
            var myList = $('<div class="inner_information">');

            $.each(headlines, function(index, headline) {

                var story = $('<ul>').html('<strong>'+ headline + '</strong><a href="' + urls[index] + '" target="_blank">Read More</a></ul>');
                myList.append(story);
            });


          container.append(myList);

          });
  },


  showMovies: function(event){
    var container = $("#movies_icon.category_container");
    var location = "Brooklyn";
    $.ajax({
        type: 'GET',
        url: "/movies/",
        dataType: 'json',
        data: { location: location }
        }).done(function(response){
            var theaters = response.currentTheaters;
            var addresses = response.currentAddresses;
            var movies = response.currentMovies;
            var movies_times = response.currentMoviesTimes;
            var myList = $('<div class="inner_information">');
            debugger;
            $.each(theaters, function(index, theater) {

                var theater = $('<ul>').html('<strong>'+ theater + '</strong><p>' + addresses[index] + '</>');
                myList.append(theater);
            });

          container.append(myList);

          });
  },






  showFood: function(event){
    var container = $("#food_icon.category_container");
    var location = "Brooklyn"
    $.ajax({
          type: 'GET',
          url: "/restaurants/",
          dataType: 'json',
          data: { location: location }
          }).done(function(response){
          console.log(response.names);
        })
  },

  chooseBureau: function(){
    // HIDE BORO MAP AND (REVEAL && SCROLL UP WIDGETS)--BE AWARE OF TIMING HERE!
  }

};


$(document).ready(buildPage.onReady);
