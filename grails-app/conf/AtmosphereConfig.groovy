atmospherePlugin {
    servlet {
    	// Servlet initialization parameters
    	initParams = ['org.atmosphere.useNative': 'true']
//    	initParams = []
    	urlPattern = '/atmosphere/*'
    }
    handlers {
    	// This closure is used to generate the atmosphere.xml using a MarkupBuilder instance in META-INF folder
    	atmosphereDotXml = {
        	//'atmosphere-handler'('context-root': '/atmosphere/chat', 'class-name': 'com.odelia.grails.plugins.atmosphere.ChatAtmosphereHandler')
    	}
    }
}