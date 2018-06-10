# == Schema Information
#
# Table name: opportunities
#
#  id              :integer          not null, primary key
#  organisation_id :integer
#  person_id       :integer
#  job_title       :string
#  job_description :text
#  category        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#

class Opportunity < ActiveRecord::Base

  belongs_to :organisation
  belongs_to :person
  belongs_to :user

  validates :organisation_id, presence: true
  validates :person_id, presence: true
  validates :job_title, presence: true
  validates :job_description, presence: true
  validate :match_organisation_to_person

  def match_organisation_to_person
    errors.add(:organisation_id, 'person unmatched with organisation') unless
         organisation_id == person.organisation_id
  end
end
