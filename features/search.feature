@search
Feature: As an DPG Media customer
         I should be able to search for an article

  @search_article
  Scenario: User should be able to search for an article
    Given A DPG Media customer opens the home page
    And I close the cookies modal
    When I click on the search button on the home page
    Then I see the Volkrant search page
    When I search for word "Rutte" in the search field
    Then I see "1000" search result count
    And I see the searched word "Rutte" on the search area
    And I see "50" articles related to the search on the search page
    When I click on the article with the title "De Betrouwbare Mannetjes lazen de notulen"
    Then I see the article title "De Betrouwbare Mannetjes lazen de notulen" on the article page

  @search_tiles
  Scenario Outline: User should be able to navigate through different tiles
    Given A DPG Media customer opens the home page
    And I close the cookies modal
    When I click on the search button on the home page
    Then I see the Volkrant search page
    When I click on the tile name <tile_name>
    Then I see the <tile_title> tile page
    And I see the articles on the tile search page
    Examples:
        |    tile_name   |   tile_title  |
        |  "Columnisten" | "COLUMNISTEN" |
        |  "Recensies"   | "RECENSIES"   |
        |  "Volkskeuken" | "VOLKSKEUKEN" |