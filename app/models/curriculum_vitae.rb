# frozen_string_literal: true

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
#  user_id             :integer
#

class CurriculumVitae < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  has_attached_file :upload # ,
  # path: ':rails_root/tmp/files/:class/:attachment/:id/:filename',
  # url: ':rails_root/tmp/files/:class/:attachment/:id/:filename'
  # url: '/:class/:id/:filename'
  validates_attachment_content_type :upload, content_type: 'application/pdf'
  # validates_attachment_content_type :upload, content_type: /\A(application\/pdf)\z/

  # callbacks
  before_create :check_subscription_product_limit

  private

  def check_subscription_product_limit
    product = User.current&.admin_subscription_product
    if product.nil?
      errors.add(:base, "You don't have a subscription")
      Rails.logger.warn "User #{User.current_id} tried to create a CV but had no subscription_product."
      return false
    end
    # return true if !product.curriculum_vitae_limited # truthy
    return true unless product.curriculum_vitae_limited # falsey
    if product.curriculum_vitae_limit <= CurriculumVitae.where(user_id: User.current_id).count
      # only runs when the person is over their limit
      errors.add(:base, 'You have exceeded the limit for your subscription.  Your CV was not saved.')
      return false
    end
    true
  end
end
