class SubscribersController < ApplicationController

    # GET /subscribers/new
    # GET /subscribers/new.xml
    def new
        @subscriber = Subscriber.new
        @subscriber.referrer = request.referer

        respond_to do |format|
            format.html # new.html.erb
            format.xml  { render :xml => @subscriber }
        end
    end

    # POST /subscribers
    # POST /subscribers.xml
    def create
        @subscriber = Subscriber.new(params[:subscriber])

        @subscriber.ip = request.remote_ip
        @subscriber.user_agent = request.user_agent
               
        #respond_to do |format|
            if @subscriber.save
                flash[:notice] = 'Subscriber was successfully created.'
                #redirect_to ( :action => 'new')
                #format.html { redirect_to(@subscriber) }
                #format.xml  { render :xml => @subscriber, :status => :created, :location => @subscriber }
            else
                #flash[:notice] = 'error'           
                render( :action => 'new' )
            end
        #end
    end

end
