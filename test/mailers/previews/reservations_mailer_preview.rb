# Preview all emails at http://localhost:3000/rails/mailers/reservations_mailer
class ReservationsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/reservations_mailer/created_for_owner
  def created_for_owner
    ReservationsMailer.created_for_owner
  end

  # Preview this email at http://localhost:3000/rails/mailers/reservations_mailer/created_for_driver
  def created_for_driver
    ReservationsMailer.created_for_driver
  end

end
