# == Schema Information
#
# Table name: curriculum_vitaes
#
#  id                  :integer          not null, primary key
#  name                :string
#  description         :text
#  upload_file_name    :string
#  upload_content_type :string
#  upload_file_size    :integer
#  upload_updated_at   :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'rails_helper'

RSpec.describe CurriculumVitae, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
