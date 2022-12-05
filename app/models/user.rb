# typed: false
# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email           (email) UNIQUE
#  index_users_on_id              (id) UNIQUE
#  index_users_on_name_and_email  (name,email) UNIQUE
#
class User < ApplicationRecord
  has_many :posts, dependent: :delete_all
  has_many :votes, dependent: :delete_all
  has_many :polls, dependent: :delete_all


  validates :name,
            length: { minimum: 3, maximum: 200 }

  validates :email,
            format: { with: /(.+)@(.+)/  },
            length: { minimum: 4, maximum: 254 }
end
