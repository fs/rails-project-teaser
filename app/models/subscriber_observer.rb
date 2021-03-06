class SubscriberObserver < ActiveRecord::Observer

    def after_create(subscriber)
        Confirmer.deliver_sent(subscriber.email)
        subscriber.logger.warn("sent email for #{subscriber.email}")
    end

end
