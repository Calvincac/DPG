module DPG
    class HomePage < BasePage
        LOGIN_BUTTON        = '[data-gtm="button/log_in_als_abonnee"]'
        SUBSCRIBE_BAR       = '[class*="fjs-subscribe-bar"]'
        HOME_PAGE_SELECTOR  = '#voorpagina'
        SEARCH_BUTTON       = '[data-gtm="header/zoeken"]'

      def log_in_button
        page.find(LOGIN_BUTTON)
      end

      def search_button
        page.find(SEARCH_BUTTON)
      end
  end
end

World(DPG)