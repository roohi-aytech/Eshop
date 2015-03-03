databaseChangeLog = {

    changeSet(author: "roohi (generated)", id: "1368281673693-1") {
        dropNotNullConstraint(columnDataType: "varchar(255)", columnName: "name", tableName: "attribute_category")
    }

    changeSet(author: "roohi (generated)", id: "1368281673693-2") {
        addNotNullConstraint(columnDataType: "double precision", columnName: "discount", tableName: "producing_product")
    }

    changeSet(author: "roohi (generated)", id: "1368281673693-3") {
        dropNotNullConstraint(columnDataType: "varchar(7)", columnName: "discount_type", tableName: "producing_product")
    }

    changeSet(author: "roohi (generated)", id: "1368281673693-4") {
        dropNotNullConstraint(columnDataType: "varchar(10)", columnName: "price_type", tableName: "producing_product")
    }

    changeSet(author: "roohi (generated)", id: "1368281673693-5") {
        dropNotNullConstraint(columnDataType: "varchar(3)", columnName: "refundable", tableName: "producing_product")
    }

    changeSet(author: "roohi (generated)", id: "1368281673693-6") {
        dropNotNullConstraint(columnDataType: "longblob", columnName: "image", tableName: "slide")
    }

//    changeSet(author: "roohi (generated)", id: "1368281673693-7") {
//        dropForeignKeyConstraint(baseTableName: "address", baseTableSchemaName: "eshop", constraintName: "FKBB979BF4CA1C5F8D")
//    }
//
//    changeSet(author: "roohi (generated)", id: "1368281673693-8") {
//        dropForeignKeyConstraint(baseTableName: "order_item", baseTableSchemaName: "eshop", constraintName: "FK2D110D6438E95527")
//    }
//
//    changeSet(author: "roohi (generated)", id: "1368281673693-9") {
//        dropForeignKeyConstraint(baseTableName: "price_variation_value", baseTableSchemaName: "eshop", constraintName: "FK492AD14F6366C88C")
//    }
//
//    changeSet(author: "roohi (generated)", id: "1368281673693-10") {
//        dropForeignKeyConstraint(baseTableName: "price_variation_value", baseTableSchemaName: "eshop", constraintName: "FK492AD14FBC24B806")
//    }
//
//    changeSet(author: "roohi (generated)", id: "1368281673693-11") {
//        dropForeignKeyConstraint(baseTableName: "producer_producing_product", baseTableSchemaName: "eshop", constraintName: "FK466770E02EDE84AC")
//    }
//
//    changeSet(author: "roohi (generated)", id: "1368281673693-12") {
//        dropForeignKeyConstraint(baseTableName: "producer_producing_product", baseTableSchemaName: "eshop", constraintName: "FK466770E09C83CBB2")
//    }
//
//    changeSet(author: "roohi (generated)", id: "1368281673693-13") {
//        dropForeignKeyConstraint(baseTableName: "producer_product", baseTableSchemaName: "eshop", constraintName: "FKC811914293DDA40E")
//    }
//
//    changeSet(author: "roohi (generated)", id: "1368281673693-14") {
//        dropForeignKeyConstraint(baseTableName: "producer_product", baseTableSchemaName: "eshop", constraintName: "FKC811914238E95527")
//    }
//
//    changeSet(author: "roohi (generated)", id: "1368281673693-15") {
//        dropForeignKeyConstraint(baseTableName: "producer_type", baseTableSchemaName: "eshop", constraintName: "FK587263C7E3766C4D")
//    }
//
//    changeSet(author: "roohi (generated)", id: "1368281673693-16") {
//        dropForeignKeyConstraint(baseTableName: "producing_product", baseTableSchemaName: "eshop", constraintName: "FK14A2B84D38E95527")
//    }
//
//    changeSet(author: "roohi (generated)", id: "1368281673693-17") {
//        dropForeignKeyConstraint(baseTableName: "producing_product", baseTableSchemaName: "eshop", constraintName: "FK14A2B84DBC34C506")
//    }
//
//    changeSet(author: "roohi (generated)", id: "1368281673693-18") {
//        dropForeignKeyConstraint(baseTableName: "user", baseTableSchemaName: "eshop", constraintName: "FK36EBCBCFA0A34B")
//    }
//
//    changeSet(author: "roohi (generated)", id: "1368281673693-19") {
//        dropForeignKeyConstraint(baseTableName: "user", baseTableSchemaName: "eshop", constraintName: "FK36EBCB8EF1990C")
//    }

    changeSet(author: "roohi (generated)", id: "1368281673693-20") {
        dropIndex(indexName: "FKC51B9EEB3734BD67", tableName: "product_closure")
    }

    changeSet(author: "roohi (generated)", id: "1368281673693-21") {
        dropIndex(indexName: "FKC51B9EEB38E95527", tableName: "product_closure")
    }

    changeSet(author: "roohi (generated)", id: "1368281673693-22") {
        dropIndex(indexName: "FKC51B9EEBBC34C506", tableName: "product_closure")
    }

    changeSet(author: "roohi (generated)", id: "1368281673693-23") {
        createIndex(indexName: "unique-value", tableName: "variation_value") {
            column(name: "variation_group_id")

            column(name: "value")
        }
    }

//    changeSet(author: "roohi (generated)", id: "1368281673693-24") {
//        dropColumn(columnName: "province_id", tableName: "address")
//    }

    changeSet(author: "roohi (generated)", id: "1368281673693-25") {
        dropColumn(columnName: "default_value", tableName: "attribute_type")
    }

    changeSet(author: "roohi (generated)", id: "1368281673693-26") {
        dropColumn(columnName: "type", tableName: "base_product")
    }

    changeSet(author: "roohi (generated)", id: "1368281673693-27") {
        dropColumn(columnName: "image", tableName: "discount")
    }

//    changeSet(author: "roohi (generated)", id: "1368281673693-28") {
//        dropColumn(columnName: "product_id", tableName: "order_item")
//    }

//    changeSet(author: "roohi (generated)", id: "1368281673693-29") {
//        dropColumn(columnName: "default_price", tableName: "price")
//    }

//    changeSet(author: "roohi (generated)", id: "1368281673693-30") {
//        dropColumn(columnName: "product_id", tableName: "price")
//    }

    changeSet(author: "roohi (generated)", id: "1368281673693-31") {
        dropColumn(columnName: "delivery", tableName: "producer")
    }

//    changeSet(author: "roohi (generated)", id: "1368281673693-32") {
//        dropColumn(columnName: "producer_id", tableName: "producer_type")
//    }

    changeSet(author: "roohi (generated)", id: "1368281673693-33") {
        dropColumn(columnName: "paid_off", tableName: "producing_product")
    }

//    changeSet(author: "roohi (generated)", id: "1368281673693-34") {
//        dropColumn(columnName: "product_id", tableName: "producing_product")
//    }

//    changeSet(author: "roohi (generated)", id: "1368281673693-35") {
//        dropColumn(columnName: "product_type_id", tableName: "producing_product")
//    }

//    changeSet(author: "roohi (generated)", id: "1368281673693-36") {
//        dropColumn(columnName: "billing_address_id", tableName: "user")
//    }

//    changeSet(author: "roohi (generated)", id: "1368281673693-37") {
//        dropColumn(columnName: "sending_address_id", tableName: "user")
//    }

    changeSet(author: "roohi (generated)", id: "1368281673693-38") {
        dropTable(tableName: "price_variation_value")
    }

    changeSet(author: "roohi (generated)", id: "1368281673693-39") {
        dropTable(tableName: "producer_producing_product")
    }

    changeSet(author: "roohi (generated)", id: "1368281673693-40") {
        dropTable(tableName: "producer_product")
    }

    changeSet(author: "roohi (generated)", id: "1368281673693-41") {
        dropTable(tableName: "product_closure")
    }
}
