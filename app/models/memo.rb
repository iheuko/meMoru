class Memo < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :frame_type

  belongs_to :user

  with_options presence: true do
    validates :memo
  end

  with_options numericality: { only_integer: true } do
    validates :frame_type_id
  end
end
