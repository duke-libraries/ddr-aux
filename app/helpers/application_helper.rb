module ApplicationHelper

  def alert_class_for(flash_name)
    case flash_name
    when "alert"
      "warning"
    when "error"
      "danger"
    else
      flash_name.to_s
    end
  end

end
