# frozen_string_literal: true

module Admin
  class SubscriptionProductsController < Admin::BaseController
    before_action :set_admin_subscription_product, only: %i[show edit update destroy]
    before_action :add_breadcrumbs


    # GET /admin/subscription_products
    # GET /admin/subscription_products.json
    def index
      @admin_subscription_products = Admin::SubscriptionProduct.all
    end

    # GET /admin/subscription_products/1
    # GET /admin/subscription_products/1.json
    def show; end

    # GET /admin/subscription_products/new
    def new
      @admin_subscription_product = Admin::SubscriptionProduct.new
    end

    # GET /admin/subscription_products/1/edit
    def edit; end

    # POST /admin/subscription_products
    # POST /admin/subscription_products.json
    def create
      @admin_subscription_product = Admin::SubscriptionProduct.new(allowed_params)

      respond_to do |format|
        if @admin_subscription_product.save
          format.html { redirect_to @admin_subscription_product, notice: 'Subscription product was successfully created.' }
          format.json { render :show, status: :created, location: @admin_subscription_product }
        else
          format.html { render :new }
          format.json { render json: @admin_subscription_product.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/subscription_products/1
    # PATCH/PUT /admin/subscription_products/1.json
    def update
      respond_to do |format|
        if @admin_subscription_product.update(allowed_params)
          format.html { redirect_to @admin_subscription_product, notice: 'Subscription product was successfully updated.' }
          format.json { render :show, status: :ok, location: @admin_subscription_product }
        else
          format.html { render :edit }
          format.json { render json: @admin_subscription_product.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/subscription_products/1
    # DELETE /admin/subscription_products/1.json
    def destroy
      @admin_subscription_product.destroy
      respond_to do |format|
        format.html { redirect_to admin_subscription_products_url, notice: 'Subscription product was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_admin_subscription_product
      @admin_subscription_product = Admin::SubscriptionProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def allowed_params
      params.require(:admin_subscription_product).permit(:lock_version, :name, :description, :curriculum_vitae_limited,
                                                         :curriculum_vitae_limit, :opportunity_limited,
                                                         :opportunity_limit, :organisation_limited, :organisation_limit,
                                                         :person_limited, :person_limit)
    end

    def add_breadcrumbs
      @breadcrumbs << { label: I18n.t('activerecord.models.admin_subscription_products.other'), path: admin_subscription_products_path }
      @breadcrumbs << { label: @admin_subscription_product.name, path: @admin_subscription_product } if defined?(admin_subscription_product)
      @breadcrumbs << { label: I18n.t('views.general.edit'), path: edit_admin_subscription_product_path(admin_subscription_product) } if %w[edit update].include?(action_name)
      @breadcrumbs << { label: I18n.t('views.general.new'), path: new_admin_subscription_product_path } if %w[new create].include?(action_name)
    end

  end
end
