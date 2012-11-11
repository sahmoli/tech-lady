module ApplicationHelper
  def formatted_date(activity_date)
    activity_date.strftime("%Y-%m-%d, %H:%M:%S")
  end
end
