require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SubscribersController do
  describe "route generation" do

    it "should map { :controller => 'subscribers', :action => 'index' } to /subscribers" do
      route_for(:controller => "subscribers", :action => "index").should == "/subscribers"
    end
  
    it "should map { :controller => 'subscribers', :action => 'new' } to /subscribers/new" do
      route_for(:controller => "subscribers", :action => "new").should == "/subscribers/new"
    end
  
    it "should map { :controller => 'subscribers', :action => 'show', :id => 1 } to /subscribers/1" do
      route_for(:controller => "subscribers", :action => "show", :id => 1).should == "/subscribers/1"
    end
  
    it "should map { :controller => 'subscribers', :action => 'edit', :id => 1 } to /subscribers/1/edit" do
      route_for(:controller => "subscribers", :action => "edit", :id => 1).should == "/subscribers/1/edit"
    end
  
    it "should map { :controller => 'subscribers', :action => 'update', :id => 1} to /subscribers/1" do
      route_for(:controller => "subscribers", :action => "update", :id => 1).should == "/subscribers/1"
    end
  
    it "should map { :controller => 'subscribers', :action => 'destroy', :id => 1} to /subscribers/1" do
      route_for(:controller => "subscribers", :action => "destroy", :id => 1).should == "/subscribers/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'subscribers', action => 'index' } from GET /subscribers" do
      params_from(:get, "/subscribers").should == {:controller => "subscribers", :action => "index"}
    end
  
    it "should generate params { :controller => 'subscribers', action => 'new' } from GET /subscribers/new" do
      params_from(:get, "/subscribers/new").should == {:controller => "subscribers", :action => "new"}
    end
  
    it "should generate params { :controller => 'subscribers', action => 'create' } from POST /subscribers" do
      params_from(:post, "/subscribers").should == {:controller => "subscribers", :action => "create"}
    end
  
    it "should generate params { :controller => 'subscribers', action => 'show', id => '1' } from GET /subscribers/1" do
      params_from(:get, "/subscribers/1").should == {:controller => "subscribers", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'subscribers', action => 'edit', id => '1' } from GET /subscribers/1;edit" do
      params_from(:get, "/subscribers/1/edit").should == {:controller => "subscribers", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'subscribers', action => 'update', id => '1' } from PUT /subscribers/1" do
      params_from(:put, "/subscribers/1").should == {:controller => "subscribers", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'subscribers', action => 'destroy', id => '1' } from DELETE /subscribers/1" do
      params_from(:delete, "/subscribers/1").should == {:controller => "subscribers", :action => "destroy", :id => "1"}
    end
  end
end
