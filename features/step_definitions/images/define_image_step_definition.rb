Given /^I'm a member$/ do
  @user = User.authenticate('quentin', 'monkey')
  @user.should_not be_nil
end

When /^I create a new image$/ do
  @image = Image.new(@user)
  @image.name = "My First Test Image"
end

When /^I choose a base OS image from a list$/ do
  @available_os_images = Image.find_all_by_type("AMI")
  @available_os_images.should_not_be nil
  # pick the first one fro.m the list
  @image.base_image = @available_os_images[1]
end

When /^I select x11 support$/ do
  @image.has_x11 = true
end

When /^I add a tool \(xilink etc \.\.\) to the image$/ do
  # grab all the tools/application that are compatible 
  # that can be attached on this image
  @available_tools = Tools.find_all_by_os(@image.base_image)
  @available_tools.should_not_be nil
  # just grab the first one
  @image.tools << @available_tools[1]
end

Then /^I should be presented with a report information$/ do
  @report = Report.new(@image)
  @info = @report.generate("information")
  @info.should == "My First Test Image"
end

Then /^I should be notifed of progress$/ do
  @progress = @report.generate("progress")
  @progress.should == "booting"
end

Given /^I'm not a member$/ do
  @user = User.authenticate("yacin","password")
  true if @user.nil?
end

Then /^I should be presented with an error message$/ do
  @report = Report.generate(@user)
  @status = @report.generate("status")
  @status.should == "Please register before creating an image"
end

Then /^I should be see information about how to register$/ do
  @help = @report.generate("help")
  @help.should = 'Please go to the sign-up page'
end
