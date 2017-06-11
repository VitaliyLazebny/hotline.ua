When(/^I open "Desktop" page$/) do
  @page = DesktopPage.new(browser, goto: true)
end

When(/^I open "(.+)" url with "(.+)"$/) do |url, page_class|
  browser.goto(url)
  @page = Object.const_get(page_class).new(browser)
end


When(/^Filtered "Processors" by "(.+)"$/) do |model|
  @page = @page.choose_processor(model)
end

Then(/^I see "(.+)" in chosen section$/) do |model|
  expect(@page.filter_a.text).to eql(model)
end

When(/^I click on "(.+)" title$/) do |title|
  @page = @page.open_item(title)
end

Then(/^I see product with processor type "(.+)"$/) do |model|
  expect(@page.description_div.text.include?(model)).to be true
end

When(/^I click "Compare" icon$/) do
  @page.compare_a.click
end

Then(/^I see "Product added" popup$/) do
  # empty step
  # since you can click 'Continue' button
  # to check that popup is displayed
end

When(/^I click "Continue work" button on "Product added" pop-up$/) do
  @page.continue_button.click
end

When(/^I click "Compare" button on "Product added" pop-up$/) do
  @page.compare_button.click
  @page = ComparationPage.new(browser)
end

When(/^I click browser "Back" button$/) do
  @page.go_back
  @page = DesktopPage.new(browser)
end

Then(/^I see "Comparator" page opened in new tab$/) do
  expect(browser.window(:title => /Сравнение/)).to be_present
end

Then(/^I see "(.+)"$/) do |item|
  expect(@page.product_title_a(item)).to be_present
end

Then(/^Window title is "(.+)"$/) do |title|
  expect(browser.windows.last.title).to eq(title)
end

Then(/^I see "2 goods" error message$/) do
  expect(@page.error_2_goods_element).to be_present
end

Then(/^I can't see Comparation on page$/) do
  expect(@page.page_title_h1).to_not be_present
end