module Refinery
  module Comites
    class Comite < Refinery::Core::BaseModel
      self.table_name = 'refinery_comites'

      attr_accessible :nombre, :carrera, :logo_id, :descripcion, :correo, :facebook, :twitter, :position

      acts_as_indexed :fields => [:nombre, :carrera, :descripcion, :correo, :facebook, :twitter]

      validates :nombre, :presence => true, :uniqueness => true

      belongs_to :logo, :class_name => '::Refinery::Image'
    end
  end
end
