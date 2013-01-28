module Refinery
  module Comites
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Comites

      engine_name :refinery_comites

      initializer "register refinerycms_comites plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "comites"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.comites_admin_comites_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/comites/comite',
            :title => 'nombre'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Comites)
      end
    end
  end
end
