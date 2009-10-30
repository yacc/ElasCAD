
Then /^I should be presented with a report information$/ do
  @report = Report.new(@image)
  @info = @report.generate("information")
  @info.should == "My First Test Image"
end

Then /^I should be notifed of progress$/ do
  @progress = @report.generate("progress")
  @progress.should == "booting"
end
