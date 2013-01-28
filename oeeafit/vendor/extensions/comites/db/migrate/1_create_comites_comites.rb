class CreateComitesComites < ActiveRecord::Migration

  def up
    create_table :refinery_comites do |t|
      t.string :nombre
      t.string :carrera
      t.integer :logo_id
      t.text :descripcion
      t.string :correo
      t.string :facebook
      t.string :twitter
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-comites"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/comites/comites"})
    end

    drop_table :refinery_comites

  end

end
