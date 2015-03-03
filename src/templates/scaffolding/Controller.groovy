<%=packageName ? "package ${packageName}\n\n" : ''%>import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON

class ${className}Controller {

    static allowedMethods = [save: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def form(){
        def ${propertyName}
        if(params.id)
            ${propertyName} = ${className}.get(params.id)
        else
            ${propertyName} = new ${className}()
        render(template: "form", model: [${propertyName}: ${propertyName}])
    }

    def list() {
    }

    def save() {
        def ${propertyName}
        if(params.id){
            ${propertyName} = ${className}.get(params.id)
            ${propertyName}.properties = params
        }
        else
            ${propertyName} = new ${className}(params)
        if(${propertyName}.validate() && ${propertyName}.save()){
            render ${propertyName} as JSON
        }
        else
            render(template: "form", model: [${propertyName}: ${propertyName}])
    }


    def delete() {
        def ${propertyName} = ${className}.get(params.id)
        ${propertyName}.delete(flush: true)
        render 0
    }
}
