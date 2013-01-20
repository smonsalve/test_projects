require 'spec_helper'

module Refinery
  module Comites
    describe Comite do
      describe "validations" do
        subject do
          FactoryGirl.create(:comite,
          :nombre => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:nombre) { should == "Refinery CMS" }
      end
    end
  end
end
