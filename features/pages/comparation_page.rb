class ComparationPage < Page
  include Watirsome

  div :content, class: 'content'

  h1 :page_title, text: /Сравнение моделей/

  a :product_title do |title|
    content_div.a(text: /#{title}/, visible: true)
  end

  element :error_2_goods, text: /выбрано меньше 2 товаров для сравнения/


end