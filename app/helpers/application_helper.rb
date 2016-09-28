module ApplicationHelper

  def feature_on?(feature)
    Flipper::Rails.flipper[feature].enabled?
  end

end
