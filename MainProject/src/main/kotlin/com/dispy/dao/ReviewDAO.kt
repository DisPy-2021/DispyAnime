package com.dispy.dao

import com.dispy.dataclasses.Review

class ReviewDAO : GenericDAO {
    override fun getOne(id: Int): Any {

        var review: Review? = null
        var connection: ConnectionMySQL? = null
        try {

            connection = ConnectionMySQL()
            val resultSet = connection.executeQuery("SELECT * FROM Review WHERE review_id = ${id};")

            while (resultSet!!.next()) {
                review = Review(
                    resultSet.getInt("review_id"),
                    resultSet.getInt("user_id"),
                    resultSet.getInt("anime_id"),
                    resultSet.getString("reviewText"),
                    resultSet.getInt("likes"),
                    resultSet.getInt("dislikes"),
                    resultSet.getDouble("grade"),
                )
            }
        } catch (exception: Exception) {
            exception.printStackTrace()
        } finally {
            connection?.close()
        }
        return review?: Review(-1, -1, -1, "", -1, -1, -1.0)
    }

    override fun getAll(): List<Any> {
        val review = mutableListOf<Review>()
        var connection: ConnectionMySQL? = null
        try {

            connection = ConnectionMySQL()
            val resultSet = connection.executeQuery("SELECT * FROM Review;")

            while (resultSet?.next()!!) {
                review.add(
                    Review(
                        resultSet.getInt("review_id"),
                        resultSet.getInt("user_id"),
                        resultSet.getInt("anime_id"),
                        resultSet.getString("reviewText"),
                        resultSet.getInt("likes"),
                        resultSet.getInt("dislikes"),
                        resultSet.getDouble("grade"),
                    )
                )
            }
        } catch (exception: Exception) {
            exception.printStackTrace()
        } finally {
            connection?.close()
        }
        return review
    }

    override fun insertOne(Object: Any) {
        val connection = ConnectionMySQL()
        val preparedStatement = connection.getPreparedStatement(
            """
            insert into Review
            (user_id, anime_id, reviewText, likes, dislikes, grade)
            values (?, ? ,? , ?, ?, ?)
        """.trimIndent()
        )
        val review = Object as Review
        preparedStatement?.setInt(1, review.user_id)
        preparedStatement?.setInt(2, review.anime_id)
        preparedStatement?.setString(3, review.review_text)
        preparedStatement?.setInt(4, review.likes)
        preparedStatement?.setInt(5, review.dislikes)
        preparedStatement?.setDouble(6, review.grade)
        preparedStatement?.executeUpdate()

        //connection.commit()
        connection.close()
    }

    override fun insertSeveral(list: List<Any>) {
        val connection = ConnectionMySQL()
        val preparedStatement = connection.getPreparedStatement(
            """
            insert into Review
            (user_id, anime_id, reviewText, likes, dislikes, grade)
            values (?, ? ,? , ?, ?, ?)

        """.trimIndent()
        )
        for (Object in list) {
            val review = Object as Review
            preparedStatement?.setInt(1, review.user_id)
            preparedStatement?.setInt(2, review.anime_id)
            preparedStatement?.setString(3, review.review_text)
            preparedStatement?.setInt(4, review.likes)
            preparedStatement?.setInt(5, review.dislikes)
            preparedStatement?.setDouble(6, review.grade)
            preparedStatement?.executeUpdate()
            //connection.commit()
        }
        connection.close()
    }

    override fun update(Object: Any) {
        val connection = ConnectionMySQL()
        val preparedStatement = connection.getPreparedStatement(
            """
            UPDATE Review
            SET reviewText = ?, likes = ?, dislikes = ?, grade = ?
            WHERE review_id = ?;
        """.trimIndent()
        )
        val review = Object as Review
        preparedStatement?.setString(1, review.review_text)
        preparedStatement?.setInt(2, review.likes)
        preparedStatement?.setInt(3, review.dislikes)
        preparedStatement?.setDouble(4, review.grade)
        preparedStatement?.setInt(5, review.review_id)
        preparedStatement?.executeUpdate()
        //connection.commit()

        connection.close()
    }

    override fun delete(id: Int) { // Para deletar a Review tem que deleta-la no UserData tambem
        val connection = ConnectionMySQL()
        val preparedStatement = connection.getPreparedStatement(
            """
            DELETE FROM Review
            WHERE review_id = ?
        """.trimIndent()
        )
        preparedStatement?.setInt(1, id)
        preparedStatement?.executeUpdate()
        //connection.commit()

        connection.close()
    }

    fun getAvgGrade(id: Int): Double {
        var connection : ConnectionMySQL? = null
        var avg : Double? = null
        try{

            connection = ConnectionMySQL()
            val resultSet = connection.executeQuery("SELECT AVG(grade) FROM Review WHERE anime_id = ${id};")
            while (resultSet!!.next()){
                avg = resultSet?.getDouble("AVG(grade)")!!
            }

        }catch (exception : Exception){
            exception.printStackTrace()
        }finally {
            connection?.close()
        }
        return avg!!
    }

    fun getAllReview(anime_id: Int): List<Review> {
        var connection : ConnectionMySQL? = null
        var list : MutableList<Review> = mutableListOf()
        try{

            connection = ConnectionMySQL()
            val resultSet = connection.executeQuery("SELECT * FROM Review WHERE anime_id = ${anime_id};")
            while (resultSet!!.next()){
                list.add(
                    Review(
                        resultSet.getInt("review_id"),
                        resultSet.getInt("user_id"),
                        resultSet.getInt("anime_id"),
                        resultSet.getString("reviewText"),
                        resultSet.getInt("likes"),
                        resultSet.getInt("dislikes"),
                        resultSet.getDouble("grade")
                    )
                )
            }

        }catch (exception : Exception){
            exception.printStackTrace()
        }finally {
            connection?.close()
        }
        return list
    }
}