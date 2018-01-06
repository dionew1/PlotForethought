FactoryBot.define do
  factory :user do
    first_name { Faker::HitchhikersGuideToTheGalaxy.character }
    last_name  { Faker::HitchhikersGuideToTheGalaxy.planet }
    token { Faker::Code.asin }
    oauth_expires_at { Faker::Time.forward(23, :morning) }
    email { Faker::Internet.email }
  end
end
