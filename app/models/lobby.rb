class Lobby < ActiveRecord::Base
  belongs_to :user

  def to_param
    id_str
  end
end
