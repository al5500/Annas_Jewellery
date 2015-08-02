# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  email                  :string
#  password_digest        :string
#  admin                  :boolean
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  auth_token             :string
#  password_reset_token   :string
#  password_reset_sent_at :datetime
#

class User < ActiveRecord::Base
  has_secure_password
  validates :email, :presence => true
  validates :email, :uniqueness => true
  before_create { generate_token(:auth_token) }

  def self.sign_in_from_omniauth(auth)
    find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
  end

  def self.create_user_from_omniauth(auth)
    create(
      provider: auth['provider'],
      uid: auth['uid'],
      name: auth['info']['name']
      )
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver 
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
