class OpportunitiesController < ApplicationController
  before_action :set_opportunity, only: %i[show edit update destroy]
  before_action :set_variables, except: %i[index destroy]
  before_action :add_breadcrumbs

  # GET /opportunities
  # GET /opportunities.json
  def index
    @opportunities = findable_opportunities.order(updated_at: :desc).all
  end

  # GET /opportunities/1
  # GET /opportunities/1.json
  def show; end

  # GET /opportunities/new
  def new
    @opportunity = findable_opportunities.new
  end

  # GET /opportunities/1/edit
  def edit; end

  # POST /opportunities
  # POST /opportunities.json
  def create
    @opportunity = findable_opportunities.new(opportunity_params)

    respond_to do |format|
      if @opportunity.save
        format.html { redirect_to @opportunity, notice: I18n.t('controllers.opportunities.create.success') }
        format.json { render :show, status: :created, location: @opportunity }
      else
        format.html { render :new }
        format.json { render json: @opportunity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opportunities/1
  # PATCH/PUT /opportunities/1.json
  def update
    respond_to do |format|
      if @opportunity.update(opportunity_params)
        format.html { redirect_to @opportunity, notice: I18n.t('controllers.opportunities.update.success') }
        format.json { render :show, status: :ok, location: @opportunity }
      else
        format.html { render :edit }
        format.json { render json: @opportunity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opportunities/1
  # DELETE /opportunities/1.json
  def destroy
    @opportunity.destroy
    respond_to do |format|
      format.html { redirect_to opportunities_url, notice: I18n.t('controllers.opportunities.destroy.success') }
      format.json { head :no_content }
    end
  end

  private

  # Returns an Active Record relation (a collection) of Opportunities, based on the user's permission.
  def findable_opportunities
    if current_user.admin_access
      Opportunity
    else
      current_user.opportunities
    end
  end

  def set_opportunity
    @opportunity = findable_opportunities.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def opportunity_params
    params.require(:opportunity).permit(:organisation_id, :person_id, :job_title, :job_description, :category)
  end

  def set_variables
    owner = @opportunity&.user || current_user
    @organisations = owner.organisations.order(:name)
    @people = owner.people.order(:last_name, :first_name)
  end

  def add_breadcrumbs
    @breadcrumbs << { label: I18n.t('activerecord.models.opportunities.other'), path: opportunities_path }
    @breadcrumbs << { label: @opportunity.job_title, path: @opportunity } if defined?(@opportunity)
    @breadcrumbs << { label: I18n.t('views.general.edit'), path: edit_opportunity_path(@opportunity) } if %w[edit update].include?(action_name)
    @breadcrumbs << { label: I18n.t('views.general.new'), path: new_opportunity_path } if %w[new create].include?(action_name)
  end
end
