module Refinery
  module Comites
    module Admin
      class ComitesController < ::Refinery::AdminController

        crudify :'refinery/comites/comite',
                :title_attribute => 'nombre', :xhr_paging => true

      end
    end
  end
end
