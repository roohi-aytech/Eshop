databaseChangeLog = {

    changeSet(author: "roohi (generated)", id: "1369284220956-1") {
        dropNotNullConstraint(columnDataType: "bit", columnName: "deleted", tableName: "attribute_category")
    }

    changeSet(author: "roohi (generated)", id: "1369284220956-2") {
        dropNotNullConstraint(columnDataType: "bit", columnName: "deleted", tableName: "attribute_type")
    }

    changeSet(author: "roohi (generated)", id: "1369284220956-3") {
        dropNotNullConstraint(columnDataType: "bit", columnName: "deleted", tableName: "attribute_value")
    }

    changeSet(author: "Zohreh (generated)", id: "1369284220956-4") {
        dropColumn(columnName: "added_value",tableName: "producing_product")

    }

    changeSet(author: "Zohreh (generated)", id: "1369284220956-5") {
        dropColumn(columnName: "transportation_cost",tableName: "producing_product")

    }
    changeSet(author: "Zohreh (generated)", id: "1369284220956-6") {
        dropColumn(columnName: "indx",tableName: "producer_staff")

    }
}
