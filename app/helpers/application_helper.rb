module ApplicationHelper
  def is_active?(link_path)
    current_page?(link_path) ? "active" : ""
  end

  def custom_navbar(link_path)
    !current_page?(link_path) ? "#575B6B" : "transparent"
  end

  def should_show_navbar?
    unless current_page?(new_admin_session_path) || current_page?(new_admin_registration_path) || current_page?(new_admin_password_path)
      render 'layouts/navbar'
    end
  end

  def should_show_footer?
    unless current_page?(new_admin_session_path) || current_page?(new_admin_registration_path) || current_page?(new_admin_password_path)
      render 'layouts/footer'
    end
  end
end
