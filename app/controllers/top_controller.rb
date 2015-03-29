class TopController < ApplicationController
  def index

  end
  def attend
    code = params[:code].to_i
    @guest = Guest.find_by_code code
    if @guest.present?
      @guest.attendance = 1
      @guest.save
      render json: @guest
    end
  end
  def not_attend
    code = params[:code].to_i
    @guest = Guest.find_by_code code
    if @guest.present?
      @guest.attendance = 2
      @guest.save
      render json: @guest
    end
  end
  def get_data
    code = params[:code].to_i
    @guest = Guest.find_by_code code
    render json: @guest
  end
end
