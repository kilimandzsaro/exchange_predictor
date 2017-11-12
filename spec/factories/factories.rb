FactoryBot.define do
  factory :user, class: "User" do
    name                   "John Schaffer"
    email                  "#{('a'..'z').to_a.shuffle.join}@yahoo.com"
    password               "icedearth"
    password_confirmation  "icedearth"
  end
end
