
FactoryGirl.define do
  factory :comite, :class => Refinery::Comites::Comite do
    sequence(:nombre) { |n| "refinery#{n}" }
  end
end

