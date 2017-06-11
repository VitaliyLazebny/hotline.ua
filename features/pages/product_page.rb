class ProductPage < Page
  include Watirsome

  div :description, id: 'short-props-list'

  a :compare, id: 'cmp-popup-button'

  div :comparation_pop_up, id: 'shadePopup'

  button :continue, text: 'Продолжить работу', visible: true
  button :compare, text: 'Сравнить', visible: true

  def add_to_comparation
    compare_a.click
    ProductPage.new(@browser)
  end

  def go_back
    @browser.back
    DesktopPage.new(@browser)
  end
end
