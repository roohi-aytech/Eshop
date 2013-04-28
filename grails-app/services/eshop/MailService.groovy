package eshop

class MailService {

    def send(to, subject, body) {
        sendMail {
            to "fred@g2one.com","ginger@g2one.com"
            subject "Hello to mutliple recipients"
            body "Hello Fred! Hello Ginger!"
        }
    }
}
