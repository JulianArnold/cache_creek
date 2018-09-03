# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'julian.arnold123@gmail.com'
  layout 'mailer'
end
