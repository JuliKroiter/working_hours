FactoryBot.define do
  factory :restaurant do
    working_hours { Restaurant::DEFAULT_WORKING_HOURS }
  end
end
