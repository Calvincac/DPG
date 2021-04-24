home_page      = DPG::HomePage.new
cookies_modal  = DPG::CookiesModal.new
login_page     = DPG::LoginPage.new
general_helper = DPG::GeneralHelper.new
search_page    = DPG::SearchPage.new
news_page      = DPG::NewsPage.new
tile_page      = DPG::TilePage.new



Given('A DPG Media customer opens the home page') do
    visit "https://www.volkskrant.nl/"
  end
  
  And('I close the cookies modal') do
    cookies_modal.click_on_accept_button
  end
  
  When('I click on the Log in button on the home page') do
    home_page.log_in_button.click
  end
  
  Then('I see the Log in page') do
    page.should have_css login_page.class::LOGIN_SELECTOR
    general_helper.take_screenshot('login_page')
  end
  
  When('I enter the email address') do
    @credentials = general_helper.credentials_from_file('user_and_password.txt')
    login_page.username.set(@credentials.first)
    general_helper.take_screenshot('filled_email_address_on_login')
  end

  When('I click on the {string} button on the login page') do |string|
    login_page.submit_button_by_text(string).click
  end
  
  Then('I see password field page') do
    page.should have_css login_page.class::PASSWORD_FIELD
    general_helper.take_screenshot('password_login_page')
  end
  
  Then('I enter the password') do
    login_page.password_input.set(@credentials.last)
    general_helper.take_screenshot('filled_password_login_page')
  end
  
  Then('I dont see the login button on the home page') do
    page.should have_css home_page.class::SUBSCRIBE_BAR
    page.should_not have_css home_page.class::LOGIN_BUTTON
    general_helper.take_screenshot('login_button_disappeared_home_page')
  end

  When('I click on the search button on the home page') do
    home_page.search_button.click
  end
  
  Then('I see the Volkrant search page') do
    page.should have_css search_page.class::SEARCH_INPUT
    general_helper.take_screenshot('volkrant_search_page')
  end
  
  When('I search for word {string} in the search field') do |string|
    search_page.search_input.set(string)
    search_page.search_button.click
    general_helper.take_screenshot('search_page')
  end
  
  Then('I see {string} search result count') do |string|
    page.should have_css search_page.class::ARTICLES
    expect(search_page.result_count.text).to eq(string)
    general_helper.take_screenshot('searched_results')
  end
  
  Then('I see the searched word {string} on the search area') do |string|
    page.should have_css search_page.class::ARTICLES
    expect(search_page.search_result_word.text).to eq(string)
  end
  
  Then('I see {string} articles related to the search on the search page') do |string|
    expect(search_page.articles.count.to_s).to eq(string)
  end
  
  When('I click on the article with the title {string}') do |string|
    search_page.article_title_by_text(string).click
  end
  
  Then('I see the article title {string} on the article page') do |string|
    page.should have_css news_page.class::ARTICLE_TITLE
    expect(news_page.article_title.text).to eq(string)
    general_helper.take_screenshot('searched_article_page')
  end

  When('I click on the tile name {string}') do |string|
    search_page.tile_card_by_text(string).click
  end
  
  Then('I see the {string} tile page') do |title_on_the_page|
    page.should have_css tile_page.class::TITLE
    expect(tile_page.title.text).to eq(title_on_the_page)
    general_helper.take_screenshot("#{title_on_the_page}_tile_page")
  end
  
  Then('I see the articles on the tile search page') do
    page.should have_css tile_page.class::TILE_ARTICLES
end