# == Schema Information
#
# Table name: organisations
#
#  id             :integer          not null, primary key
#  name           :string
#  postal_address :text
#  phone          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#

class Organisation < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :phone, format: /\A[\d(\+][\d\()\-\ ]{6,20}\z/,
            allow_blank: true
  has_many :people
  has_many :opportunities
  belongs_to :user
end
