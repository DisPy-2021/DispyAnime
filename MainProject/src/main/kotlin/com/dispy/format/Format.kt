package com.dispy.format
import com.dispy.dao.AnimeDAO
import com.dispy.dao.UserDAO
import com.dispy.dataclasses.*
import org.json.JSONObject

class Format {
    val userdao = UserDAO()
    val animeDao = AnimeDAO()
    fun jsontoAnime(json: String): Anime {
        val obj = JSONObject(json)
        val anime = Anime(
            obj.getInt("anime_id"),
            obj.getString("title"),
            obj.getString("description"),
            obj.getDouble("score"),
            obj.getString("coverPhoto")
        )
        return anime
    }

    fun jsontoGenre(json: String): Genre {
        val obj = JSONObject(json)
        val genre = Genre(
            obj.getInt("genre_id"),
            obj.getInt("anime_id"),
            obj.getString("genre"),
        )
        return genre
    }

    fun jsontoReview(json:String): Review{
        val obj = JSONObject(json)
        val review = Review(
            obj.getInt("review_id"),
            userdao.getIdbyUserName(obj.getString("nick_name")),
            animeDao.getAnimeByTitle(obj.getString("anime_title")).anime_id,
            obj.getString("review_text"),
            obj.getInt("likes"),
            obj.getInt("dislikes"),
            obj.getDouble("grade")
        )
        return review
    }

    fun jsontoUser(json: String): User {
        val obj = JSONObject(json)
        val user = User(
            obj.getInt("user_id"),
            obj.getString("nick_name"),
            obj.getString("user_name"),
            obj.getString("email"),
            obj.getString("password_hash"),
            obj.getString("profile_photo")
        )
        return user
    }

    fun jsontoUserData(json: String): UserData {
        val obj = JSONObject(json)
        return UserData(
            obj.getInt("userData_id"),
            obj.getInt("review_id"),
            obj.getInt("user_id"),
            obj.getInt("type_list"),
            obj.getInt("anime_id")
        )
    }
}
