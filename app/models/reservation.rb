class Reservation < ApplicationRecord
  validate :start_end_check
  
  
  belongs_to :room
  
  def start_end_check
    errors.add(:end_date, "は開始日以降の日付で選択してください" )if
      end_date.nil? || end_date < start_date
  end
  
end
