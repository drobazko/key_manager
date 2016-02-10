class Credential < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  validates :name, :login, :password, presence: true

  attr_accessor :encryption_key

  attr_encrypted :login, key: :encryption_key
  attr_encrypted :password, key: :encryption_key

  EXPORT_FORMATS = [:pdf, :csv]

  def self.expiration_mail
    Credential.where("expiration_date < ? and is_notified = 0", Time.zone.now.to_date).each { |credential|
      CredentialMailer.out_of_date(credential).deliver
    }
  end

  before_save do 
    self.is_notified = 0
  end
end
