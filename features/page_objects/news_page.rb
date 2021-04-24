module DPG
    class NewsPage < BasePage
        ARTICLE_TITLE  = '[data-element-id="article-element-headertitle"]'
        
        def article_title
            page.find(ARTICLE_TITLE)
        end
  end
end

World(DPG)