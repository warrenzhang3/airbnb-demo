class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :dog

  validates :start_date, :end_date, :total_price, presence: true
  validate :end_date_after_start_date
  validate :dates_do_not_overlap

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date <= start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  def dates_do_not_overlap
    overlapping_bookings = Booking.where(dog_id: dog_id)
                                  .where.not(id: id)
                                  .where("start_date < ? AND end_date > ?", end_date, start_date)
    if overlapping_bookings.exists?
      errors
    end
  end
end
