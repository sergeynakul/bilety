class OrdersController < ApplicationController
  before_action :set_order,      only: [:show, :edit, :update, :destroy, :status]
  before_action :admin_user,     only: [:index, :not_do]
  before_action :logged_in_user, only: [:new, :edit, :create, :update, :destroy]
  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  def status
    @order.update_attribute(:status, true)
    redirect_to orders_path
  end

  def not_do
    @orders = Order.where(status: false)
    render "index"
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = current_user.orders.build(order_params)

    respond_to do |format|
      if @order.save
        OrderMailer.send_email(@order).deliver
        format.html { redirect_to @order, notice: 'Запрос успешно отправлен.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    @order = current_user.orders.build(order_params)

    respond_to do |format|
      if @order.save
        OrderMailer.send_email(@order).deliver        
        format.html { redirect_to @order, notice: 'Измененный запрос успешно отправлен.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:from, :to, :date)
    end
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
