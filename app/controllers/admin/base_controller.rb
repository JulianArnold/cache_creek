# frozen_string_literal: true

module Admin
  class BaseController < ::ApplicationController
    before_action :admin_access_required
  end
end
