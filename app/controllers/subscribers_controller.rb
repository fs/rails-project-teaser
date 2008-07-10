class SubscribersController < ApplicationController

    # GET /subscribers/new
    # GET /subscribers/new.xml
    def new
        @subscriber = Subscriber.new
        @subscriber.referrer = request.referer
    end

    # POST /subscribers
    # POST /subscribers.xml
    def create
        @subscriber = Subscriber.new(params[:subscriber])

        @subscriber.ip = request.remote_ip
        @subscriber.user_agent = request.user_agent

        if @subscriber.save
            flash[:notice] = 'thank you'
            redirect_to (:action => 'new')
        else
            flash[:notice] = 'error'           
            render(:action => 'new')
        end

    end

end
