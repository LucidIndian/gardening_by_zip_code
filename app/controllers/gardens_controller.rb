# scaffolded
class GardensController < ApplicationController
  before_action :authenticate_user!
  before_action :get_user # order matters, get user before set garden
  before_action :set_garden, only: %i[ show edit update destroy ]
  

  # GET /gardens or /gardens.json
  def index
    @gardens = @user.gardens
  end

  # GET /gardens/1 or /gardens/1.json
  def show
  end

  # GET /gardens/new
  def new
    @garden = @user.gardens.build
  end

  # GET /gardens/1/edit
  def edit
  end

  # POST /gardens or /gardens.json
  def create
    @garden = @user.gardens.build(garden_params)

    respond_to do |format|
      if @garden.save
        format.html { redirect_to user_gardens_path(@user), status: :see_other, notice: "Garden was successfully created." }
        format.json { render :show, status: :created, location: @garden }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @garden.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gardens/1 or /gardens/1.json
  def update
    respond_to do |format|
      if @garden.update(garden_params)
        format.html { redirect_to user_garden_path(@user), status: :see_other, notice: "Garden was successfully updated." }
        format.json { render :show, status: :ok, location: @garden }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @garden.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gardens/1 or /gardens/1.json
  def destroy
    @garden.destroy

    respond_to do |format|
      format.html { redirect_to user_gardens_path(@user), status: :see_other, notice: "Garden was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def get_user
      @user = User.find(params[:user_id]) # Use find_by here?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_garden
      @garden = @user.gardens.find(params[:id]) # Use find_by here?
    end

    # Only allow a list of trusted parameters through.
    def garden_params
      params.require(:garden).permit(:name, :description, :zip, :user_id)
    end
end
