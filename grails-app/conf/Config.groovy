import org.codehaus.groovy.grails.compiler.GrailsClassLoader

instance = "Felfel"

def classLoader = new GrailsClassLoader()
grails.config.locations = [
        classLoader.loadClass("${instance}BuildConfig"),
        CommonConfig,
        classLoader.loadClass("${instance}Config"),
        classLoader.loadClass("${instance}DataSource"),
        classLoader.loadClass("${instance}MailConfig"),
        classLoader.loadClass("${instance}SocialConfig"),
]


