# frozen_string_literal: true

# FormHelper
module FormHelper
  def setup_user(user)
    user.address || Address.new(user: user)
    user.bank_account || BankAccount.new(user: user)
    user
  end
end
