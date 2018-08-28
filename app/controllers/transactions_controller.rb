class TransactionsController < BaseController
  before_action :set_transactions
  before_action :set_transaction, only: :show

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = @transactions.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def new
    @transaction = @transactions.build
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = @transactions.build(transaction_params)
    @transaction.account = current_user.account
    if @transaction.save
      redirect_to @transaction, notice: "#{@transaction.transaction_type_name} was successfully placed."
    else
      render :new 
    end
  end

  def enquiry
    @account = current_user.account
    @transactions = @transactions.where('transactions.created_at BETWEEN DATE(?) AND DATE(?)', params[:start_date], params[:end_date]).paginate(:page => params[:page], :per_page => 10)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = @transactions.find(params[:id])
    end

    def set_transactions
      if current_user.has_role? :manager
        @transactions = Transaction.all
      else
        @transactions = current_user.transactions
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:amount, :transaction_type)
    end
end
