class SubscribersController < ApplicationController

    # GET /subscribers/new
    # GET /subscribers/new.xml
    def new
        @subscriber = Subscriber.new
        session[:referrer] = request.referer
    end

    # POST /subscribers
    # POST /subscribers.xml
    def create
        @subscriber = Subscriber.new()

        @subscriber.ip = request.remote_ip
        @subscriber.referrer = session[:referrer]
        @subscriber.user_agent = request.user_agent
        @subscriber.email = params[:subscriber]

        if @subscriber.save
            flash[:notice] = 'Thank you. Email sent for you!'
            redirect_to (:action => 'new')
        else
            render(:action => 'new')
        end

    end

end
