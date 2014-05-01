var current_user_zip;
var current_user_city;

var maps;
var map1;
var map2;
var map3;
var map4;
var map5;
var map6;

var buildPage = {

onReady: function(){
    buildPage.buildHeader();
    buildPage.buildSubHeader();
    buildPage.buildForms();
    buildPage.buildMaps();
    buildPage.buildCategories();
    $("#sign_up").click(buildPage.showSignUpForm);
    $("#log_in").click(buildPage.showLogInForm);
    $("form").on("submit", buildPage.signUpNewUser);
    $("#form2").on("submit", buildPage.logInUser);
    $("#weather_icon").click(buildPage.showWeather);
    $("#news_icon").click(buildPage.showNews);
    $("#food_icon").click(buildPage.showFood);
    $("#movies_icon").click(buildPage.showMovies);
    $("#drink_icon").click(buildPage.showDrink);
    $("#subway_icon").click(buildPage.showMTA);
  },


buildHeader: function(){

    var buildHeader = $('<div id="header">');

    buildHeader
      .append('<img class="img_header_logo" src="assets/PNGs/My-Boro_Header.png">')
      .append('<a href="" id="sign_up"><img src="assets/PNGs/Sign_Up.png" class="img_new_session"></a>')
      .append('<a href="" id="log_in"><img src="assets/PNGs/Log_In.png" class="img_login_session">');

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
    $("#subheader").hide();

  },


  buildForms: function(){
    var form = $("#signUpForm");
    var formTwo = $("#loginForm");
    $("body").append("<div id='main_container'>");
    $("#main_container").append(form);
    $("#main_container").append(formTwo);
    $("#new_user").hide();
    $("#form2").hide();
  },

  buildMaps: function(){
    $.ajax({
    type: 'GET',
    url: '/session',
    dataType: 'json'
  }).done(function(data){
    current_user_zip = data.current_user_zipcode;
    current_user_city = data.current_user_city;
    var map6 = $('<div class="category_container_boro" id="use_location_image" name="'+current_user_zip+'">');
    console.log(current_user_city);
    console.log(current_user_zip);

    maps = $('<div id="maps">');

    map1 = $('<div class="category_container_boro" id="manhattan_map" name="Manhattan">');
    map1.append('<img src="assets/PNGs/Manhattan.png" class="boro_image">');

    map2 = $('<div class="category_container_boro" id="brooklyn_map" name="Brooklyn">');
    map2.append('<img src="assets/PNGs/Brooklyn.png" class="boro_image">');

    map3 = $('<div class="category_container_boro" id="queens_map" name="Queens">');
    map3.append('<img src="assets/PNGs/Queens.png" class="boro_image_queens">');

    map4 = $('<div class="category_container_boro" id="the_bronx_map" name="Bronx">');
    map4.append('<img src="assets/PNGs/The_Bronx.png" class="boro_image">');

    map5 = $('<div class="category_container_boro" id="staten_island_map" name="Staten Island">');
    map5.append('<img src="assets/PNGs/Staten_Island.png" class="boro_image">');

    map6.append('<img src="assets/PNGs/Use_current_location.png" class="boro_image">');

    maps.prepend(map1, map2, map3, map4, map5, map6);

    $("#main_container").append(maps);
  }).done(function(){
      $(".category_container_boro").click(buildPage.chooseBorough);
  });

  },

buildCategories: function(){

    var categories = $('<div id="categories">');

    var category1 = $('<div class="category_container" id="weather_icon">');
    category1.append('<img src="assets/PNGs/Weather_SUNNY_CLOUDY.png" class="category_image">');

    var category2 = $('<div class="category_container" id="subway_icon">');
    category2.append('<img src="assets/PNGs/Subway.png" class="category_image">');

    var category3 = $('<div class="category_container" id="movies_icon">');
    category3.append('<img src="assets/PNGs/Movies.png" class="category_image">');

    var category4 = $("<div class='category_container' id='drink_icon'>");
    category4.append('<img src="assets/PNGs/Drinks.png" class="category_image">');

    var category5 = $("<div class='category_container' id='news_icon'>");
    category5.append('<img src="assets/PNGs/News.png" class="category_image">');

    var category6 = $('<div class="category_container" id="food_icon">');
    category6.append('<img src="assets/PNGs/Food.png" class="category_image">');

    categories.prepend(category1, category2, category3, category4, category5, category6);
    $("#main_container").append(categories);
    categories.hide();

  },

  showSignUpForm: function(event){
    event.preventDefault();
    $("#signUpForm").slideDown();
  },

  showLogInForm: function(event){
    event.preventDefault();
    $("#loginForm").slideDown();
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

  logInUser: function(event){
    // debugger
    event.preventDefault();

    var form = $("form2");
    var email = $("#email").val();
    var password = $("#password").val();

    $.ajax({
          type: 'POST',
          url: '/session',
          dataType: 'json',
          data: { email: email, password: password }
        }).done(function(response){
          $("#loginForm").after(response.message);
          form.fadeOut();
        })
  },

  showWeather: function(event){
    var container = $("#weather_icon.category_container");

    var location = current_user_city;

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
    var location = current_user_city;
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

                var story = $('<ul>').html('<strong>'+ headline + ' </strong><a href="' + urls[index] + '" target="_blank">Read More</a><button class="news_item" name="news_item' +[index]+ '">Add to Favorites!</button></ul>');
                myList.append(story);
            });

          container.append(myList);

          });
  },

  showMovies: function(event){
    var container = $("#movies_icon.category_container");

    var location = current_user_zip;

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
            $.each(theaters, function(index, theater) {

                var theater = $('<ul>').html('<strong>'+ theater + '</strong><p>' + addresses[index] + '</>');
                myList.append(theater);
                var movie_one = $('<ul>').html(movies[index][0])
                var one_times_first = $('<ul>').html(movies_times[index][0][0])
                movie_one.append(one_times_first)
                if (!(movies_times[index][0][1] === undefined)) {
                var one_times_second = $('<ul>').html(movies_times[index][0][1])
                movie_one.append(one_times_second)
                }
                if (!(movies_times[index][0][2] == undefined)) {
                var one_times_third = $('<ul>').html(movies_times[index][0][2])
                movie_one.append(one_times_third)
                }
                myList.append(movie_one)
                if (!(movies[index][1] === undefined)) {

                  var movie_two = $('<ul>').html(movies[index][1])
                  var two_times_first = $('<ul>').html(movies_times[index][0][0])
                  var two_times_second = $('<ul>').html(movies_times[index][0][1])
                  var two_times_third = $('<ul>').html(movies_times[index][0][2])
                  movie_two.append(two_times_first)
                  movie_two.append(two_times_second)
                  movie_two.append(two_times_third)
                  myList.append(movie_two)
                }
                // var movie_three = $('<ul>').html(movies[index][2])
                // var three_times_first = $('<ul>').html(movies_times[index][0][0])
                // var three_times_second = $('<ul>').html(movies_times[index][0][1])
                // var three_times_third = $('<ul>').html(movies_times[index][0][2])

                // movie_three.append(three_times_first)
                // movie_three.append(three_times_second)
                // movie_three.append(three_times_third)
                // myList.append(movie_three)
            });

            container.append(myList);

          });
  },

  showFood: function(event){
    var container = $("#food_icon.category_container");
    var inner = $('<div class="inner_information">');
    container.append(inner);

    var location = current_user_zip;

    $.ajax({
          type: 'GET',
          url: "/restaurants/",
          dataType: 'json',
          data: { location: location }
          }).done(function(response){
            var i = 0;
            var nameArray = response.names;
            var addressArray = response.addresses;
            var ratingsArray = response.ratings;
            for(i = 0; i < response.names.length; i++){
              var restaurantCard = $("<div class='restaurant-card'><h3>Restaurants</h3><p><strong>Name: </strong>"+nameArray[i]+"</p><p><strong>Address: </strong>" + addressArray[i] + "</p><p><strong>Rating: </strong>" + ratingsArray[i] + "</p></div>");
              var faveButton = $('<button class="restaurant" name="restaurant"' +[i]+ '>Add to Favorites!</button>');
              faveButton.on("click", buildPage.addFavorite);
              restaurantCard.append(faveButton);
              inner.append(restaurantCard);
            }

        })
  },

  // click event to handle adding restaurant as a favorite in the db via ajax
  // removing button and displaying restaurant added
  addFavorite: function(event) {
    console.log("clicked favebutton");
  },

    showDrink: function(event){
    var container = $("#drink_icon.category_container");
    var inner = $('<div class="inner_information">');
    container.append(inner);
    var location = current_user_city;
    $.ajax({
          type: 'GET',
          url: "/drinks/",
          dataType: 'json',
          data: { location: location }
          }).done(function(response){
          console.log(response.names);
          var i = 0;
          var nameArray = response.names;
          var addressArray = response.addresses;
          var ratingsArray = response.ratings;
          for(i = 0; i < response.names.length; i++){
            var drinkCollection = $("<div class='restaurant-card'><h3>Drinks</h3><p><strong>Name: </strong>" + nameArray[i] + "</p><p><strong>Address: </strong>" + addressArray[i] + "</p><p><strong>Rating: </strong>"+ratingsArray[i] +"</p><button class='restaurant' name='restaurant" + [i] + "''>Add to Favorites!</button>");
            inner.append(drinkCollection);
          }
        })
    },

    showMTA: function(event) {
      var location = current_user_city;
      $.ajax({
        type: 'GET',
        url: "/mta/",
        dataType: 'json',
        data: { location: location}
      }).done(buildPage.assembleSubwayInfo);
    },

    assembleSubwayInfo: function(response){
        var container = $("#subway_icon");
        var inner = $('<div class="inner_information">');
        container.append(inner);
        var line_array = response.current_lines;
        var status_array = response.current_status;
        var myLine = $("<div>");
        for (i = 0; i < response.current_lines.length; i++){
          var lines = $("<div class='subway-card'><h3>"+line_array[i]+"</h3><p>"+status_array[i]+"</p>");
          myLine.append(lines);
        }
        inner.append(myLine);
      },

  chooseBorough: function(){
    var brooklyn_zips = [11212, 11213, 11234, 11236, 11209, 11214, 11203, 11210, 11225, 11226];
    var queens_zips = [11361, 11362, 11366, 11367, 11423, 11432, 11433, 11693, 11694, 11695, 11415, 11416, 11417];
    var statenIsland_zips = [10314, 10307, 10308, 10309, 10302, 10303];
    var bronx_zips = [10457, 10467, 10455, 10469, 10472, 10462, 10464, 10466];
    var manhattan_zips = [10001, 10011, 10018, 10012, 10013, 10014, 10005, 10006, 10021, 10028, 10044, 10128, 10023, 10024, 10025];

    current_user_city = $(this).attr("name");

    console.log(current_user_zip);
    console.log(current_user_city);
    if(current_user_city === "Brooklyn"){ current_user_zip = brooklyn_zips[Math.floor(Math.random() * brooklyn_zips.length)]}
    else if(current_user_city === "Staten Island"){current_user_zip = statenIsland_zips[Math.floor(Math.random() * statenIsland_zips.length)]}
    else if(current_user_city === "Queens"){current_user_zip = queens_zips[Math.floor(Math.random() * queens_zips.length)]}
    else if(current_user_city === "Bronx"){current_user_zip = bronx_zips[Math.floor(Math.random() * bronx_zips.length)]}
    else if(current_user_city === "Manhattan"){current_user_zip = manhattan_zips[Math.floor(Math.random() * manhattan_zips.length)]}

    $("#categories").slideDown();
    $("#maps").slideUp();
    $("#subheader").show();

  },
};


$(document).ready(buildPage.onReady);
