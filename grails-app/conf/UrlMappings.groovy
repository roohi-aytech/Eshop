class UrlMappings {

	static mappings = {

        "/browse/$productType/" {
            controller = "site"
            action = "browse"
        }

        "/filter" {
            controller = "site"
            action = "filter"
        }

        "/search" {
            controller = "site"
            action = "search"
        }

        "/product/$id?" {
            controller = "site"
            action = "product"
        }

        "/product/$action?" {
            controller = "product"
        }

        "/article/$id?" {
            controller = "site"
            action = "article"
        }

        "/producer/list" {
            controller = "producer"
            action = "list"
        }

        "/orderAdministration/list/$status/" {
            controller = "orderAdministration"
            action = "list"
        }

        "/order/list/$status/" {
            controller = "order"
            action = "list"
        }

//        static pages
        "/contactUs"{
            controller = "site"
            action = "contactUs"
        }

//        default mapping
        "/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"( controller: "/site")

//        "/changeLog"( controller: "/default", action:"changeLog" )

        "/admin"(controller: "/default")

        "/test/$id?"(controller: "/default", action: "test")

		"500"(view:'/error')
        "404"(controller: "/default", action:"underConstruction")
	}
}
