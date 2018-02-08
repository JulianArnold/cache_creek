# == Schema Information
#
# Table name: people
#
#  id                   :integer          not null, primary key
#  first_name           :string
#  last_name            :string
#  email                :string
#  phone                :string
#  organisation_id      :integer
#  linkedin_profile_url :string
#  next_contact_on      :date
#  source_of_contact    :string
#  cv_sent_on           :date
#  cv_version           :string
#  status               :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Person < ActiveRecord::Base
  STATUSES = ['New', 'Not Interested', 'Active', 'Dormant', 'Closed'].freeze
  LABELS_FOR_STATUSES = { new: 'primary', not_interested: 'danger', active: 'success', dormant: 'warning', closed: 'default' }

  belongs_to :organisation
  has_many :opportunities
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :organisation_id, presence: true
  validates :status, presence: true, inclusion: { in: STATUSES }

  def full_name
    first_name + ' ' + last_name
  end
end
