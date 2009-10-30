
Then /^I should be presented with an error message$/ do
  @report = Report.generate(@user)
  @status = @report.generate("status")
  @status.should == "Please register before creating an image"
end

Then /^I should be see information about how to register$/ do
  @help = @report.generate("help")
  @help.should = 'Please go to the sign-up page'
end
