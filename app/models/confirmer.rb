class Confirmer < ActionMailer::Base

    def sent(user_email)
        @recipients = user_email
        @subject    = 'Confirmation'
        @body       = {:user_email => user_email}
        @from       = 'spalsh@tsweb.toa'
        @sent_on    = Time.now
        @headers    = {}
    end
end
