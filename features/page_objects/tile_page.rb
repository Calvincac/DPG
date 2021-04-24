module DPG
    class TilePage < BasePage

        TITLE         = '.page-element-title-overview__text'
        TILE_ARTICLES = 'article'

        def title
            page.find(TITLE)
        end

  end
end

World(DPG)