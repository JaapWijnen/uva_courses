namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    fill_lists
  end
end

#Populate the database with fake users
def make_users
  #Create an admin user
  admin = User.create!(name: "Admin",
                         email: "admin@uva.nl",
                         password: "foobar",
                         password_confirmation: "foobar",
                         admin: true)
  #Create 99 normal users
  99.times do |n|
    name  = Faker::Name.name
    email = "student-#{n+1}@uva.nl"
    password  = "password"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password)
  end
end

def fill_lists
  #Add courses to fake user's lists
  user = User.first
  10.times do |n|
    user.list_items.create!(user_id: user.id, 
                            course_id: n+1, 
                            list_type: ListItem.shopping_cart)
    user.list_items.create!(user_id: user.id, 
                            course_id: n+21, 
                            list_type: ListItem.currently_taking)
  end
end