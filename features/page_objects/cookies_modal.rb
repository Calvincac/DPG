module DPG
    class CookiesModal < BasePage
        ACCEPT_BUTTON = '[class*="pg-accept-button"]'
        IFRAME        = '#sp_message_iframe_484120'

      def click_on_accept_button
        page.within_frame(cookies_iframe) do
            page.find(ACCEPT_BUTTON).click
        end
      end

      def cookies_iframe
        page.find(IFRAME)
      end
  end
end

World(DPG)