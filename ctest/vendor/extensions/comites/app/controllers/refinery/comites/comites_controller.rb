module Refinery
  module Comites
    class ComitesController < ::ApplicationController

      before_filter :find_all_comites
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @comite in the line below:
        present(@page)
      end

      def show
        @comite = Comite.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @comite in the line below:
        present(@page)
      end

    protected

      def find_all_comites
        @comites = Comite.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/comites").first
      end

    end
  end
end
