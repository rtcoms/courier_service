class CourierRequestsController < ApplicationController
  before_action :set_courier_request, only: %i[ show edit update destroy ]

  # GET /courier_requests or /courier_requests.json
  def index
    @courier_requests = CourierRequest.all
  end

  # GET /courier_requests/1 or /courier_requests/1.json
  def show
  end

  # GET /courier_requests/new
  def new
    @courier_request = CourierRequest.new
  end

  # GET /courier_requests/1/edit
  def edit
  end

  # POST /courier_requests or /courier_requests.json
  def create
    @courier_request = CourierRequest.new(courier_request_params)

    respond_to do |format|
      if @courier_request.save
        format.html { redirect_to @courier_request, notice: "Courier request was successfully created." }
        format.json { render :show, status: :created, location: @courier_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @courier_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courier_requests/1 or /courier_requests/1.json
  def update
    respond_to do |format|
      if @courier_request.update(courier_request_params)
        format.html { redirect_to @courier_request, notice: "Courier request was successfully updated." }
        format.json { render :show, status: :ok, location: @courier_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @courier_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courier_requests/1 or /courier_requests/1.json
  def destroy
    @courier_request.destroy
    respond_to do |format|
      format.html { redirect_to courier_requests_url, notice: "Courier request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_courier_request
      @courier_request = CourierRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def courier_request_params
      params.require(:courier_request).permit(:weight, :service_type, :cost, :payment_mode, :status, :sender_fullname, :sender_address, :sender_phone, :sender_pincode, :receiver_fullname, :receiver_address, :receiver_phone, :receiver_pincode, :tracking_number)
    end
end
