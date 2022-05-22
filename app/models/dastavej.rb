class Dastavej < ApplicationRecord
  belongs_to :client
  belongs_to :project
  belongs_to :unit
  belongs_to :tower 
  belongs_to :floor
  has_one :dastavej_pricing_detail
  belongs_to :status, class_name: "StatusMaster", foreign_key: "status_id", optional: true
  has_many :payment_statuses, as: :item
  before_create :set_state 

  has_one_attached :sale_deed 
  has_one_attached :ats 
  has_one_attached :development_agreement
  has_one_attached :other_agreement 
  has_one_attached :corraction_agreement 
  has_one_attached :hakk_kami 
  has_one_attached :mortage 
  has_many :stages, as: :item

  has_many_attached :other_attachments

  accepts_nested_attributes_for :dastavej_pricing_detail, allow_destroy: true, reject_if: :all_blank

  after_create :generate_stages 


  def generate_stages 
    StageMaster.all.each {|stage_master| Stage.create(stage_master: stage_master, item_type: self.class.to_s, item_id: self.id)}
  end


  def set_state 
    self.status_id = StatusMaster.where(status_type: "Dastavej", initial: true).last.id 
  end
end
