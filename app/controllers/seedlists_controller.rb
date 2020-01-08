class SeedlistsController < ApplicationController
  include Secured

  before_action :set_seedlist, only: [:show, :update, :destroy]

  # GET /seedlists
  def index
    @seedlists = Seedlist.all

    render json: @seedlists
  end

  # GET /seedlists/1
  def show
    render json: @seedlist
  end

  # POST /seedlists
  def create
    @seedlist = Seedlist.new(seedlist_params)

    if @seedlist.save
      render json: @seedlist, status: :created, location: @seedlist
    else
      render json: @seedlist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /seedlists/1
  def update
    if @seedlist.update(seedlist_params)
      render json: @seedlist
    else
      render json: @seedlist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /seedlists/1
  def destroy
    @seedlist.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seedlist
      @seedlist = Seedlist.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def seedlist_params
      params.require(:seedlist).permit(:name, :year)
    end
end
