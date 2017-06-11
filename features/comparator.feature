@declarative
Feature: Comparator page

  Scenario: Open comparation page
    When I open "Desktop" page
    And Filtered "Processors" by "Intel Core i3-7ххх"
    Then I see "Intel Core i3-7ххх" in chosen section
    When I click on "BRAIN Business Pro B30 (B7100.1704)" title
    Then I see product with processor type "Intel Core i3-7100"
    When I click "Compare" icon
    Then I see "Product added" popup
    When I click "Continue work" button on "Product added" pop-up
    Then I see product with processor type "Intel Core i3-7100"
    When I click browser "Back" button
    Then I see "Intel Core i3-7ххх" in chosen section
    When I click on "Intel NUC (BOXNUC7I3BNK)" title
    And I click "Compare" icon
    And I click "Compare" button on "Product added" pop-up
    Then I see "Comparator" page opened in new tab
    And Window title is "Сравнение BRAIN Business Pro B30 (B7100.1704), Intel NUC (BOXNUC7I3BNK)"

  Scenario: Goods are present on comparation page
    When I open "http://hotline.ua/computer/nastolnye-kompyutery/cmp/?s=10076410-10265413" url with "ComparationPage"
    Then I see "BRAIN Business Pro B30"
    And  I see "Intel NUC"

  Scenario: Error message present on page if no goods choosen
    When I open "http://hotline.ua/computer/nastolnye-kompyutery/cmp/?s=" url with "ComparationPage"
    Then I see "2 goods" error message
    And I can't see Comparation on page

  Scenario: Error message present on page if only 1 item choosen
    When I open "http://hotline.ua/computer/nastolnye-kompyutery/cmp/?s=10076410" url with "ComparationPage"
    Then I see "2 goods" error message
    And I can't see Comparation on page