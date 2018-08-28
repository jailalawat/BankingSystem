class TransactionMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.transaction_mailer.transaction_notifier.subject
  #
  def transaction_notifier(transaction)
    @transaction = transaction
    @account = transaction.account
    @user = @account.user
    @bank = @user.bank
    mail to: @user.email, subject: "Transaction alert for your #{@bank.name} Bank NetBanking"
  end
end
