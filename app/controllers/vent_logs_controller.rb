class VentLogsController < ApplicationController
  before_action :set_vent_log, only: [:show, :edit, :update, :destroy]

  # GET /vent_logs
  # GET /vent_logs.json
  def index
    @vent_logs = VentLog.all
  end

  # GET /vent_logs/1
  # GET /vent_logs/1.json
  def show
  end

  # GET /vent_logs/new
  def new
    @vent_log = VentLog.new
  end

  # GET /vent_logs/1/edit
  def edit
  end

  # POST /vent_logs
  # POST /vent_logs.json
  def create
    @vent_log = VentLog.new(vent_log_params)

    respond_to do |format|
      if @vent_log.save
        format.html { redirect_to @vent_log, notice: 'Vent log was successfully created.' }
        format.json { render :show, status: :created, location: @vent_log }
      else
        format.html { render :new }
        format.json { render json: @vent_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vent_logs/1
  # PATCH/PUT /vent_logs/1.json
  def update
    respond_to do |format|
      if @vent_log.update(vent_log_params)
        format.html { redirect_to @vent_log, notice: 'Vent log was successfully updated.' }
        format.json { render :show, status: :ok, location: @vent_log }
      else
        format.html { render :edit }
        format.json { render json: @vent_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vent_logs/1
  # DELETE /vent_logs/1.json
  def destroy
    @vent_log.destroy
    respond_to do |format|
      format.html { redirect_to vent_logs_url, notice: 'Vent log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vent_log
      @vent_log = VentLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vent_log_params
      params.require(:vent_log).permit(:organization, :contact, :notes, :phone, :email, :source, :cv_sent, :interest, :cv_version)
    end
end
