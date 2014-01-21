import org.codehaus.groovy.grails.compiler.GrailsClassLoader

instance = "ZanbilTest"


def classLoader = new GrailsClassLoader()
grails.config.locations = [
        CommonConfig,
        classLoader.loadClass("${instance}Config"),
        classLoader.loadClass("${instance}DataSource"),
        classLoader.loadClass("${instance}MailConfig"),
        classLoader.loadClass("${instance}SocialConfig"),
]


