class Page
  include Watirsome

  URL = '/'

  def url
    @@base_url + self.class::URL
  end

  def scroll_and_click(element)
    coordinate_y = element.wd.location[1]
    @browser.scroll.to [0, coordinate_y + 50]

    element.click
  end

  def self.base_url=(base_url)
    @@base_url = base_url
  end

  def initialize(browser, goto: false)
    browser.goto url if goto
    super(browser)
  end
end
