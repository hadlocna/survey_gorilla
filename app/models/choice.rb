class Choice < ActiveRecord::Base

  belongs_to :question
  has_many :responses

  def percent_answered(survey)
    (Response.where(choice_id: self.id).count.to_f )#/ survey.survey_takers.count * 100).round()
  end

end
