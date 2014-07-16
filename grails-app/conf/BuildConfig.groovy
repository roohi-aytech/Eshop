grails.servlet.version = "3.0" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.target.level = 1.6
grails.project.source.level = 1.6
//grails.tomcat.nio = true
//grails.server.port.http = 80
//grails.server.host = "local.zanbil.ir"

//grails.project.war.file = "target/${appName}-${appVersion}.war"
grails.war.resources = { stagingDir ->
    delete(file: "${stagingDir}/WEB-INF/lib/ext-impl.jar")
    delete(file: "${stagingDir}/WEB-INF/lib/ext-service.jar")
    delete(file: "${stagingDir}/WEB-INF/lib/portal-service.jar")
    delete(file: "${stagingDir}/WEB-INF/lib/portal-impl.jar")
    delete(file: "${stagingDir}/WEB-INF/lib/portal-kernel.jar")
    delete(file: "${stagingDir}/WEB-INF/lib/util-java.jar")
}
grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // specify dependency exclusions here; for example, uncomment this to disable ehcache:
        excludes 'commons-logging'
    }
    log "error" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve

    repositories {
        inherits true // Whether to inherit repository definitions from plugins

        grailsPlugins()
        grailsHome()
        grailsCentral()
//        flatDir dir: 'lib'
        mavenLocal()
        mavenCentral()

        // uncomment these (or add new ones) to enable remote dependency resolution from public Maven repositories
        //mavenRepo "http://snapshots.repository.codehaus.org"
        //mavenRepo "http://repository.codehaus.org"
        //mavenRepo "http://download.java.net/maven/2/"
        //mavenRepo "http://repository.jboss.com/maven2/"
    }
    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes eg.
//        runtime "net.sf.jasperreports:jasperreports:3.7.6"
//        compile "net.sf.jasperreports:jasperreports:3.7.6"
        runtime 'mysql:mysql-connector-java:5.1.25'
        runtime "org.mongodb:mongo-java-driver:2.9.1"
        compile "org.mongodb:mongo-java-driver:2.9.1"
        runtime "com.gmongo:gmongo:1.0"

        compile 'org.apache.activemq:activemq-core:5.3.0'

        build "org.scribe:scribe:1.2.1"
        runtime "org.scribe:scribe:1.2.1"

//        compile ":ws-client:1.0"

        build 'xerces:xercesImpl:2.9.0'
        runtime 'xerces:xercesImpl:2.9.0'
        compile 'com.itextpdf:itextpdf:5.4.2'
        build 'com.itextpdf:itextpdf:5.4.2'
        runtime 'com.itextpdf:itextpdf:5.4.2'

    }

    plugins {
        runtime ":hibernate:$grailsVersion"
        runtime ":jquery:1.7.2"
        runtime ":resources:1.1.6"

        build ":tomcat:$grailsVersion"

        compile ":ws-client:1.0"

        runtime ":database-migration:1.1"

        compile ':cache:1.1.1'
        compile ":cache-ehcache:1.0.0"
        compile ":ckeditor:3.6.2.2"
        compile(":mongodb:1.0.0.GA") {
            excludes 'mongo-java-driver', 'gmongo'
        }

        compile ":events-push:1.0.M7"

        build(":release:2.0.4",
                ":rest-client-builder:1.0.2") {
            export = false
        }

        compile ":mail:1.0.1"
        compile ":rest:0.6.1"
        runtime ":resources:1.2.RC2"
        compile ":rendering:0.4.4"

        runtime ":cors:1.1.4"

        compile ":jxl:0.54"
        compile ":pretty-time:2.1.3.Final-1.0.1"
//        compile ":excel-import:1.0.0"//  {excludes "xmlbeans"}
//        compile ":joda-time:1.4"
    }
}
grails.plugin.location.RapidGrails = "../RapidGrails"