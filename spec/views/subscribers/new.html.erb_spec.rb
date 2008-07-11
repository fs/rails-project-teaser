require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/subscribers/new.html.erb" do
  include SubscribersHelper
  
  before(:each) do
    @subscriber = mock_model(Subscriber)
    @subscriber.stub!(:new_record?).and_return(true)
    @subscriber.stub!(:email).and_return("MyString")
    @subscriber.stub!(:ip).and_return("MyString")
    @subscriber.stub!(:user_agent).and_return("MyString")
    @subscriber.stub!(:referrer).and_return("MyString")
    assigns[:subscriber] = @subscriber
  end

  it "should render new form" do
    render "/subscribers/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", subscribers_path) do
      with_tag("input#subscriber_email[name=?]", "subscriber[email]")
      with_tag("input#subscriber_ip[name=?]", "subscriber[ip]")
      with_tag("input#subscriber_user_agent[name=?]", "subscriber[user_agent]")
      with_tag("input#subscriber_referrer[name=?]", "subscriber[referrer]")
    end
  end
end


