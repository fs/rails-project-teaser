require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/subscribers/index.html.erb" do
  include SubscribersHelper
  
  before(:each) do
    subscriber_98 = mock_model(Subscriber)
    subscriber_98.should_receive(:email).and_return("MyString")
    subscriber_98.should_receive(:ip).and_return("MyString")
    subscriber_98.should_receive(:user_agent).and_return("MyString")
    subscriber_98.should_receive(:referrer).and_return("MyString")
    subscriber_99 = mock_model(Subscriber)
    subscriber_99.should_receive(:email).and_return("MyString")
    subscriber_99.should_receive(:ip).and_return("MyString")
    subscriber_99.should_receive(:user_agent).and_return("MyString")
    subscriber_99.should_receive(:referrer).and_return("MyString")

    assigns[:subscribers] = [subscriber_98, subscriber_99]
  end

  it "should render list of subscribers" do
    render "/subscribers/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

