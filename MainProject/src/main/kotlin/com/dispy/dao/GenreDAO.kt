package com.dispy.dao

import com.dispy.dataclasses.Genre
import com.dispy.dataclasses.Review

class GenreDAO : GenericDAO{

    override fun getOne(id: Int): Any {

        var genre: Genre? = null
        var connection: ConnectionMySQL? = null
        try {

            connection = ConnectionMySQL()
            val resultSet = connection.executeQuery("SELECT * FROM Genre WHERE genre_id = ${id};")

            while (resultSet!!.next()) {
                genre = Genre(
                    resultSet.getInt("genre_id"),
                    resultSet.getInt("anime_id"),
                    resultSet.getString("genre")
                )
            }
        } catch (exception: Exception) {
            exception.printStackTrace()
        } finally {
            connection?.close()
        }
        return genre!!
    }

    override fun getAll(): List<Any> {
        val genre = mutableListOf<Genre>()
        var connection: ConnectionMySQL? = null
        try {

            connection = ConnectionMySQL()
            val resultSet = connection.executeQuery("SELECT * FROM Genre;")

            while (resultSet?.next()!!) {
                genre.add(
                    Genre(
                        resultSet.getInt("genre_id"),
                        resultSet.getInt("anime_id"),
                        resultSet.getString("genre")
                    )
                )
            }
        } catch (exception: Exception) {
            exception.printStackTrace()
        } finally {
            connection?.close()
        }
        return genre
    }

    override fun insertOne(Object: Any) {
        val connection = ConnectionMySQL()
        val preparedStatement = connection.getPreparedStatement(
            """
            insert into Genre
            (anime_id, genre)
            values (?, ?)
        """.trimIndent()
        )
        val genre = Object as Genre
        preparedStatement?.setInt(1, genre.anime_id)
        preparedStatement?.setString(2, genre.genre)

        preparedStatement?.executeUpdate()

        //connection.commit()
        connection.close()
    }

    override fun insertSeveral(list: List<Any>) {
        val connection = ConnectionMySQL()
        val preparedStatement = connection.getPreparedStatement(
            """
            insert into Genre
            (anime_id, genre)
            values (?, ?)
        """.trimIndent()
        )
        for (Object in list) {
            val genre = Object as Genre
            preparedStatement?.setInt(1, genre.anime_id)
            preparedStatement?.setString(2, genre.genre)

            preparedStatement?.executeUpdate()
            //connection.commit()
        }
        connection.close()
    }

    override fun update(Object: Any) {
        val connection = ConnectionMySQL()
        val preparedStatement = connection.getPreparedStatement(
            """
            UPDATE Genre
            SET genre = ?
            WHERE genre_id = ?;
        """.trimIndent()
        )
        val genre = Object as Genre
        preparedStatement?.setString(1, "\""+genre.genre+"\"")
        preparedStatement?.setInt(2, genre.genre_id)

        //connection.commit()

        connection.close()
    }

    override fun delete(id: Int) {
        val connection = ConnectionMySQL()
        val preparedStatement = connection.getPreparedStatement(
            """
            DELETE FROM Genre
            WHERE genre_id = ?;
        """.trimIndent()
        )
        preparedStatement?.setInt(1, id)
        preparedStatement?.executeUpdate()
        //connection.commit()

        connection.close()
    }

    fun getAllGenreFromAnime(id : Int): List<String> {
        val genre = mutableListOf<String>()
        val connection = ConnectionMySQL()
        val resultSet = connection.executeQuery(
            """
                SELECT genre FROM Genre
                WHERE anime_id = ${id};
            """.trimIndent()
        )
        while(resultSet!!.next()){
            genre.add(
                resultSet.getString("genre")
            )
        }
        connection.close()
        return genre
    }

    fun getNumberOfAnime(genre : String): Int {
        var connection : ConnectionMySQL? = null
        var number : Int? = null

        try{

            connection = ConnectionMySQL()
            val resultSet = connection.executeQuery("SELECT COUNT(genre_id) FROM Genre WHERE genre LIKE '${genre}';")
            while (resultSet!!.next()){
                number = resultSet?.getInt("COUNT(genre_id)")!!
            }}catch (exception : Exception){
            exception.printStackTrace()
        }finally {
            connection?.close()
        }
        return number!!
        }

}