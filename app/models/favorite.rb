# == Schema Information
#
# Table name: favorites
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  url         :string(255)
#  category_id :integer
#

class Favorite < ActiveRecord::Base
    belongs_to :categories
    has_many :users
end
