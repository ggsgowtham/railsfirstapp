class TaksController < ApplicationController
  before_action :set_tak, only: [:show, :edit, :update, :destroy]
  # GET /taks
  # GET /taks.json
  def index
    @taks = Tak.all
    @incomplete_tasks = Tak.where(complete: false)
    @complete_tasks = Tak.where(complete: true)
  
  end

  # GET /taks/1
  # GET /taks/1.json
  def show
  end

  # GET /taks/new
  def new
   @tak = Tak.new
   @incomplete_tasks = Tak.where(complete: false)
    @complete_tasks = Tak.where(complete: true)
  end

  # GET /taks/1/edit
  def edit
  end

  # POST /taks
  # POST /taks.json
  def create
    @tak = Tak.new(tak_params)

    respond_to do |format|
      if @tak.save
        #format.html { redirect_to @tak, notice: 'Tak was successfully created.' }
        #format.json { render :show, status: :created, location: @tak }
        format.js
      else
        format.html { render :new }
        format.json { render json: @tak.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /taks/1
  # PATCH/PUT /taks/1.json
  def update
    respond_to do |format|
      if @tak.update(tak_params)
        #format.html { redirect_to @tak, notice: 'Tak was successfully updated.' }
       # format.json { render :show, status: :ok, location: @tak }
       format.js
      else
        format.html { render :edit }
        format.json { render json: @tak.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taks/1
  # DELETE /taks/1.json
  def destroy
    @tak.destroy
    respond_to do |format|
      #format.html { redirect_to taks_url, notice: 'Tak was successfully destroyed.' }
      #format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tak
      @tak = Tak.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tak_params
      params.require(:tak).permit(:name, :complete)
    end
end
