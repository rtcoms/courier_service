class CourierRequest < ApplicationRecord
  attr_readonly :tracking_number
  enum status: { sent: 0, in_transit: 1, delivered: 2 }, _default: "sent"
  enum service_type: { speed_post: 0, regular: 1 }, _default: "speed_post"
  enum payment_mode: { cod: 0, prepaid: 1 }, _default: "cod"

  validates :weight, :cost, :status, :payment_mode, :service_type,
            :sender_fullname, :sender_address, :sender_phone, :sender_pincode,
            :receiver_fullname, :receiver_address, :receiver_phone, :receiver_pincode,
            :tracking_number, :user_id,
            presence: true

  validates_inclusion_of :status, in: statuses.keys
  validates :tracking_number, uniqueness: true, allow_nil: false
  validates :cost, numericality: { greater_than: 0 }
  validates :weight, numericality: { greater_than: 0 }

  belongs_to :user

  before_validation :set_tracking_number, on: [:create]
  after_create_commit :notify_users

  private

  def notify_users
    CourierRequestMailer.receiver_email(self).deliver_now if receiver_email
    CourierRequestMailer.sender_email(self).deliver_now if sender_email
  end

  def set_tracking_number
    self.tracking_number = generate_tracking_number
  end

  def generate_tracking_number
    loop do
      tracking_number = SecureRandom.hex(16/4).upcase
      break tracking_number unless self.class.exists?(tracking_number: tracking_number)
    end
  end
end
