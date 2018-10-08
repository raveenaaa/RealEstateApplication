class Reply < ApplicationRecord
  belongs_to :realtor
  belongs_to :inquiry

  validates :realtor_id, presence: true
  validates :inquiry_id, presence: true
  validates :message, presence: true
end
