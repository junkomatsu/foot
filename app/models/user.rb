class User < ActiveRecord::Base
  has_many :units
  has_one :lobby

  def to_param
    id_str
  end  
end
