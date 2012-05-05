require 'spec_helper'

describe "have_error" do

  before :each do
    @object = object_with_validations :name => {:presence => true}
  end

  context "Testing should_not" do
    it "should not raise error when object doesn't contain error" do
      @object.name = "something"
      lambda{ @object.should_not have_error(:blank).on :name }.should_not raise_error RSpec::Expectations::ExpectationNotMetError
    end

    it "should raise error when object contain error" do
      lambda{ @object.should_not have_error(:blank).on :name }.should raise_error RSpec::Expectations::ExpectationNotMetError
    end
  end

  context "Testing should" do
    it "should raise error when object doesn't contain error" do
      @object.name = "something"
      lambda{ @object.should have_error(:blank).on :name }.should raise_error RSpec::Expectations::ExpectationNotMetError
    end

    it "should not raise error when object contain error" do
      lambda{ @object.should have_error(:blank).on :name }.should_not raise_error RSpec::Expectations::ExpectationNotMetError
    end
  end
end