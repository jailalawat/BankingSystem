require "rails_helper"

RSpec.describe TransactionMailer, type: :mailer do
  describe "transaction_notifier" do
    let(:mail) { TransactionMailer.transaction_notifier }

    it "renders the headers" do
      expect(mail.subject).to eq("Transaction notifier")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
