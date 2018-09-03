# frozen_string_literal: true

class PeopleController < ApplicationController
  before_action :set_person, only: %i[show edit update destroy]
  before_action :set_variables, except: %i[index destroy]
  before_action :add_breadcrumbs

  # GET /people
  # GET /people.json
  def index
    @people = current_user_people.order(next_contact_on: :desc).all
  end

  # GET /people/1
  # GET /people/1.json
  def show; end

  # GET /people/new
  def new
    @person = current_user_people.new(status: Person::STATUSES.first)
  end

  # GET /people/1/edit
  def edit; end

  # POST /people
  # POST /people.json
  def create
    @person = current_user_people.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: I18n.t('controllers.people.create.success') }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: I18n.t('controllers.people.update.success') }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: I18n.t('controllers.people.destroy.success') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def current_user_people
    current_user.people
  end

  def set_person
    @person = current_user_people.find_by(id: params[:id].to_i)
    redirect_to root_path and return unless @person
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def person_params
    params.require(:person).permit(:first_name, :last_name, :email, :phone, :organisation_id, :linkedin_profile_url, :next_contact_on, :source_of_contact, :cv_sent_on, :cv_version, :status)
  end

  def set_variables
    @organisations = current_user.organisations.order(:name)
  end

  def add_breadcrumbs
    @breadcrumbs << { label: I18n.t('activerecord.models.people.other'), path: people_path }
    @breadcrumbs << { label: @person.first_name, path: @person } if defined?(@person)
    @breadcrumbs << { label: I18n.t('views.general.edit'), path: edit_person_path(@person) } if %w[edit update].include?(action_name)
    @breadcrumbs << { label: I18n.t('views.general.new'), path: new_person_path } if %w[new create].include?(action_name)
  end
end
