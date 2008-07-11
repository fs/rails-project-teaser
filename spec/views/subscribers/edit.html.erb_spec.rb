require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/subscribers/edit.html.erb" do
  include SubscribersHelper
  
  before do
    @subscriber = mock_model(Subscriber)
    @subscriber.stub!(:email).and_return("MyString")
    @subscriber.stub!(:ip).and_return("MyString")
    @subscriber.stub!(:user_agent).and_return("MyString")
    @subscriber.stub!(:referrer).and_return("MyString")
    assigns[:subscriber] = @subscriber
  end

  it "should render edit form" do
    render "/subscribers/edit.html.erb"
    
    response.should have_tag("form[action=#{subscriber_path(@subscriber)}][method=post]") do
      with_tag('input#subscriber_email[name=?]', "subscriber[email]")
      with_tag('input#subscriber_ip[name=?]', "subscriber[ip]")
      with_tag('input#subscriber_user_agent[name=?]', "subscriber[user_agent]")
      with_tag('input#subscriber_referrer[name=?]', "subscriber[referrer]")
    end
  end
end


