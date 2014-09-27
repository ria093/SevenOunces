module AboutHelper

  def full_display_img(img_id, anchor)
    content_tag :div, class: 'parallax-image-wrapper parallax-image-wrapper-100',  
                      :'data-anchor-target' => anchor + ' + .gap',
                      :'data-bottom-top' => 'transform:translate3d(0px, 200%, 0px)',
                      :'data-top-bottom' => 'transform:translate3d(0px, 0%, 0px)' do
      content_tag :div, class: 'parallax-image parallax-image-100',
                        id: img_id,
                        :'data-anchor-target' => anchor + ' + .gap',
                        :'data-bottom-top'    => 'transform: translate3d(0px, -80%, 0px);',
                        :'data-top-bottom'    => 'transform: translate3d(0px, 80%, 0px);' do
        yield if block_given?
      end
    end
  end

  def half_display_img(img_id, anchor)
    content_tag :div, class: 'parallax-image-wrapper parallax-image-wrapper-50',  
                      :'data-anchor-target' => anchor + ' + .gap',
                      :'data-bottom-top'    => 'transform:translate3d(0px, 300%, 0px)',
                      :'data-top-bottom'    => 'transform:translate3d(0px, 0%, 0px)' do
      content_tag :div, class: 'parallax-image parallax-image-50',
                        id: img_id,
                        :'data-anchor-target' => anchor + ' + .gap',
                        :'data-bottom-top'    => 'transform: translate3d(0px, -60%, 0px);',
                        :'data-top-bottom'    => 'transform: translate3d(0px, 60%, 0px);' do
        yield if block_given?
      end
    end
  end

  def content_block(content_id, anchor_id, style = 'down-arrow-alt')
    content_tag(:div, class: 'content-bar', id: content_id) do
      content_tag(:div, class: 'row') do
        content_tag(:div, class: 'col-md-10 col-md-offset-1') do
          yield if block_given?
        end 
      end +
      next_section(anchor_id, style)
    end
  end

  def next_section(anchor_id, style = 'down-arrow')
    content_tag(:a, nil, href: anchor_id, class: style, :'aria-label' => 'Go to next section')
  end

  def half_img_block(img_id)
    content_tag(:div, nil, class: 'gap gap-50', id: img_id)
  end

  def stat_block(img, title, text)
    content_tag(:div, class: 'col-md-3') do
      image_tag(img, height: 50, alt: img, class: 'content-img') +
      content_tag(:p, title, class: 'big-numb') + 
      content_tag(:p, text.html_safe)
    end
  end

end


