class Production < ApplicationRecord
  belongs_to :shift

  # 生産終了時刻を保存前に計算する
  before_save :calculate_end_time

  def calculate_end_time
    self.end_time = shift.start_time + (shift.cycle_time * production_quantity * shift.performance)
  end
end
