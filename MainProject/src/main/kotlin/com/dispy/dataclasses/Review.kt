package com.dispy.dataclasses

import com.dispy.dao.AnimeDAO
import com.dispy.dao.UserDAO

data class Review (
    val review_id : Int,
    val user_id : Int,
    val anime_id : Int,
    val review_text : String,
    val likes : Int,
    val dislikes : Int,
    val grade : Double
        ){
    override fun toString(): String {
        // return a String in JSON
        val animeDAO = AnimeDAO()
        val userDAO = UserDAO()
        val user = userDAO.getOne(user_id) as User
        val anime = animeDAO.getOne(anime_id) as Anime
        val animeTitle = anime.title
        val nickName = user.nick_name
        val profile_photo = user.profile_photo
        return "{\"review_id\":\"$review_id\",\"nickName\":\"$nickName\",\"anime_title\":\"$animeTitle\",\"reviewText\":\"$review_text\",\"likes\":\"$likes\",\"dislikes\":\"$dislikes\",\"grade\":\"$grade\", \"profile_photo\":\"$profile_photo\"}"
    }
}