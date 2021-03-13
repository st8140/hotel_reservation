class Reservation < ApplicationRecord
  validate :start_end_check
  validate :start_check
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :purson_num, presence: true
  
  belongs_to :room
  belongs_to :user
  
  def start_end_check
    errors.add(:end_date, "は開始日以降の日付で選択してください" )if
      end_date.nil? || end_date < start_date
  end
  
  def start_check
    errors.add(:start_date, "は本日以降の日付で選択してください" )if
      start_date.nil? || start_date < Date.today
  end
  
  
  
end
