require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SubscribersController do
  describe "handling GET /subscribers" do

    before(:each) do
      @subscriber = mock_model(Subscriber)
      Subscriber.stub!(:find).and_return([@subscriber])
    end
  
    def do_get
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render index template" do
      do_get
      response.should render_template('index')
    end
  
    it "should find all subscribers" do
      Subscriber.should_receive(:find).with(:all).and_return([@subscriber])
      do_get
    end
  
    it "should assign the found subscribers for the view" do
      do_get
      assigns[:subscribers].should == [@subscriber]
    end
  end

  describe "handling GET /subscribers.xml" do

    before(:each) do
      @subscribers = mock("Array of Subscribers", :to_xml => "XML")
      Subscriber.stub!(:find).and_return(@subscribers)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all subscribers" do
      Subscriber.should_receive(:find).with(:all).and_return(@subscribers)
      do_get
    end
  
    it "should render the found subscribers as xml" do
      @subscribers.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /subscribers/1" do

    before(:each) do
      @subscriber = mock_model(Subscriber)
      Subscriber.stub!(:find).and_return(@subscriber)
    end
  
    def do_get
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render show template" do
      do_get
      response.should render_template('show')
    end
  
    it "should find the subscriber requested" do
      Subscriber.should_receive(:find).with("1").and_return(@subscriber)
      do_get
    end
  
    it "should assign the found subscriber for the view" do
      do_get
      assigns[:subscriber].should equal(@subscriber)
    end
  end

  describe "handling GET /subscribers/1.xml" do

    before(:each) do
      @subscriber = mock_model(Subscriber, :to_xml => "XML")
      Subscriber.stub!(:find).and_return(@subscriber)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the subscriber requested" do
      Subscriber.should_receive(:find).with("1").and_return(@subscriber)
      do_get
    end
  
    it "should render the found subscriber as xml" do
      @subscriber.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /subscribers/new" do

    before(:each) do
      @subscriber = mock_model(Subscriber)
      Subscriber.stub!(:new).and_return(@subscriber)
    end
  
    def do_get
      get :new
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render new template" do
      do_get
      response.should render_template('new')
    end
  
    it "should create an new subscriber" do
      Subscriber.should_receive(:new).and_return(@subscriber)
      do_get
    end
  
    it "should not save the new subscriber" do
      @subscriber.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new subscriber for the view" do
      do_get
      assigns[:subscriber].should equal(@subscriber)
    end
  end

  describe "handling GET /subscribers/1/edit" do

    before(:each) do
      @subscriber = mock_model(Subscriber)
      Subscriber.stub!(:find).and_return(@subscriber)
    end
  
    def do_get
      get :edit, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render edit template" do
      do_get
      response.should render_template('edit')
    end
  
    it "should find the subscriber requested" do
      Subscriber.should_receive(:find).and_return(@subscriber)
      do_get
    end
  
    it "should assign the found Subscriber for the view" do
      do_get
      assigns[:subscriber].should equal(@subscriber)
    end
  end

  describe "handling POST /subscribers" do

    before(:each) do
      @subscriber = mock_model(Subscriber, :to_param => "1")
      Subscriber.stub!(:new).and_return(@subscriber)
    end
    
    describe "with successful save" do
  
      def do_post
        @subscriber.should_receive(:save).and_return(true)
        post :create, :subscriber => {}
      end
  
      it "should create a new subscriber" do
        Subscriber.should_receive(:new).with({}).and_return(@subscriber)
        do_post
      end

      it "should redirect to the new subscriber" do
        do_post
        response.should redirect_to(subscriber_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @subscriber.should_receive(:save).and_return(false)
        post :create, :subscriber => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /subscribers/1" do

    before(:each) do
      @subscriber = mock_model(Subscriber, :to_param => "1")
      Subscriber.stub!(:find).and_return(@subscriber)
    end
    
    describe "with successful update" do

      def do_put
        @subscriber.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the subscriber requested" do
        Subscriber.should_receive(:find).with("1").and_return(@subscriber)
        do_put
      end

      it "should update the found subscriber" do
        do_put
        assigns(:subscriber).should equal(@subscriber)
      end

      it "should assign the found subscriber for the view" do
        do_put
        assigns(:subscriber).should equal(@subscriber)
      end

      it "should redirect to the subscriber" do
        do_put
        response.should redirect_to(subscriber_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @subscriber.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /subscribers/1" do

    before(:each) do
      @subscriber = mock_model(Subscriber, :destroy => true)
      Subscriber.stub!(:find).and_return(@subscriber)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the subscriber requested" do
      Subscriber.should_receive(:find).with("1").and_return(@subscriber)
      do_delete
    end
  
    it "should call destroy on the found subscriber" do
      @subscriber.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the subscribers list" do
      do_delete
      response.should redirect_to(subscribers_url)
    end
  end
end
