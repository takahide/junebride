class TopController < ApplicationController
  def index

  end
  def attend
    code = params[:code].to_i
    @guest = Guest.find_by_code code
    if @guest.present?
      @guest.attendance = 11
      @guest.save
      render json: @guest
    end
  end
  def not_attend
    code = params[:code].to_i
    @guest = Guest.find_by_code code
    if @guest.present?
      @guest.attendance = 22
      @guest.save
      render json: @guest
    end
  end
  def only_1_attend
    code = params[:code].to_i
    @guest = Guest.find_by_code code
    if @guest.present?
      @guest.attendance = 12
      @guest.save
      render json: @guest
    end
  end
  def only_2_attend
    code = params[:code].to_i
    @guest = Guest.find_by_code code
    if @guest.present?
      @guest.attendance = 21
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
