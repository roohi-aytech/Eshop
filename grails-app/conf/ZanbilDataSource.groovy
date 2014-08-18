
/**
 * Created with IntelliJ IDEA.
 * User: Farzin
 * Date: 11/30/13
 * Time: 1:14 AM
 * To change this template use File | Settings | File Templates.
 */
dataSource {
    pooled = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}

grails {
    mongo {
        host = "127.0.0.1"
        username = "roohi"
        password = ""
	options {
            autoConnectRetry = true
            connectTimeout = 300
     	    connectionsPerHost = 1900
	}
    }
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update"
            url = "jdbc:mysql://localhost/eshop?useUnicode=true&characterEncoding=UTF-8"
            username = "root"
            password = ""
            pooled = true
            logSql = false
            driverClassName = "com.mysql.jdbc.Driver"
            dialect = "org.hibernate.dialect.MySQLMyISAMDialect"
            properties {
                maxActive = -1
                minEvictableIdleTimeMillis = 1800000
                timeBetweenEvictionRunsMillis = 1800000
                numTestsPerEvictionRun = 3
                testOnBorrow = true
                testWhileIdle = true
                testOnReturn = true
                validationQuery = "SELECT 1"
            }

        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            dialect = "org.hibernate.dialect.MySQL5Dialect"
            jndiName = "java:comp/env/jdbc/EshopPool"

            properties {
                maxActive = -1
                minEvictableIdleTimeMillis = 1800000
                timeBetweenEvictionRunsMillis = 1800000
                numTestsPerEvictionRun = 3
                testOnBorrow = true
                testWhileIdle = true
                testOnReturn = true
                validationQuery = "SELECT 1"
            }
        }
    }
}
