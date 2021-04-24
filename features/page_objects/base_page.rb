module DPG

    class BasePage
        include RSpec::Matchers
        include Capybara::DSL
    end
end

World(DPG)