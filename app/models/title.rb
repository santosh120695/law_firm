class Title < ApplicationRecord
  belongs_to :client
  has_one :pricing_detail, dependent: :destroy
  belongs_to :status, class_name: "StatusMaster", foreign_key: "status_id", optional: true
  has_many :payment_statuses
  has_many_attached :files

  accepts_nested_attributes_for :pricing_detail, allow_destroy: true, reject_if: :all_blank

  before_create :set_uuid , :set_status

  def set_status 
    self.status_id = StatusMaster.where(active: true, status_type: "Title", initial: true).last.id
  end
end
