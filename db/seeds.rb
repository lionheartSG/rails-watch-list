require "json"
require "rest-client"
require 'open-uri'
require 'pry-byebug'

# TODO: Write a seed to insert 10 posts in the database fetched from the Hacker News API.


puts "Creating new movies"

# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

# List.create(name: "Horror", picture_url: 'https://pbblogassets.s3.amazonaws.com/uploads/2021/10/22110846/Horror-Film-Tutorials.jpg')
# List.create(name: "Comedy", picture_url: 'https://shrm-res.cloudinary.com/image/upload/c_crop,h_665,w_1183,x_0,y_0/w_auto:100,w_1200,q_35,f_auto/v1/People%20Managers/Comedy_photo_k1fdgd.jpg')
# List.create(name: "Love", picture_url: 'https://images.squarespace-cdn.com/content/v1/5519ab2ee4b02a4410b6a7c6/1573572780880-TNGN7R4EX4N141SBXP50/beautiful-hands-heart-5390.jpg')
# List.create(name: "Action", picture_url: 'https://assets3.thrillist.com/v1/image/2803089/1200x600/scale;')
# List.create(name: "Top 10", picture_url: 'https://bicontent.businessinsurance.com/09afdb7d-bbe5-4a7c-8acf-21bf8a69c000.jpg')
# List.create(name: "Drama", picture_url: 'https://dramakids.com/wp-content/uploads/2022/03/Value-of-Drama.jpg')

# response = RestClient.get 'https://tmdb.lewagon.com/movie/top_rated'
# movies = JSON.parse(response).first(10)

# movies.each do |movie|
#   Movie.create(title: movie['title'], overview: movie['overview'], poster_url: movie['poster_path'], rating: movie['vote_average'])
# end

url = 'https://tmdb.lewagon.com/movie/top_rated'
movie_url = URI.open(url).read
movies = JSON.parse(movie_url).first(10)
movies[1][1].each do |movie|
  Movie.create(title: movie['title'], overview: movie['overview'], poster_url: movie['poster_path'], rating: movie['vote_average'])
end
