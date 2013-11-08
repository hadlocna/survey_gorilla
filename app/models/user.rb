class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :survey_takers
  has_many :taken_surveys, through: :survey_takers, source: :surveys
  # source --> table
  has_many :authored_surveys, class_name: "Survey", foreign_key: :author_id
  # User.first.authored_surveys
  has_many :responses, through: :survey_takers

  validates :name, :email, :password, presence: true
  validates :email, :uniqueness => true

  def self.authenticate(email, password)
    User.find_by_email_and_password(email, password)
  end

  # def self.exists?(email)
  #   !User.find_by_email(email).nil?
  # end

end
