class TimeSheetsController < ApplicationController
  before_action :set_time_sheet, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.find(params[:user_id])
    @time_sheets = @user.time_sheets
  end

  def new
    @user = User.find(params[:user_id])
    @time_sheet = @user.time_sheets.build
    @time_sheet.line_items.build
  end
  
  def show
  end

  def edit
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @time_sheet = @user.time_sheets.new(time_sheet_params)

    if @time_sheet.save
      redirect_to user_time_sheets_path(@user, @time_sheet), notice: 'Timesheet was successfully created'
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:user_id])
    @time_sheet = @user.time_sheets.find(params[:id])

    if @time_sheet.update(time_sheet_params)
      redirect_to user_time_sheet_path(@user, @time_sheet), notice: 'TimeSheet was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @time_sheet.destroy
    redirect_to user_time_sheets_path(@user), notice: 'TimeSheet was successfully deleted.' 
  end

  private
    def set_time_sheet
      @user = User.find(params[:user_id])
      @time_sheet = @user.time_sheets.find(params[:id])
    end

    def time_sheet_params
      params.require(:time_sheet).permit(:description, :rate, line_items_attributes: [:id, :date, :minutes, :_destroy])
    end
end
