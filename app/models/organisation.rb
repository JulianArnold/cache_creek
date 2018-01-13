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
#

class Organisation < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :people
end
