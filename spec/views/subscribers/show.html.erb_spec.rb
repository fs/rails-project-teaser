require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/subscribers/show.html.erb" do
  include SubscribersHelper
  
  before(:each) do
    @subscriber = mock_model(Subscriber)
    @subscriber.stub!(:email).and_return("MyString")
    @subscriber.stub!(:ip).and_return("MyString")
    @subscriber.stub!(:user_agent).and_return("MyString")
    @subscriber.stub!(:referrer).and_return("MyString")

    assigns[:subscriber] = @subscriber
  end

  it "should render attributes in <p>" do
    render "/subscribers/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

