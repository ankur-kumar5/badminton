FactoryBot.define do
  factory :player do
    name { "Player #{SecureRandom.hex(4)}" }
  end
end
