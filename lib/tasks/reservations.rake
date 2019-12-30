# frozen_string_literal: true

namespace :reservations do
  desc 'This task finish all reservations that are reserved until yesterday'
  task finish_by_date: :environment do
    reservations = Reservation.current.where(end_date: Date.yesterday)
    reservations.each(&:finished!)
  end
end
