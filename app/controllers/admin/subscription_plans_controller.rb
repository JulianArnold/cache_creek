# frozen_string_literal: true

module Admin
  class SubscriptionPlansController < Admin::BaseController
    before_action :set_admin_subscription_plan, only: %i[show edit update destroy]
    before_action :set_variables, except: %i[index destroy]
    before_action :add_breadcrumbs

    # GET /admin/subscription_plans
    # GET /admin/subscription_plans.json
    def index
      @admin_subscription_plans = Admin::SubscriptionPlan.all
    end

    # GET /admin/subscription_plans/1
    # GET /admin/subscription_plans/1.json
    def show; end

    # GET /admin/subscription_plans/new
    def new
      @admin_subscription_plan = Admin::SubscriptionPlan.new(subscription_product_id: params[:subscription_product_id])
    end

    # GET /admin/subscription_plans/1/edit
    def edit; end

    # POST /admin/subscription_plans
    # POST /admin/subscription_plans.json
    def create
      @admin_subscription_plan = Admin::SubscriptionPlan.new(admin_subscription_plan_params)

      respond_to do |format|
        if @admin_subscription_plan.save
          format.html { redirect_to @admin_subscription_plan, notice: 'Subscription plan was successfully created.' }
          format.json { render :show, status: :created, location: @admin_subscription_plan }
        else
          format.html { render :new }
          format.json { render json: @admin_subscription_plan.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/subscription_plans/1
    # PATCH/PUT /admin/subscription_plans/1.json
    def update
      respond_to do |format|
        if @admin_subscription_plan.update(admin_subscription_plan_params)
          format.html { redirect_to @admin_subscription_plan, notice: 'Subscription plan was successfully updated.' }
          format.json { render :show, status: :ok, location: @admin_subscription_plan }
        else
          format.html { render :edit }
          format.json { render json: @admin_subscription_plan.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/subscription_plans/1
    # DELETE /admin/subscription_plans/1.json
    def destroy
      if @admin_subscription_plan.destroy
        flash[:notice] = 'Subscription plan was successfully destroyed.'
      else
        flash[:error] = "Sorry your subscription plan couldn't be deleted"
      end
      respond_to do |format|
        format.html { redirect_to admin_subscription_plans_url }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_admin_subscription_plan
      @admin_subscription_plan = Admin::SubscriptionPlan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_subscription_plan_params
      params.require(:admin_subscription_plan).permit(:name, :price_cent, :billing_frequency_months, :currency, :stripe_uuid, :trial_period_days, :active, :subscription_product_id)
    end

    def set_variables
      @admin_subscription_products = Admin::SubscriptionProduct.all_in_order
    end

    def add_breadcrumbs
      @breadcrumbs << { label: I18n.t('activerecord.models.admin_subscription_plans.other'), path: admin_subscription_plans_path }
      @breadcrumbs << { label: @admin_subscription_plan.name, path: @admin_subscription_plan } if defined?(admin_subscription_plan)
      @breadcrumbs << { label: I18n.t('views.general.edit'), path: edit_admin_subscription_plan_path(admin_subscription_plan) } if %w[edit update].include?(action_name)
      @breadcrumbs << { label: I18n.t('views.general.new'), path: new_admin_subscription_plan_path } if %w[new create].include?(action_name)
    end
  end
end
