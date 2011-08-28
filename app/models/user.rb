class User < ActiveRecord::Base
  has_many :units

  def to_param
    id_str
  end  
end
