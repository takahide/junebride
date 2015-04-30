class GuestsController < ApplicationController
  before_action :set_guest, only: [:show, :edit, :update, :destroy]
  before_filter :basic


  # GET /guests
  # GET /guests.json
  def index
    @guests = Guest.all
    render layout: false
  end

  # GET /guests/1
  # GET /guests/1.json
  def show
  end

  # GET /guests/new
  def new
    @guest = Guest.new
  end

  # GET /guests/1/edit
  def edit
  end

  # POST /guests
  # POST /guests.json
  def create
    @guest = Guest.new(guest_params)
    @guest.code = [*100000..999999].sample
    @guest.attendance = 0
    @guest.save

    respond_to do |format|
      if @guest.save
        format.html { redirect_to @guest, notice: 'Guest was successfully created.' }
        format.json { render action: 'show', status: :created, location: @guest }
      else
        format.html { render action: 'new' }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guests/1
  # PATCH/PUT /guests/1.json
  def update
    respond_to do |format|
      if @guest.update(guest_params)
        format.html { redirect_to @guest, notice: 'Guest was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guests/1
  # DELETE /guests/1.json
  def destroy
    @guest.destroy
    respond_to do |format|
      format.html { redirect_to guests_url }
      format.json { head :no_content }
    end
  end

  private
    def basic
    authenticate_or_request_with_http_basic do |user, pass|
      user == 'chuniya' && pass == 'chuniya'
    end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      @guest = Guest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_params
      params.require(:guest).permit(:code, :name, :attendance, :message)
    end
end
