{
	dataSource : {
		type : "org.apache.commons.dbcp.BasicDataSource",
		events : {
			depose : 'close'
		},
		fields : {
			driverClassName : 'com.mysql.jdbc.Driver',
			url : 'jdbc:mysql://localhost:3306/prince',
			username : 'root',
			password : 'root',
			initialSize     : 10,
			maxActive       : 100,
			testOnReturn    : true,
			//validationQueryTimeout : 5,
			validationQuery : "select 1"
		}
	},
	// Dao
	dao : {
		type :'org.nutz.dao.impl.NutDao',
		args : [ {refer :"dataSource"}]
	}
}