class DesktopPage < Page
  include Watirsome

  # page title
  h1 :title, title: 'Настольные компьютеры', visible: true

  # main part of page
  div :items, class: 'col-middle'

  a :item_title do |title|
    items_div.a(text: title)
  end

  # filters section
  a :filter, css: '#filters .f-check .f-item a'

  div :processors, class: 'group-gr-4554'

  a :processors do |model|
    processors_div.a(text: /#{model}/)
  end

  def choose_processor(model)
    scroll_and_click processors_a(model)
    DesktopPage.new(@browser)
  end

  def open_item(title)
    scroll_and_click item_title_a(title)
    ProductPage.new(@browser)
  end

  def go_back
    @brower.back
    DesktopPage.new(@browser)
  end
end