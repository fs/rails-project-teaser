class Confirmer < ActionMailer::Base

    def sent(user_email)
        @subject    = 'Thank you for using our site!!!'
        @body       = { }
        @recipients = user_email
        @from       = 'spalsh@test.net'
        @sent_on    = Time.now
        @headers    = {}
    end

end