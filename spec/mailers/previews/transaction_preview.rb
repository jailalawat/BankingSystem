# Preview all emails at http://localhost:3000/rails/mailers/transaction
class TransactionPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/transaction/transaction_notifier
  def transaction_notifier
    TransactionMailer.transaction_notifier
  end

end
