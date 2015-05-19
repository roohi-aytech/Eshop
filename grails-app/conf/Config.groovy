import org.codehaus.groovy.grails.compiler.GrailsClassLoader

instance = "Zanbil"


def classLoader = new GrailsClassLoader()
grails.config.locations = [
        CommonConfig,
        classLoader.loadClass("${instance}Config"),
        classLoader.loadClass("${instance}DataSource"),
        classLoader.loadClass("${instance}MailConfig"),
        classLoader.loadClass("${instance}SocialConfig"),
]


