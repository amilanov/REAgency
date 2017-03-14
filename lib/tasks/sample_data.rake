namespace :db do
  desc "Populate database with sample data"
  task populate: :environment do
    50.times do |n|
      User.create!(
        firstName: "User",
        lastName: "Name #{n}",
        username: "uname_test#{n}",
        address: "Address #{n}",
        email: "test_email#{n}@gmail.com",
        password: "foobar",
        password_confirmation: "foobar"
      )
    end
  end
end