module DPG
    class SearchPage < BasePage
        SEARCH_INPUT        = '[class*="search-form__query"]'
        SEARCH_BUTTON       = '[class*="search-form__submit"]'
        RESULT_COUNT        = '.search-results__count'
        SEARCH_RESULT_WORD  = '.search-results__query'
        ARTICLES            = 'article'
        ARTICLE_TITLE       = 'article h3'
        TILE_TITLE          = '.card__title'

        def search_input
            page.find(SEARCH_INPUT)
        end

        def search_button
            page.find(SEARCH_BUTTON)
        end

        def result_count
            page.find(RESULT_COUNT)
        end

        def search_result_word
            page.find(SEARCH_RESULT_WORD)
        end

        def articles
            page.all(ARTICLES)
        end

        def article_title_by_text(title)
            page.find(ARTICLE_TITLE, text: title)
        end

        def tile_card_by_text(title)
            page.find(TILE_TITLE, text: title)
        end
  end
end

World(DPG)