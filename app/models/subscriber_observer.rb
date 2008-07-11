class SubscriberObserver < ActiveRecord::Observer

    def after_create(subscriber)
        Confirmer.deliver_sent :email
        subscriber.logger.warn("!!!!! email #{subscriber.email}")
    end

end
