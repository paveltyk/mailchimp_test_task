module ApplicationHelper
  def render_flash
    String.new.tap do |html|
      flash.each do |type, message|
        html << content_tag(:div, message, :class => type)
      end
    end.html_safe
  end
end
