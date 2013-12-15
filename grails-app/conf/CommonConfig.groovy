grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [html: ['text/html', 'application/xhtml+xml'],
        xml: ['text/xml', 'application/xml'],
        text: 'text/plain',
        js: 'text/javascript',
        rss: 'application/rss+xml',
        atom: 'application/atom+xml',
        css: 'text/css',
        csv: 'text/csv',
        all: '*/*',
        json: ['application/json', 'text/json'],
        form: 'application/x-www-form-urlencoded',
        multipartForm: 'multipart/form-data'
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart = false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// enable query caching by default
grails.hibernate.cache.queries = true

// set per-environment serverURL stem for creating absolute links
environments {
    development {
        grails.logging.jul.usebridge = true

        //grails.resources.debug = true
        grails.resources.processing.enabled = false
        grails.resources.adhoc.excludes = ['**/*.*']

        // cached-resources
        grails.resources.mappers.hashandcache.excludes = ['**/*.*']
        // resource bundling
        grails.resources.mappers.bundle.excludes = ['**/*.*']
        // zipped-resources
        grails.resources.mappers.zip.excludes = ['**/*.*']
        grails.plugin.databasemigration.updateOnStart = true
        grails.plugin.databasemigration.updateOnStartFileNames = ["changelog.groovy"]
    }
    production {
        grails.logging.jul.usebridge = false
        grails.plugin.databasemigration.updateOnStart = true
        grails.plugin.databasemigration.updateOnStartFileNames = ["changelog.groovy"]
    }
}

// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console
    // appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    error 'org.codehaus.groovy.grails.web.servlet',  //  controllers
            'org.codehaus.groovy.grails.web.pages', //  GSP
            'org.codehaus.groovy.grails.web.sitemesh', //  layouts
            'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
            'org.codehaus.groovy.grails.web.mapping', // URL mapping
            'org.codehaus.groovy.grails.commons', // core / classloading
            'org.codehaus.groovy.grails.plugins', // plugins
            'org.codehaus.groovy.grails.orm.hibernate', // hibernate integration
            'org.springframework',
            'org.hibernate',
            'net.sf.ehcache.hibernate'
}

simpleCaptcha {
    // font size used in CAPTCHA images
    fontSize = 30
    height = 200
    width = 200
    // number of characters in CAPTCHA text
    length = 6

    // amount of space between the bottom of the CAPTCHA text and the bottom of the CAPTCHA image
    bottomPadding = 16

    // distance between the diagonal lines used to obfuscate the text
    lineSpacing = 10

    // the charcters shown in the CAPTCHA text must be one of the following
    chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

    // this param will be passed as the first argument to this java.awt.Font constructor
    // http://docs.oracle.com/javase/6/docs/api/java/awt/Font.html#Font(java.lang.String,%20int,%20int)
    font = "Serif"
}

eshop.messages.file = new File("messageCodes")
eshop.messages.boundle = new File("grails-app/i18n/messages.properties")

rapidgrails.application.direction = "rtl"

// Added by the Spring Security Core plugin:
grails.plugins.springsecurity.userLookup.userDomainClassName = 'eshop.User'
grails.plugins.springsecurity.userLookup.authorityJoinClassName = 'eshop.UserRole'
grails.plugins.springsecurity.authority.className = 'eshop.Role'

auditLog.verbose = true

ckeditor {
    config = "/js/myckconfig.js"
    skipAllowedItemsCheck = false
    defaultFileBrowser = "ofm"
    upload {
        baseurl = "/image/get?path="
        overwrite = false
        link {
            browser = true
            upload = false
            allowed = []
            denied = ['html', 'htm', 'php', 'php2', 'php3', 'php4', 'php5',
                    'phtml', 'pwml', 'inc', 'asp', 'aspx', 'ascx', 'jsp',
                    'cfm', 'cfc', 'pl', 'bat', 'exe', 'com', 'dll', 'vbs', 'js', 'reg',
                    'cgi', 'htaccess', 'asis', 'sh', 'shtml', 'shtm', 'phtm']
        }
        image {
            browser = true
            upload = true
            allowed = ['jpg', 'gif', 'jpeg', 'png']
            denied = []
        }
        flash {
            browser = false
            upload = false
            allowed = ['swf']
            denied = []
        }
    }
}
//grails.commentable.poster.evaluator = { request.user }
grails.rateable.rater.evaluator = { request.user }


compress {
    // just in case for some reason you want to disable the filter
    enabled = true
    debug = false
    statsEnabled = true
    compressionThreshold = 1024
    // filter's url-patterns
    urlPatterns = ["/*"]
    // include and exclude are mutually exclusive
    includePathPatterns = []
    excludePathPatterns = [".*\\.gif", ".*\\.ico", ".*\\.jpg", ".*\\.swf"]
    // include and exclude are mutually exclusive
    includeContentTypes = []
    excludeContentTypes = ["image/png"]
    // include and exclude are mutually exclusive
    includeUserAgentPatterns = []
    excludeUserAgentPatterns = [".*MSIE 4.*"]
    // probably don't want these, but their available if needed
    javaUtilLogger = ""
    jakartaCommonsLogger = ""

    development {
        debug = true
        compressionThreshold = 2048
    }
    production {
        statsEnabled = false
    }
}

environments {
    development {
        uiperformance.enabled = false
    }
}
uiperformance.enabled = false
uiperformance.continueAfterMinifyJsError = true
uiperformance.keepOriginals = true
uiperformance.exclusions = [
        "**/plugins/ckeditor*/**",
        "**/angular.js"
]

grails.rest.injectInto = ["Controller", "Service", "Routes", "Job"]
