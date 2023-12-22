# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

5.times do
  artist = Artist.create(first_name: FFaker::NameRU.first_name,
                         last_name: FFaker::NameRU.last_name,
                         email: FFaker::Internet.email)
  7.times do
    artist.items.create( title: FFaker::Book.author,
                         description: FFaker::Book.author,
                         image_url: FFaker::Image.url)
  end
end


5.times do
  user = User.create(name: FFaker::NameRU.name, email: FFaker::Internet.email)
  5.times do
      user.posts.create(title: FFaker::Lorem.sentence(2),
                        body: FFaker::Lorem.paragraph(3))
  end
end
