class UrlMappings {

	static mappings = {
		"/site/browse/$productType/" {
            controller = "site"
            action = "browse"
        }

        "/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"( controller: "/site")

        "/admin"(controller: "/default")

		"500"(view:'/error')
	}
}
