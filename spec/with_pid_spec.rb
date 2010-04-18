require 'spec_helper'

describe :with_pid do
  
  before(:each) do
    @tmp = File.dirname(__FILE__) + "/tmp"
    FileUtils.rm_rf @tmp
  end
  
  after(:each) do
    FileUtils.rm_rf @tmp
  end
  
  it "should work" do
    output = with_pid(
      :action => :start, # start or stop
      :command => "ps",
      :name => "test",
      :pid => @tmp + "/test.pid",
      :tmp => @tmp,
      :user => "winton"
    )
    output.include?('PID').should == true
    File.read(@tmp + "/test.pid").to_i.should > 0
  end
end
