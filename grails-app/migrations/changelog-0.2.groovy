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
}
