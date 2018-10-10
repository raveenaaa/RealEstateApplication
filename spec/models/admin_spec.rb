require 'rails_helper'

RSpec.describe Admin, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before(:each) do
    @admin = Admin.create!(email: "admin@gmail.com", password: "abc1234", name: "admin")
  end

   describe "validations" do
    it "Admin is not valid without an email" do
      @admin.email = nil
      expect(@admin).to_not be_valid
    end

    it "Email format is invalid" do
      @admin.email = "admin12"
      expect(@admin).to_not be_valid
    end

    # it "Email account exists" do
    #   @admin.email = "admin@gmail.com"
    #   expect(@admin).to_not be_valid
    # end

    it "Admin is not valid without a password" do
      @admin.password = nil;
      expect(@admin).to_not be_valid
    end

    it "Password should be more than 6 in length" do
      @admin.password = "a123";
      expect(@admin).to_not be_valid
    end

    it "Admin is not valid without a name" do
       @admin.name = nil
       expect(@admin).to_not be_valid
     end


   end

  # describe "This admin id is taken"do
  #   it { should validate_uniqueness_of(:email)}
  # end

end
