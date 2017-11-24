class Invoices::PurchasesController < ApplicationController
    before_action :set_invoice
    

  # GET /purchases
  # GET /purchases.json
  def index
    @purchases = Purchase.all
  end

  # GET /purchases/1
  # GET /purchases/1.json
  def show
  end

  # GET /purchases/new
  def new
    @invoice = Invoice.find(params[:invoice_id])
    @purchase = Purchase.new
  end

  # GET /purchases/1/edit
  def edit
     
  end

  # POST /purchases
  # POST /purchases.json
  def create
    @invoice = Invoice.find(params[:invoice_id])
    @purchase = Purchase.new(purchase_params)
    @purchase.invoice = @invoice

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to @invoice, notice: 'Purchase was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchases/1
  # PATCH/PUT /purchases/1.json
  def update
    respond_to do |format|
      if @purchase.update(purchase_params)
        format.html { redirect_to @purchase, notice: 'Purchase was successfully updated.'}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @purchase.errors, status: :unprocessable_entity}
    end
  end

  # DELETE /purchases/1
  # DELETE /purchases/1.json
  def destroy
    @invoice = Invoice.find(params[:invoice_id])
    @purchase = Purchase.find(params[:id])
    title = @purchase.name

        if @purchase.destroy
          flash[:notice] = "#{title} was deleted successfully."
          redirect_to @invoice

        else
          flash[:error] = "Error could not delete purchase."
          redirect_to :show

        end
  end

  private
    # Use callbacks to share common setup or constraints between actions.  
    def set_invoice
      @invoice = Invoice.find(params[:invoice_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def purchase_params
      params.require(:purchase).permit(:name, :category, :quantity, :invoice_id, :price)
    end
end
