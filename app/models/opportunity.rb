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
#

class Opportunity < ActiveRecord::Base
  belongs_to :organisation
  belongs_to :person
  validates :organisation_id
  validates :person_id
  validates :job_title
  validates :job_description
end
