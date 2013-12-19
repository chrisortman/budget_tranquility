require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "confirm the users password" do
  	u = User.new({:email => 'foo@bar.com', :new_password => 'welcome', :new_password_confirmation => 'welcome'})
  	assert u.valid?

  	u2 = User.new({:email => 'foo@bar.com', :new_password => 'a', :new_password_confirmation => 'b'})
  	assert(u2.valid? == false, "Password not confirmed")
  end

  test "hashes the password when saved" do
  	u = User.new({:email => 'foo@bar.com', :new_password => 'welcome', :new_password_confirmation => 'welcome'})
	u.save!

	u2 = User.find_by(email: 'foo@bar.com')  	
	assert(u2.hashed_password.blank? == false, 'hashed_password was blank')
  end

  test "authenticates the user" do
  	User.create({:email => 'foo@bar.com', :new_password => 'welcome', :new_password_confirmation => 'welcome'})
	
	assert(User.authenticate('foo@bar.com','welcome'),'User did not authenticate')
  end
end
