require 'rails_helper'

describe User do
  it { should validate_uniqueness_of(:email).on(:create) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:google_id) }
  it { should validate_presence_of(:token) }
  it { should validate_presence_of(:oauth_expires_at) }

  context "Update or create user given valid user info" do
    it "it is vaild" do
      user_info = stub_omniauth

      User.create_or_update(user_info)
      user = User.first

      expect(user.google_id).to eq user_info[:uid]
      expect(user.email).to eq user_info[:info][:email]
      expect(user.first_name).to eq user_info[:info][:first_name]
      expect(user.last_name).to eq user_info[:info][:last_name]
      expect(user.token).to eq user_info[:credentials][:token]
      expect(user.oauth_expires_at).to eq user_info[:credentials][:expires_at]
    end
  end
end
