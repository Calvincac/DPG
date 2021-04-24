require 'report_builder'
time = Time.now.getutc
ReportBuilder.configure do |config|
 config.json_path = 'report_builder/report.json'
 config.report_path = 'cucumber_report/cucumber_web_report'
 config.report_types = [:html]
 config.report_tabs = %w[Overview Features Scenarios Errors]
 config.report_title = 'Cucumber Test Automation Results'
 config.compress_images = false
 config.additional_info = { 'Project name' => 'DPG Media', 'Report generated' => time }
end
ReportBuilder.build_report