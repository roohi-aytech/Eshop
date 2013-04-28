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

    def underConstruction(){
        render(view: "/underConstruction")
    }

    def test(){
        render(view: "/test")
    }
}
