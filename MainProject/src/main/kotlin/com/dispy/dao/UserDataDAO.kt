package com.dispy.dao

// 1-finished; 2-onogoing; 3-watchlist; 4-reviewedAnime
import com.dispy.dataclasses.UserData

class UserDataDAO : GenericDAO {

    override fun getOne(id: Int): Any {

        var userdata: UserData? = null
        var connection: ConnectionMySQL? = null
        try {

            connection = ConnectionMySQL()
            val resultSet = connection.executeQuery("SELECT * FROM UserData WHERE userData_id = ${id};")

            while (resultSet!!.next()) {
                userdata = UserData(
                    resultSet.getInt("userData_id"),
                    resultSet.getInt("review_id"),
                    resultSet.getInt("user_id"),
                    resultSet.getInt("type_list"),
                    resultSet.getInt("anime_id")
                    )
            }
        } catch (exception: Exception) {
            exception.printStackTrace()
        } finally {
            connection?.close()
        }
        return userdata!!
    }

    override fun getAll(): List<Any> {
        val userdata = mutableListOf<UserData>()
        var connection : ConnectionMySQL? = null
        try{

            connection = ConnectionMySQL()
            val resultSet = connection.executeQuery("Select * From UserData;")

            while (resultSet?.next()!!) {
                userdata.add(
                    UserData(
                        resultSet.getInt("userData_id"),
                        resultSet.getInt("review_id"),
                        resultSet.getInt("user_id"),
                        resultSet.getInt("type_list"),
                        resultSet.getInt("anime_id")
                    )
                )
            }
        }catch (exception : Exception){
            exception.printStackTrace()
        }finally {
            connection?.close()
        }
        return userdata
    }

    override fun insertOne(Object: Any) {
        val connection = ConnectionMySQL()
        val preparedStatement = connection.getPreparedStatement("""
            insert into UserData
            (review_id, type_list, anime_id, user_id)
            VALUES (?, ?, ?,?)
        """.trimIndent())
        val userdata = Object as UserData
        preparedStatement?.setInt(1, userdata.review_id)
        preparedStatement?.setInt(2, userdata.type_list)
        preparedStatement?.setInt(3, userdata.anime_id)
        preparedStatement?.setInt(4, userdata.user_id)
        preparedStatement?.executeUpdate()

        //connection.commit()
        connection.close()
    }

    override fun insertSeveral(list: List<Any>) {
        val connection = ConnectionMySQL()
        val preparedStatement = connection.getPreparedStatement("""
            insert into UserData
            (review_id, user_id, type_list)
            VALUES (?, ?, ?, ?)
        """.trimIndent())
        for (Object in list){
            val userdata = Object as UserData
            preparedStatement?.setInt(1,userdata.review_id)
            preparedStatement?.setInt(2,userdata.user_id)
            preparedStatement?.setInt(3,userdata.type_list)
            preparedStatement?.setInt(4,userdata.anime_id)
            preparedStatement?.executeUpdate()

            //connection.commit()
        }
        connection.close()
    }

    override fun update(Object: Any) {
        val connection = ConnectionMySQL()
        val preparedStatement = connection.getPreparedStatement("""
            UPDATE UserData
            SET type_list =?
            WHERE userData_id = ?;
        """.trimIndent())
        val userdata = Object as UserData
        preparedStatement?.setInt(1,userdata.type_list)
        preparedStatement?.setInt(2,userdata.userData_id)
        preparedStatement?.executeUpdate()

        //connection.commit()

        connection.close()
    }

    override fun delete(id: Int) {
        val connection = ConnectionMySQL()
        val preparedStatement = connection.getPreparedStatement("""
            DELETE FROM UserData
            WHERE userData_id = ?
        """.trimIndent())
        preparedStatement?.setInt(1,id)
        preparedStatement?.executeUpdate()
        //connection.commit()

        connection.close()
    }

    fun getOneUserList(user_id : Int, type_list : Int): List<Any> {
        val userdata = mutableListOf<UserData>()
        var connection : ConnectionMySQL? = null
        try{

            connection = ConnectionMySQL()
            val resultSet = connection.executeQuery("Select * From UserData WHERE user_id=${user_id} AND type_list=${type_list};")

            while (resultSet?.next()!!) {
                userdata.add(
                    UserData(
                        resultSet.getInt("userData_id"),
                        resultSet.getInt("review_id"),
                        resultSet.getInt("user_id"),
                        resultSet.getInt("type_list"),
                        resultSet.getInt("anime_id")
                    )
                )
            }
        }catch (exception : Exception){
            exception.printStackTrace()
        }finally {
            connection?.close()
        }
        return userdata
    }

    fun getAllUserList(user_id : Int): List<Any> {
        val userdata = mutableListOf<UserData>()
        var connection : ConnectionMySQL? = null
        try{

            connection = ConnectionMySQL()
            val resultSet = connection.executeQuery("Select * From UserData WHERE user_id=${user_id};")

            while (resultSet?.next()!!) {
                userdata.add(
                    UserData(
                        resultSet.getInt("userData_id"),
                        resultSet.getInt("review_id"),
                        resultSet.getInt("user_id"),
                        resultSet.getInt("type_list"),
                        resultSet.getInt("anime_id")
                    )
                )
            }
        }catch (exception : Exception){
            exception.printStackTrace()
        }finally {
            connection?.close()
        }
        return userdata
    }

    fun getAllAnimeReview(anime_id : Int): List<Any> {
        val userdata = mutableListOf<UserData>()
        var connection : ConnectionMySQL? = null
        try{

            connection = ConnectionMySQL()
            val resultSet = connection.executeQuery("Select * From UserData WHERE anime_id=${anime_id} AND type_list=4;")

            while (resultSet?.next()!!) {
                userdata.add(
                    UserData(
                        resultSet.getInt("userData_id"),
                        resultSet.getInt("review_id"),
                        resultSet.getInt("user_id"),
                        resultSet.getInt("type_list"),
                        resultSet.getInt("anime_id")
                    )
                )
            }
        }catch (exception : Exception){
            exception.printStackTrace()
        }finally {
            connection?.close()
        }
        return userdata
    }

    fun deleteUserList(user_id: Int, type_list: Int) {
        val connection = ConnectionMySQL()
        val preparedStatement = connection.getPreparedStatement("""
            DELETE FROM UserData
            WHERE userData_id = ? AND type_list =? 
        """.trimIndent())
        preparedStatement?.setInt(1,user_id)
        preparedStatement?.setInt(2,type_list)
        preparedStatement?.executeUpdate()
        //connection.commit()

        connection.close()
    }
    fun checkIfAnimeInList(user_id: Int, anime_id: Int, type_list: Int): Boolean {
        var connection : ConnectionMySQL? = null
        var result = false
        try{

            connection = ConnectionMySQL()
            val resultSet = connection.executeQuery("Select * From UserData WHERE user_id=${user_id} AND anime_id=${anime_id} AND type_list=${type_list};")

            if (resultSet?.next()!!) {
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
