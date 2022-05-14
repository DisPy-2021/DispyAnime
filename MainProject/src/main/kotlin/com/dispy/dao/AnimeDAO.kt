package com.dispy.dao

import com.dispy.dataclasses.Anime

class AnimeDAO : GenericDAO {
    override fun getOne(id: Int): Any {

        var anime : Anime? = null
        var connection : ConnectionMySQL? = null
        try{

        connection = ConnectionMySQL()
        val resultSet = connection.executeQuery("SELECT * FROM Anime WHERE anime_id = ${id};")

        while(resultSet!!.next()){
            anime = Anime(
                resultSet.getInt("anime_id"),
                resultSet.getString("title"),
                resultSet.getString("description"),
                resultSet.getDouble("score"),
                resultSet.getString("coverPhoto"),
            )
        }}catch (exception : Exception){
            exception.printStackTrace()
        }finally {
            connection?.close()
        }
        return anime?: Anime(-1,"","",0.0,"")
    }

    override fun getAll(): List<Any> {
        val anime = mutableListOf<Anime>()
        var connection : ConnectionMySQL? = null
        try{

            connection = ConnectionMySQL()
            val resultSet = connection.executeQuery("SELECT * FROM Anime;")

            while (resultSet?.next()!!) {
                anime.add(
                    Anime(
                        resultSet.getInt("anime_id"),
                        resultSet.getString("title"),
                        resultSet.getString("description"),
                        resultSet.getDouble("score"),
                        resultSet.getString("coverPhoto")

                    )
                )
            }
        }catch (exception : Exception){
            exception.printStackTrace()
        }finally {
            connection?.close()
        }
        return anime
    }

    override fun insertOne(Object: Any) {
        val connection = ConnectionMySQL()
        val preparedStatement = connection.getPreparedStatement("""
            insert into Anime
            (title, description, score, coverPhoto)
            VALUES (?, ?, ?, ?)
        """.trimIndent())
        val anime = Object as Anime
        preparedStatement?.setString(1, anime.title)
        preparedStatement?.setString(2, anime.description)
        preparedStatement?.setDouble(3, anime.score)
        preparedStatement?.setString(4, anime.cover_photo)
        preparedStatement?.executeUpdate()

        //connection.commit()
        connection.close()
    }

    override fun insertSeveral(list: List<Any>) {
        val connection = ConnectionMySQL()
        val preparedStatement = connection.getPreparedStatement("""
            insert into Anime
            (title, description, score, coverPhoto)
            VALUES (?, ?, ?, ?)
        """.trimIndent())
        for (Object in list){
            val anime = Object as Anime
            preparedStatement?.setString(1, anime.title)
            preparedStatement?.setString(2, anime.description)
            preparedStatement?.setDouble(3, anime.score)
            preparedStatement?.setString(4, anime.cover_photo)
            preparedStatement?.executeUpdate()
            //connection.commit()
        }
        connection.close()
    }

    override fun update(Object: Any) {
        val connection = ConnectionMySQL()
        val preparedStatement = connection.getPreparedStatement("""
            UPDATE Anime
            SET title = ?, description = ?, score = ?, coverPhoto = ?
            WHERE anime_id = ?;
        """.trimIndent())
        val anime = Object as Anime
        preparedStatement?.setString(1, anime.title)
        preparedStatement?.setString(2, anime.description)
        preparedStatement?.setDouble(3, anime.score)
        preparedStatement?.setString(4, anime.cover_photo)
        preparedStatement?.setInt(5, anime.anime_id)
        preparedStatement?.executeUpdate()
        //connection.commit()

        connection.close()
    }

    override fun delete(id: Int) {
        val connection = ConnectionMySQL()
        val preparedStatement = connection.getPreparedStatement("""
            DELETE FROM Anime
            WHERE anime_id = ?
        """.trimIndent())
        preparedStatement?.setInt(1,id)
        preparedStatement?.executeUpdate()
        //connection.commit()

        connection.close()
    }
    fun getAnimeByTitle(title: String): Anime {
        val anime = mutableListOf<Anime>()
        var connection : ConnectionMySQL? = null
        try{

            connection = ConnectionMySQL()
            val resultSet = connection.executeQuery("SELECT * FROM Anime WHERE title = '$title';")

            while (resultSet?.next()!!) {
                anime.add(
                    Anime(
                        resultSet.getInt("anime_id"),
                        resultSet.getString("title"),
                        resultSet.getString("description"),
                        resultSet.getDouble("score"),
                        resultSet.getString("coverPhoto")

                    )
                )
            }
        }catch (exception : Exception){
            exception.printStackTrace()
        }finally {
            connection?.close()
        }
        return anime[0]
    }
}