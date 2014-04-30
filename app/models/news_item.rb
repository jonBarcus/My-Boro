# == Schema Information
#
# Table name: news_items
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  category_type_id :integer
#  headline         :string(255)
#  url              :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class NewsItem < ActiveRecord::Base

      belongs_to :user
end
