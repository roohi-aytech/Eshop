databaseChangeLog = {

    changeSet(author: "roohi (generated)", id: "1368638620071-1") {
        dropForeignKeyConstraint(baseTableName: "base_product_guarantee", baseTableSchemaName: "eshop", constraintName: "FK6679A54AC8A3F8DC")
    }

    changeSet(author: "roohi (generated)", id: "1368638620071-2") {
        dropForeignKeyConstraint(baseTableName: "base_product_guarantee", baseTableSchemaName: "eshop", constraintName: "FK6679A54A39250347")
    }

    changeSet(author: "roohi (generated)", id: "1368638620071-3") {
        dropTable(tableName: "base_product_guarantee")
    }

    changeSet(author: "Zohreh (generated)", id: "1368638620071-4") {
        addColumn(columnName: "guarantee",tableName: "product_type_brand")
    }

    changeSet(author: "Zohreh (generated)", id: "1368638620071-5") {
        dropColumn(columnName: "role",tableName: "producer_staff")
    }

    changeSet(author: "Zohreh (generated)", id: "1368638620071-6") {
        dropColumn(columnName: "indx",tableName: "producer_staff")
    }
}
