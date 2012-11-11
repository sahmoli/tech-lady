module ApplicationHelper
  def formated_date(activity_date)
    activity_date.strftime("%Y-%m-%d, %H:%M:%S")
  end
end
