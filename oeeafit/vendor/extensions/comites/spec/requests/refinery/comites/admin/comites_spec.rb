# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Comites" do
    describe "Admin" do
      describe "comites" do
        login_refinery_user

        describe "comites list" do
          before do
            FactoryGirl.create(:comite, :nombre => "UniqueTitleOne")
            FactoryGirl.create(:comite, :nombre => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.comites_admin_comites_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.comites_admin_comites_path

            click_link "Add New Comite"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Nombre", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Comites::Comite.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Nombre can't be blank")
              Refinery::Comites::Comite.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:comite, :nombre => "UniqueTitle") }

            it "should fail" do
              visit refinery.comites_admin_comites_path

              click_link "Add New Comite"

              fill_in "Nombre", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Comites::Comite.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:comite, :nombre => "A nombre") }

          it "should succeed" do
            visit refinery.comites_admin_comites_path

            within ".actions" do
              click_link "Edit this comite"
            end

            fill_in "Nombre", :with => "A different nombre"
            click_button "Save"

            page.should have_content("'A different nombre' was successfully updated.")
            page.should have_no_content("A nombre")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:comite, :nombre => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.comites_admin_comites_path

            click_link "Remove this comite forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Comites::Comite.count.should == 0
          end
        end

      end
    end
  end
end
