package com.dispy.dao

import com.dispy.shared.SharedPaths
import java.sql.*

class ConnectionMySQL {

    val connection : Connection
    var statement : Statement?
    var resultSet: ResultSet?
    var preparedStatement: PreparedStatement?

    init {
        this.connection = DriverManager.getConnection("${SharedPaths.mySQLHostname}/${SharedPaths.mySQLName}?user=${SharedPaths.mySQLUser}&password=${SharedPaths.mySQLPassword}&useSSL=false")
        this.statement = null
        this.resultSet = null
        this.preparedStatement = null
    }

    fun executeQuery(sqlString: String): ResultSet?{
        this.statement = this.connection?.createStatement()
        this.resultSet = this.statement?.executeQuery(sqlString)
        return this.resultSet
    }

    fun getPreparedStatement(sqlString: String):PreparedStatement?{
        this.preparedStatement = this.connection?.prepareStatement(sqlString)
        return  this.preparedStatement
    }

    fun commit(){
        this.connection?.commit()
    }

    fun close(){
        this.resultSet?.close()
        this.statement?.close()
        this.preparedStatement?.close()
        this.connection?.close()
    }
}