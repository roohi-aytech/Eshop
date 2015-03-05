package eshop

/**
 * Created by farzin on 04/03/2015.
 */
class InternalLink {

    public InternalLink(String title, String controller, String action, Map params) {
        this.title = title
        this.controller = controller
        this.action = action
        this.params = params
    }

    public InternalLink(String title, String uri) {
        this.title = title
        this.uri = uri
    }

    private String title
    private String controller
    private String action
    private Map params
    private String uri

    public String getTitle() { title }

    public String getController() { controller }

    public String getAction() { action }

    public Map getParams() { params }

    public String getUri() { uri }

}
