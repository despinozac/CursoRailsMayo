class User < ActiveRecord::Base

  has_one :profile, dependent: :destroy #nullify
  has_many :comments

  accepts_nested_attributes_for :profile

  def self.ordenado_por_nombre
    order('name ASC')
  end

  def nombre_completo
    [name, last_name].join(" ")
  end
end