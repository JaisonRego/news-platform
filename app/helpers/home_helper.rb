module HomeHelper
  # Formats a welcome message with the given platform name
  def format_welcome_message(platform_name)
    "Welcome to #{platform_name}!"
  end

  # Returns the current year
  def current_year
    Time.current.year
  end
end
