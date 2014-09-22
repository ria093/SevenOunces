module AboutHelper

  def full_display_img(img_id, anchor)
    content_tag :div, :class => 'parallax-image-wrapper parallax-image-wrapper-100',  
                      :'data-anchor-target' => anchor + ' + .gap',
                      :'data-bottom-top' => 'transform:translate3d(0px, 200%, 0px)',
                      :'data-top-bottom' => 'transform:translate3d(0px, 0%, 0px)' do
      content_tag :div, :class => 'parallax-image parallax-image-100',
                        :id => img_id,
                        :'data-anchor-target' => anchor + ' + .gap',
                        :'data-bottom-top' => 'transform: translate3d(0px, -80%, 0px);',
                        :'data-top-bottom' => 'transform: translate3d(0px, 80%, 0px);' do
        yield if block_given?
      end
    end
  end

  def half_display_img(img_id, anchor)
    content_tag :div, :class => 'parallax-image-wrapper parallax-image-wrapper-50',  
                      :'data-anchor-target' => anchor + ' + .gap',
                      :'data-bottom-top' => 'transform:translate3d(0px, 300%, 0px)',
                      :'data-top-bottom' => 'transform:translate3d(0px, 0%, 0px)' do
      content_tag :div, :class => 'parallax-image parallax-image-50',
                        :id => img_id,
                        :'data-anchor-target' => anchor + ' + .gap',
                        :'data-bottom-top' => 'transform: translate3d(0px, -60%, 0px);',
                        :'data-top-bottom' => 'transform: translate3d(0px, 60%, 0px);' do
        yield if block_given?
      end
    end
  end

  def content_block(content_id)
    content_tag :div, :class => 'content-bar', :id => content_id do
      yield if block_given? 
    end
  end

  def next_section(anchor_id)
    content_tag :a, :href => anchor_id, :class => 'down-arrow', :'aria-label' => 'Go to next section' do
    end
  end

  def next_section_alt(anchor_id)
    content_tag :a, :href => anchor_id, :class => 'down-arrow-alt', :'aria-label' => 'Go to next section' do
    end
  end

  def half_img_block(img_id)
    content_tag :div, :class => 'gap gap-50', :id => img_id do
    end
  end

end


