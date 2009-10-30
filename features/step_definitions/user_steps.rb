Given /^I'm a member$/ do
  @user = User.authenticate('quentin', 'monkey')
  @user.should_not be_nil
end

Given /^I'm not a member$/ do
  @user = User.authenticate("yacin","password")
  true if @user.nil?
end
