module ListItemHelper

  def list_item()
    content_tag(:li) do
      content_tag(:span, '', :class => 'bullet') +
      content_tag(:span, :class => 'content') do
        yield if block_given?
      end
    end
  end

end