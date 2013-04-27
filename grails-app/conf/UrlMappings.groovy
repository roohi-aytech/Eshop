class UrlMappings {

	static mappings = {
        "/producer/list" {
            controller = "producer"
            action = "list"
        }
        "/order/list/$status/" {
            controller = "order"
            action = "list"
        }

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

        "/test/$id?"(controller: "/default", action: "test")

		"500"(view:'/error')
        "404"(controller: "/default", action:"underConstruction")
	}
}
