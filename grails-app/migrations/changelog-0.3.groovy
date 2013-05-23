databaseChangeLog = {

    changeSet(author: "roohi (generated)", id: "1369222671353-1") {
        dropNotNullConstraint(columnDataType: "bigint", columnName: "attribute_type_id", tableName: "attribute")
    }

    changeSet(author: "roohi (generated)", id: "1369222671353-2") {
        dropNotNullConstraint(columnDataType: "varchar(255)", columnName: "period", tableName: "guarantee")
    }

    changeSet(author: "roohi (generated)", id: "1369222671353-3") {
        dropNotNullConstraint(columnDataType: "varchar(6)", columnName: "sex", tableName: "producer_staff")
    }

    changeSet(author: "roohi (generated)", id: "1369222671353-4") {
        dropNotNullConstraint(columnDataType: "varchar(255)", columnName: "cooperation_price", tableName: "producing_product")
    }

    changeSet(author: "roohi (generated)", id: "1369222671353-5") {
        dropNotNullConstraint(columnDataType: "varchar(3)", columnName: "test_period", tableName: "producing_product")
    }

    changeSet(author: "roohi (generated)", id: "1369222671353-6") {
        dropForeignKeyConstraint(baseTableName: "guarantee_product_type_brand", baseTableSchemaName: "eshop", constraintName: "FK6D6F82A9EA49FBA5")
    }

    changeSet(author: "roohi (generated)", id: "1369222671353-7") {
        dropForeignKeyConstraint(baseTableName: "guarantee_product_type_brand", baseTableSchemaName: "eshop", constraintName: "FK6D6F82A9FAA9C1F9")
    }

    changeSet(author: "roohi (generated)", id: "1369222671353-8") {
        dropColumn(columnName: "logo", tableName: "producer")
    }

    changeSet(author: "roohi (generated)", id: "1369222671353-9") {
        dropColumn(columnName: "indx", tableName: "product_type_brand")
    }

    changeSet(author: "roohi (generated)", id: "1369222671353-10") {
        dropTable(tableName: "guarantee_product_type_brand")
    }
}
