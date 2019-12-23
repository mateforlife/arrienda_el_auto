# frozen_string_literal: true

# DriverAccountsHelper
module DriverAccountsHelper
  def legal_documents_path(driver)
    driver_account_legal_documents_path(driver_account_id: driver.id)
  end
end
