require "rails_helper"
require "ostruct"

describe User do

  auth_new_user = OpenStruct.new({
      "provider"=>"linkedin",
      "uid"=>"xyz123",
      "info"=> OpenStruct.new({
          "name"=>"John Doe",
          "email"=>"john@doe.com",
          "first_name"=>"John",
          "last_name"=>"Doe",
          "image"=> "http://m.c.lnkd.licdn.com/mpr/mprx/0_aBcD...",
          "headline"=> "Senior Developer, Hammertech",
          "urls"=> OpenStruct.new({
              "public_profile"=>"http://www.linkedin.com/in/johndoe"
          })
      })
  })

  auth_existing_user = OpenStruct.new({
      "provider"=>"linkedin",
      "uid"=>"AbC123",
      "info"=> OpenStruct.new({
          "name"=>"John Doe",
          "email"=>"john@doe.com",
          "first_name"=>"John",
          "last_name"=>"Doe",
          "image"=> "http://m.c.lnkd.licdn.com/mpr/mprx/0_aBcD...",
          "headline"=> "Senior Developer, Hammertech",
          "urls"=> OpenStruct.new({
              "public_profile"=>"http://www.linkedin.com/in/johndoe"
          })
      })
  })

  it { should validate_uniqueness_of(:email) }
  it { should ensure_length_of(:twitter_handle).is_at_most(15) }

  describe "specialties" do
    it "should allow no more than 5 specialties" do
      u = User.from_omniauth(auth_new_user)
      u.specialty_list.add("1, 2, 3, 4, 5", parse: true)
      u.save

      expect(u.valid?).to be(true)
      u.specialty_list.add("6")
      u.save

      expect(u.valid?).to be(false)
    end
  end

  describe "from_omniauth" do
    context "for new user" do
      it "should copy data from linkedin" do
        u = User.from_omniauth(auth_new_user)

        expect(u.provider).to eq("linkedin")
        expect(u.uid).to eq("xyz123")
        expect(u.email).to eq("john@doe.com")
        expect(u.encrypted_password).to_not be_nil

        expect(u.first_name).to eq("John")
        expect(u.last_name).to eq("Doe")
        expect(u.headline).to eq("Senior Developer, Hammertech")
        expect(u.profile_url).to eq("http://www.linkedin.com/in/johndoe")
        expect(u.profile_image).to eq("http://m.c.lnkd.licdn.com/mpr/mprx/0_aBcD...")
      end
    end

    context "for existing user" do
      let!(:user) { create :user }

      it "should not overwrite an existing user's data from linkedin" do
        user.email = "new.email@gmail.com"
        user.headline = "Updating to a new headline"
        user.save

        u = User.from_omniauth(auth_existing_user)

        expect(u.provider).to eq("linkedin")
        expect(u.uid).to eq("AbC123")
        expect(u.email).to eq("new.email@gmail.com")
        expect(u.encrypted_password).to_not be_nil

        expect(u.first_name).to eq("John")
        expect(u.last_name).to eq("Doe")
        expect(u.headline).to eq("Updating to a new headline")
        expect(u.profile_url).to eq("http://www.linkedin.com/in/johndoe")
        expect(u.profile_image).to eq("http://www.linkedin.com/in/image")
      end
    end
  end

end