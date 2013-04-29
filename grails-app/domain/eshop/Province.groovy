package eshop

import org.apache.commons.collections.FactoryUtils
import org.apache.commons.collections.list.LazyList

class Province {
    String title;

    static hasMany = [cities: City]
    static composites = ["cities"]
    List cities = LazyList.decorate(new ArrayList(), FactoryUtils.instantiateFactory(City.class))

    static constraints = {
        title(nullable: false)
    }

    static mapping = {
        sort 'title'
        cities cascade: "all-delete-orphan"
    }
}
