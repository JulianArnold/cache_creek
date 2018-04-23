class CurriculumVitaesController < ApplicationController
  before_action :set_curriculum_vitae, only: [:show, :edit, :update, :destroy]
  before_action :add_breadcrumbs

  # GET /curriculum_vitaes
  # GET /curriculum_vitaes.json
  def index
    @curriculum_vitaes = CurriculumVitae.all
  end

  # GET /curriculum_vitaes/1
  # GET /curriculum_vitaes/1.json
  def show
  end

  # GET /curriculum_vitaes/new
  def new
    @curriculum_vitae = CurriculumVitae.new
  end

  # GET /curriculum_vitaes/1/edit
  def edit
  end

  # POST /curriculum_vitaes
  # POST /curriculum_vitaes.json
  def create
    @curriculum_vitae = CurriculumVitae.new(curriculum_vitae_params)

    respond_to do |format|
      if @curriculum_vitae.save
        format.html { redirect_to @curriculum_vitae, notice: 'Curriculum vitae was successfully created.' }
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
        format.html { redirect_to @curriculum_vitae, notice: 'Curriculum vitae was successfully updated.' }
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
      format.html { redirect_to curriculum_vitaes_url, notice: 'Curriculum vitae was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_curriculum_vitae
    @curriculum_vitae = CurriculumVitae.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def curriculum_vitae_params
    params.require(:curriculum_vitae).permit(:name, :description, :upload)
  end

  def add_breadcrumbs
    @breadcrumbs << { label: 'curriculum vitaes', path: curriculum_vitaes_path }
    @breadcrumbs << { label: @curriculum_vitae.name, path: @curriculum_vitae } if defined?(@curriculum_vitae)
    @breadcrumbs << { label: 'edit', path: edit_curriculum_vitae_path(@curriculum_vitae) } if %w[edit update].include?(action_name)
    @breadcrumbs << { label: 'new', path: new_curriculum_vitae_path } if %w[new create].include?(action_name)
  end
end
