package eshop
import org.springframework.context.i18n.LocaleContextHolder as LCH
class Role {
    def messageSource
    String authority

    static mapping = {
        cache true
    }

    static constraints = {
        authority blank: false, unique: true
    }
    String toString(){
        authority
    }
}
