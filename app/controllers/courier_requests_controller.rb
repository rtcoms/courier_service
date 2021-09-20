class CourierRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_courier_request, only: %i[ show edit update destroy ]

  # GET /courier_requests or /courier_requests.json
  def index
    @courier_requests = current_user.courier_requests
  end

  def search
    search_param = params[:search]
    if search_param
      tracking_number = search_param[:query].upcase
      @courier_request = current_user.courier_requests.find_by(tracking_number: tracking_number)

      redirect_to search_courier_requests_path, alert: "Tracking number must be present" and return if search_param && search_param[:query].blank?
      redirect_to courier_request_path(@courier_request), notice: "Found courier request for tracking number: #{tracking_number}" and return if @courier_request.present?
      redirect_to search_courier_requests_path, alert: "Courier request not found for tracking number: #{tracking_number}" and return
    end
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
    @courier_request = current_user.courier_requests.build(courier_request_params)

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
      @courier_request = current_user.courier_requests.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def courier_request_params
      params.require(:courier_request).permit(:weight, :service_type, :cost, :payment_mode, :status, :sender_fullname, :sender_address, :sender_phone, :sender_pincode,
                                              :receiver_fullname, :receiver_address, :receiver_phone, :receiver_pincode, :tracking_number,
                                              :sender_email, :receiver_email)

    end
end
