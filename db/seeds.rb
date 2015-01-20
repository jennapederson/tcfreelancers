# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
100.times do |x|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  for_hire = x.odd? ? true : false

  User.create(:email => "#{first_name}.#{last_name}@example.com", :password => '12341234', :first_name => first_name, :last_name => last_name, :headline => "Freelancer", :profile_url => "https://www.linkedin.com/in/#{first_name}#{last_name}", :profile_image => "https://media.licdn.com/mpr/mprx/0_IcAN_IXT2gHer0BMWl-w_eqymV7ktybMdrLI_Wv3l0UvS4KJbA3ZDd3f8NfsAUQvoq1EuaIgoIlx", :available_for_hire => for_hire, :twitter_handle => first_name + last_name, :description => Faker::Lorem.paragraph(sentence_count = 3))
end