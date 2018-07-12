class CurriculumVitaesController < ApplicationController
  before_action :set_curriculum_vitae, only: [:show, :edit, :update, :destroy, :upload]
  before_action :set_variables, except: %i[index destroy]
  before_action :add_breadcrumbs

  # GET /curriculum_vitaes
  # GET /curriculum_vitaes.json
  def index
    @curriculum_vitaes = findable_curriculum_vitaes.all
  end

  # GET /curriculum_vitaes/1
  # GET /curriculum_vitaes/1.json
  def show
  end

  # GET /curriculum_vitaes/new
  def new
    @curriculum_vitae = findable_curriculum_vitaes.new
  end

  # GET /curriculum_vitaes/1/edit
  def edit
  end

  # POST /curriculum_vitaes
  # POST /curriculum_vitaes.json
  def create
    @curriculum_vitae = findable_curriculum_vitaes.new(curriculum_vitae_params)

    respond_to do |format|
      if @curriculum_vitae.save
        format.html { redirect_to @curriculum_vitae, notice: I18n.t('controllers.curriculum_vitaes.create.success') }
        format.json { render :show, status: :created, location: @curriculum_vitae }
      else
        format.html { render :new }
        format.json { render json: @curriculum_vitae.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /curriculum_vitaes/1
  # PATCH/PUT /curriculum_vitaes/1.json
  def update
    respond_to do |format|
      if @curriculum_vitae.update(curriculum_vitae_params)
        format.html { redirect_to @curriculum_vitae, notice: I18n.t('controllers.curriculum_vitaes.update.success') }
        format.json { render :show, status: :ok, location: @curriculum_vitae }
      else
        format.html { render :edit }
        format.json { render json: @curriculum_vitae.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /curriculum_vitaes/1
  # DELETE /curriculum_vitaes/1.json
  def destroy
    @curriculum_vitae.destroy
    respond_to do |format|
      format.html { redirect_to curriculum_vitaes_url, notice: I18n.t('controllers.curriculum_vitaes.destroy.success') }
      format.json { head :no_content }
    end
  end

  # GET /curriculum_vitaes/1/upload
  def upload
    if Rails.env.development?
      send_file "#{Rails.root}/tmp/files/curriculum_vitaes/uploads/#{@curriculum_vitae.id}/#{@curriculum_vitae.upload_file_name}",
                type: @curriculum_vitae.upload_content_type
    else
      # TODO: implement AWS S3
      render text: 'Please set up your AWS stuff'
    end
  end

  private

  # Returns an Active Record relation (a collection) of CVs, based on the user's permission.
  def findable_curriculum_vitaes
    if current_user.admin_access
      CurriculumVitae
    else
      current_user.curriculum_vitaes
    end
  end

  def set_curriculum_vitae
    @curriculum_vitae = findable_curriculum_vitaes.find(params[:id])
  end

  def set_variables; end

  def add_breadcrumbs
    @breadcrumbs << { label: I18n.t('activerecord.models.curriculum_vitae.other'), path: curriculum_vitaes_path }
    @breadcrumbs << { label: @curriculum_vitae.name, path: @curriculum_vitae } if defined?(@curriculum_vitae)
    @breadcrumbs << { label: I18n.t('views.general.edit'), path: edit_curriculum_vitae_path(@curriculum_vitae) } if %w[edit update].include?(action_name)
    @breadcrumbs << { label: I18n.t('views.general.new'), path: new_curriculum_vitae_path } if %w[new create].include?(action_name)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def curriculum_vitae_params
    params.require(:curriculum_vitae).permit(:name, :description, :upload)
  end
end
