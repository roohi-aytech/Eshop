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
}
