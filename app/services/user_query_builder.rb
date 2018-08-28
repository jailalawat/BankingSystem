class UserQueryBuilder
	attr_reader :user_ids, :start_date, :end_date

  def initialize(user_ids, start_date, end_date)
    @user_ids = user_ids
    @start_date = start_date
    @end_date = end_date
  end  

	def users
	  @users ||= find_users
	end

	private

	def find_users
	  User.eager_load(:transactions, :account, :profile).where(conditions)
	end

	def user_ids_conditions
	  ["users.id IN(?)", user_ids] unless user_ids.blank?
	end

	def start_date_conditions
	  ["transactions.created_at >= ?", start_date] unless start_date.blank?
	end

	def end_date_conditions
	  ["transactions.created_at <= ?", end_date] unless end_date.blank?
	end

	def conditions
	  [conditions_clauses.join(' AND '), *conditions_options]
	end

	def conditions_clauses
	  conditions_parts.map { |condition| condition.first }
	end

	def conditions_options
		if @user_ids.blank?
			conditions_parts.map { |condition| condition[1..-1] }.flatten
		else
			[@user_ids]+conditions_parts[1..-1].map { |condition| condition[1..-1] }.flatten
		end
	end

	def conditions_parts
	  private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
	end
end