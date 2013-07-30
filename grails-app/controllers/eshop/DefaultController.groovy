package eshop

class DefaultController {

    def index() {
        if (session.forwardUri)
        {
            def url = session.forwardUri
            session.forwardUri = null
            url = url.replace(request.contextPath, "")
            redirect url: url
        }
        else
            render(view: "/index")
    }

    def notFound(){
        response.status = 404
        render(view: "/notFound")
    }

    def changeLog(){
        render(view: "/changeLog")
    }

    def samandehi(){
        render view: "/samandehi"
    }

    def test(){
        render(view: "/test")
    }

    def socialAuth(){
        render(view: "/socialAuth")
    }
}
