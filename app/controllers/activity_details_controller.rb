class ActivityDetailsController < ApplicationController
  before_action :set_activity_detail, only: [:show, :edit, :update, :destroy]


  # GET /activity_details
  # GET /activity_details.json
  def index
    @activity_details = ActivityDetail.all
  end

  # GET /activity_details/1
  # GET /activity_details/1.json
  def show
    @activity_detail = ActivityDetail.find(params[:id])
    # @employee_activitys = @activity_detail.employee_activitys
    @team_size = @activity_detail.employes.compact.reject(&''.method(:==))
    @emp = Employee.find(@team_size)
    logger.debug"==================#{@emp.inspect}"

    respond_to do |format|
      format.html
      format.json {render :json => @employee}
    end
  end

  # GET /activity_details/new
  def new
    @activity_detail = ActivityDetail.new_activity
    
    @employess = Employee.all
  end

  # GET /activity_details/1/edit
  def edit
      @activity_detail = ActivityDetail.find(params[:id])
      @employess = Employee.all
  end

  # POST /activity_details
  # POST /activity_details.json
  def create
    params.permit!
    @activity_detail = ActivityDetail.new(params[:activity_detail])
    @activity_detail.user_id = current_user.id
    respond_to do |format|
      if @activity_detail.save
        format.html { redirect_to @activity_detail, notice: 'Activity detail was successfully created.' }
        format.json { render :show, status: :created, location: @activity_detail }
      else
        format.html { render :new }
        format.json { render json: @activity_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_details/1
  # PATCH/PUT /activity_details/1.json
  def update
    params.permit!
    respond_to do |format|
      if @activity_detail.update(params[:activity_detail])
        format.html { redirect_to @activity_detail, notice: 'Activity detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity_detail }
      else
        format.html { render :edit }
        format.json { render json: @activity_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_details/1
  # DELETE /activity_details/1.json
  def destroy
    @activity_detail.destroy
    respond_to do |format|
      format.html { redirect_to activity_details_url, notice: 'Activity detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def status
    @activity_detail = ActivityDetail.find(params[:id])
    @activity_detail.update_attributes(end_date: params[:end_date], status: 1)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_detail
      @activity_detail = ActivityDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_detail_params
      params.fetch(:activity_detail, {})
    end
end
