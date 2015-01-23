FactoryGirl.define do
  factory :user do
    password              'password'
    password_confirmation 'password'

    sequence(:email)      { |n| "email#{n}@email.com" }
    provider              'linkedin'
    uid                   'AbC123'
    first_name            'John'
    last_name             'Doe'
    headline              'headline'
    description           'description'
    profile_url           'http://www.linkedin.com/in/johndoe'
    profile_image         'http://www.linkedin.com/in/image'
  end
end