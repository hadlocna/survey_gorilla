class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :survey_takers
  has_many :taken_surveys, through: :survey_takers, source: :surveys
  # source --> table

  has_many :authored_surveys, class_name: "Survey", foreign_key: :author_id
  # User.first.authored_surveys

  has_many :responses, through: :survey_takers

end
