package com.dispy.dao

import com.dispy.dataclasses.User

class UserDAO : GenericDAO {
    override fun getOne(id: Int): Any {

        var user : User? = null
        var connection : ConnectionMySQL? = null
        try{

            connection = ConnectionMySQL()
            val resultSet = connection.executeQuery("SELECT * FROM User WHERE user_id = ${id};")

            while(resultSet!!.next()){
                user = User(
                    resultSet.getInt("user_id"),
                    resultSet.getString("nickName"),
                    resultSet.getString("userName"),
                    resultSet.getString("email"),
                    resultSet.getString("passwordHash"),
                    resultSet.getString("profilePhoto")
                )
            }}catch (exception : Exception){
            exception.printStackTrace()
        }finally {
            connection?.close()
        }
        return user!!
    }
    override fun getAll(): List<Any> {
        val user = mutableListOf<User>()
        var connection : ConnectionMySQL? = null
        try{

            connection = ConnectionMySQL()
            val resultSet = connection.executeQuery("Select * From User;")

            while (resultSet?.next()!!) {
                user.add(
                    User(
                        resultSet.getInt("user_id"),
                        resultSet.getString("nickName"),
                        resultSet.getString("userName"),
                        resultSet.getString("email"),
                        resultSet.getString("passwordHash"),
                        resultSet.getString("profilePhoto"),
                    )
                )
            }
        }catch (exception : Exception){
            exception.printStackTrace()
        }finally {
            connection?.close()
        }
        return user
    }

    override fun insertOne(Object: Any) {
        val connection = ConnectionMySQL()
        val preparedStatement = connection.getPreparedStatement("""
            insert into User
            (nickName, userName, email, passwordHash, profilePhoto)
            values (?, ?, ?, ?, ?)
        """.trimIndent())
        val user = Object as User
        preparedStatement?.setString(1,user.nick_name)
        preparedStatement?.setString(2,user.user_name)
        preparedStatement?.setString(3,user.email)
        preparedStatement?.setString(4,user.password_hash)
        preparedStatement?.setString(5,user.profile_photo)
        preparedStatement?.executeUpdate()

        //connection.commit()
        connection.close()
    }
    override fun insertSeveral(list: List<Any>) {
        val connection = ConnectionMySQL()
        val preparedStatement = connection.getPreparedStatement("""
            insert into User
            (nickName, userName, email, passwordHash, creationDate, profilePhoto)
            values (?, ?, ?, ?, ?, ?)
        """.trimIndent())
        for (Object in list){
            val user = Object as User
            preparedStatement?.setString(1,user.nick_name)
            preparedStatement?.setString(2,user.user_name)
            preparedStatement?.setString(3,user.email)
            preparedStatement?.setString(4,user.password_hash)
            preparedStatement?.setString(5,user.profile_photo)
            preparedStatement?.executeUpdate()
            //connection.commit()
        }
        connection.close()
    }

    override fun update(Object: Any) {
        val connection = ConnectionMySQL()
        val preparedStatement = connection.getPreparedStatement("""
            UPDATE User
            SET nickName = ?, userName = ?, email =?, passwordHash = ?, profilePhoto = ?
            WHERE user_id = ?;
        """.trimIndent())
        val user = Object as User
        preparedStatement?.setString(1,user.nick_name)
        preparedStatement?.setString(2,user.user_name)
        preparedStatement?.setString(3,user.email)
        preparedStatement?.setString(4,user.password_hash)
        preparedStatement?.setString(5,user.profile_photo)
        preparedStatement?.setInt(6,user.user_id)
        preparedStatement?.executeUpdate()
        //connection.commit()

        connection.close()
    }

    override fun delete(id: Int) {
        val connection = ConnectionMySQL()
        val preparedStatement = connection.getPreparedStatement("""
            DELETE FROM User
            WHERE user_id = ?
        """.trimIndent())
        preparedStatement?.setInt(1,id)
        preparedStatement?.executeUpdate()
        //connection.commit()

        connection.close()
    }

    fun getIdbyUserName (userName : String) : Int{
        val connection = ConnectionMySQL()
        var id = 0
        try {
            val resultSet = connection.executeQuery("Select user_id From User where userName = '$userName';")
            while (resultSet?.next()!!) {
                id = resultSet.getInt("user_id").toInt()
            }
        }catch (exception : Exception){
            exception.printStackTrace()
        }finally {
            connection?.close()
        }
        return id
    }
    fun login(userName : String, password : String) : Boolean{
        val connection = ConnectionMySQL()
        var result = false
        try {
            val resultSet = connection.executeQuery("Select * From User where userName = '$userName' and passwordHash = '$password';")
            while (resultSet?.next()!!) {
                result = true
            }
        }catch (exception : Exception){
            exception.printStackTrace()
        }finally {
            connection?.close()
        }
        return result
    }
}