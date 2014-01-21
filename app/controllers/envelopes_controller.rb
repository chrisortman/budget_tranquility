class EnvelopesController < ApplicationController
  before_action :set_envelope, only: [:show, :edit, :update, :destroy]

  # GET /envelopes
  # GET /envelopes.json
  def index
    @envelopes = Envelope.all
  end

  # GET /envelopes/1
  # GET /envelopes/1.json
  def show
  end

  # GET /envelopes/new
  def new
    @envelope = Envelope.new
  end

  # GET /envelopes/1/edit
  def edit
  end

  # POST /envelopes
  # POST /envelopes.json
  def create
    @envelope = Envelope.new(envelope_params)

    respond_to do |format|
      if @envelope.save
        format.html { redirect_to @envelope, notice: 'Envelope was successfully created.' }
        format.json { render action: 'show', status: :created, location: @envelope }
      else
        format.html { render action: 'new' }
        format.json { render json: @envelope.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /envelopes/1
  # PATCH/PUT /envelopes/1.json
  def update
    respond_to do |format|
      if @envelope.update(envelope_params)
        format.html { redirect_to @envelope, notice: 'Envelope was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @envelope.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /envelopes/1
  # DELETE /envelopes/1.json
  def destroy
    @envelope.destroy
    respond_to do |format|
      format.html { redirect_to envelopes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_envelope
      @envelope = Envelope.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def envelope_params
      params.require(:envelope).permit(:label, :per_month, :per_check)
    end
end
