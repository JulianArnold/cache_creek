# frozen_string_literal: true

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

require 'rails_helper'

RSpec.describe Organisation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
