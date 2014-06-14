class User < ActiveRecord::Base

  has_one :profile, dependent: :destroy #nullify
  has_many :comments

  has_and_belongs_to_many :books

  accepts_nested_attributes_for :profile

  #Validaciones

  validates :last_name, :email, presence: true

  def self.ordenado_por_nombre
    order('name ASC')
  end

  def self.authenticate(email, password)
    u = User.where(email: email).first
    
    if u.nil?
      return nil 
    elsif u.password != password
      return nil
    else
      return u
    end
  end

  def nombre_completo
    [name, last_name].join(" ")
  end


end