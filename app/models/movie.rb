# == Schema Information
#
# Table name: movies
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  theater    :string(255)
#  address    :string(255)
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Movie < ActiveRecord::Base
      belongs_to :user
      end
