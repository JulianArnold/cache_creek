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

require 'rails_helper'

RSpec.describe Opportunity, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
