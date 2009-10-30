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


