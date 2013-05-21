package eshop

import org.apache.commons.collections.list.LazyList
import org.apache.commons.collections.FactoryUtils

class VariationGroup {
    static auditable = true
    String name
    String representationType

    static hasMany = [variationValues: VariationValue, variations: Variation]
    static composites = ["variationValues"]
    List variationValues = LazyList.decorate(new ArrayList(), FactoryUtils.instantiateFactory(VariationValue.class))
    static mapping = {
        sort 'name'
        variationValues cascade: "all-delete-orphan"
    }

//    static searchable=true

    static constraints = {
        name()
        representationType(inList: ["String", "Color"])
        variationValues()
    }
    static ignoredFieldsInJSON=["variations"]
    String toString() {
        name
    }
}
