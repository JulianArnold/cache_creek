class OrganisationsController < ApplicationController
  before_action :set_organisation, only: %i[show edit update destroy]
  before_action :add_breadcrumbs

  # GET /organisations
  # GET /organisations.json
  def index
    @organisations = Organisation.order(name: :asc).all
  end

  # GET /organisations/1
  # GET /organisations/1.json
  def show; end

  # GET /organisations/new
  def new
    @organisation = Organisation.new
  end

  # GET /organisations/1/edit
  def edit; end

  # POST /organisations
  # POST /organisations.json
  def create
    @organisation = Organisation.new(organisation_params)

    respond_to do |format|
      if @organisation.save
        format.html { redirect_to @organisation, notice: 'Organisation was successfully created.' }
        format.json { render :show, status: :created, location: @organisation }
      else
        format.html { render :new }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organisations/1
  # PATCH/PUT /organisations/1.json
  def update
    respond_to do |format|
      if @organisation.update(organisation_params)
        format.html { redirect_to @organisation, notice: 'Organisation was successfully updated.' }
        format.json { render :show, status: :ok, location: @organisation }
      else
        format.html { render :edit }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organisations/1
  # DELETE /organisations/1.json
  def destroy
    @organisation.destroy
    respond_to do |format|
      format.html { redirect_to organisations_url, notice: 'Organisation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_organisation
    @organisation = Organisation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def organisation_params
    params.require(:organisation).permit(:name, :postal_address, :phone)
  end

  def add_breadcrumbs
    @breadcrumbs << { label: 'organisations', path: organisations_path }
    @breadcrumbs << { label: @organisation.name, path: @organisation } if defined?(@organisation)
    @breadcrumbs << { label: 'edit', path: edit_organisation_path(@organisation) } if %w[edit update].include?(action_name)
    @breadcrumbs << { label: 'new', path: new_organisation_path } if %w[new create].include?(action_name)
  end
end
