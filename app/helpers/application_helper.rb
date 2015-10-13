module ApplicationHelper
  def flash_class(level)
    case level
      when "notice" then "success"
      when "success" then "success"
      when "error" then "error"
      when "alert" then "error"
      when "info" then "info"
      when "warn" then "warn"
    end
  end
end
