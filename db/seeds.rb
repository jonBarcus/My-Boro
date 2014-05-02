user_1 = User.create(name: "John Smith", email: "john@smith.com", password: "password123", password_confirmation: "password123")
user_2 = User.create(name: "Dan Williams", email: "dan@williams.com", password: "password456", password_confirmation: "password456")
admin_1 = User.create(name: "Admin", email: "admin@admin.com", password: "1", password_confirmation: "1", admin_status: 1)

user_1.movies.create(theater: "AMC Loews Orpheum 7", address: "1538 3rd Ave, New York, NY 10028" , title: "The Other Woman")
Movie.create(theater: "Williamsburg Cinemas", address: "217 Grand St, Brooklyn, NY 11211", title: "The Amazing Spider-Man 2")
user_2.movies.create(theater: "College Point Multiplex Cinemas", address: "28-55 Ulmer St, New York, NY 11354", title: "The Grand Budapest Hotel")

user_1.news_items.create(headline: "Alibaba I.P.O. May Unleash Global Fight Over Users", url: "http://www.nytimes.com/2014/05/01/technology/after-alibaba-ipo-us-web-giants-may-stop-ignoring-chinese-rivals.html?ref=business")
NewsItem.create(headline: "Facebook to Let Users Limit Data Revealed by Log-Ins", url: "http://www.nytimes.com/2014/05/01/technology/facebook-to-let-users-limit-data-revealed-by-log-ins.html?hpw&rref=technology")
user_2.news_items.create(headline: "Stars’ Newest Must-Have Item: The Clippers", url: "http://www.nytimes.com/2014/05/01/sports/basketball/suddenly-everyone-it-seems-wants-to-buy-the-clippers.html?")

user_1.restaurants.create(name: "J.G. Melon", address: "1291 3rd Ave, New York, NY 10021", rating: "4.0")
Restaurant.create(name: "Jimmy's Diner", address: "577 Union Ave, New York, NY 11211", rating: "4.3")
user_2.restaurants.create(name: "indiKitch", address: "25 W 23rd St, New York, NY 10010", rating: "4")

user_1.drinks.create(name: "Tom & Jerry's", address: "288 Elizabeth St, New York, NY 10012", rating: "3.8")
Drink.create(name: "Lillie's Union Square", address: "13 E 17th St, New York, NY 10003", rating: "4.0")
user_2.drinks.create(name: "Kinfolk Studios", address: "90 Wythe Ave, Brooklyn, NY 11211", rating: "4.5")
