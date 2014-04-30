# == Schema Information
#
# Table name: restaurants
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string(255)
#  address    :string(255)
#  rating     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Restaurant < ActiveRecord::Base
    belongs_to :user
end
