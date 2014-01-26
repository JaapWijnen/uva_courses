namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    fill_lists
  end
end

def make_users
  admin = User.create!(name: "Example User",
                         email: "example@railstutorial.org",
                         password: "foobar",
                         password_confirmation: "foobar",
                         admin: true)
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password)
  end
end

def fill_lists
  user = User.first
  10.times do |n|
    user.shopping_cart_items.create!(user_id: user.id, course_id: n+1)
    user.currently_taking_items.create!(user_id: user.id, course_id: n+21)
  end
end