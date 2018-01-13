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

require 'rails_helper'

RSpec.describe Person, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
