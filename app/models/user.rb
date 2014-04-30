# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  admin_status    :integer          default(0)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#


class User < ActiveRecord::Base
      has_many :movies
      has_many :drinks
      has_many :restaurants
      has_many :news_items
end
