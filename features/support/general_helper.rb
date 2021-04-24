module DPG
    class GeneralHelper
        include RSpec::Matchers
        include Capybara::DSL

        def read_file(file_name)
            credentials = []
            File.readlines(file_name).each do |line|
                credentials << line
            end
            credentials
        end

        def credentials_from_file(file_name)
            credentials = read_file(file_name)
	        user = credentials.first.gsub('user:', '').delete("\n")
            password = credentials.last.gsub('password:', '')
            [user,password]
        end

        def take_screenshot(description)
            page.save_screenshot("screenshots/#{description.downcase}.png")
        end
  end
end

World(DPG)
