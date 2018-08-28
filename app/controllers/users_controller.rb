class UsersController < BaseController

  def index
  	if(params[:ids]  || params[:start_date] || params[:end_date]).blank?
     	@users = User.eager_load(:profile).all.paginate(:page => params[:page], :per_page => 10)
  	else
  		@users = UserQueryBuilder.new(params[:ids], params[:start_date], params[:end_date]).users
  	end
  	respond_to do |format|
	    format.html
	    format.xlsx
		end
  end

  def show
  	@user = User.eager_load(:account).find(params[:id])
  	@transactions = @user.transactions.paginate(:page => params[:page], :per_page => 10)
  end

end
