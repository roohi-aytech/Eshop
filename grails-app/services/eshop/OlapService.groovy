package eshop

import org.olap4j.OlapWrapper
import java.sql.DriverManager
import org.olap4j.OlapConnection
import org.olap4j.CellSet
import org.olap4j.CellSetAxis
import org.olap4j.Cell
import org.olap4j.Position
import org.olap4j.metadata.Member
import mondrian.olap.Property
import org.olap4j.metadata.Property

class OlapService {

    def productTypes(params) {
        def productTypeId = params.browsingProductTypeId
        def result = []
        Class.forName("mondrian.olap4j.MondrianOlap4jDriver")

        OlapWrapper rConnection = (OlapWrapper) DriverManager.getConnection("jdbc:mondrian:JdbcDrivers=com.mysql.jdbc.Driver;Jdbc=jdbc:mysql://localhost/eshop?user=root&password=Salam123;Catalog=file:EShopOlap.xml;")
        OlapConnection oConnection = rConnection.unwrap(OlapConnection.class)

        def productType = ProductType.get(productTypeId)
        def h = ""
        while (productType != null) {
            h = ".&[${productType.id}]${h}"
            productType = productType.parentProduct
        }

        def whereClause = ""
        if (params.browsingBrandId) {
            def browsingBrandId = Integer.valueOf(params.browsingBrandId)
            if (browsingBrandId != -1)
                whereClause = "WHERE [Brand].&[${Brand.get(browsingBrandId).name}]"
        }
        String query = "SELECT [Product Type]${h}.children on COLUMNS FROM [Products] ${whereClause}"
        CellSet cellSet = ExecuteMDX(oConnection, query)
        CellSetAxis axis = cellSet.getAxes()[0]

        axis.positions.each { Position position ->
            Member member = position.getMembers()[0]
            def key = member.getPropertyValue(Property.StandardMemberProperty.MEMBER_KEY)
            def name = member.getPropertyValue(Property.StandardMemberProperty.MEMBER_NAME)
            Cell cell = cellSet.getCell(position)
            def value = cell.value

            if (value)
                result << [id: key, name: name, value: value]
        }
        result
    }

    def brands(params) {
        def result = []
        Class.forName("mondrian.olap4j.MondrianOlap4jDriver")

        OlapWrapper rConnection = (OlapWrapper) DriverManager.getConnection("jdbc:mondrian:JdbcDrivers=com.mysql.jdbc.Driver;Jdbc=jdbc:mysql://localhost/eshop?user=root&password=Salam123;Catalog=file:EShopOlap.xml;")
        OlapConnection oConnection = rConnection.unwrap(OlapConnection.class)

        def productType = ProductType.get(params.browsingProductTypeId)
        def h = ""
        while (productType != null) {
            h = ".&[${productType.id}]${h}"
            productType = productType.parentProduct
        }

        def whereClause = "WHERE [Product Type]${h}"

        String query = "SELECT [Brand].Children on COLUMNS FROM [Products] ${whereClause}"
        CellSet cellSet = ExecuteMDX(oConnection, query)
        CellSetAxis axis = cellSet.getAxes()[0]

        axis.positions.each { Position position ->
            Member member = position.getMembers()[0]
            def key = member.getPropertyValue(Property.StandardMemberProperty.MEMBER_KEY)
            def name = member.getPropertyValue(Property.StandardMemberProperty.MEMBER_NAME)
            Cell cell = cellSet.getCell(position)
            def value = cell.value

            if (value)
                result << [id: key, name: name, value: value]
        }
        result
    }



    def ExecuteMDX(OlapConnection oConnection, String query) {
        oConnection.prepareOlapStatement(query).executeQuery();
    }
}
