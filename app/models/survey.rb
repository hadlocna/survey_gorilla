class Survey < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :author, class_name: "User"
  has_many :questions
  has_many :survey_takers
  # has_many :taken_surveys, :through => :survey_takers, :source => :users
  has_many :users, through: :survey_takers

end
