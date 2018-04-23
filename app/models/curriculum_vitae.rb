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

class CurriculumVitae < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_attached_file :upload
  validates_attachment_content_type :upload, content_type: /\A(application\/pdf)\z/
end
