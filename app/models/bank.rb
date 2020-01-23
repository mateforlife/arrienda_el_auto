# frozen_string_literal: true

# Bank
class Bank < ApplicationRecord
  has_many :bank_accounts
end
