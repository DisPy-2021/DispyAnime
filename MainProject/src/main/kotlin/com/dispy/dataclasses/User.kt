package com.dispy.dataclasses

import com.dispy.dao.AnimeDAO
import com.dispy.dao.UserDataDAO

data class User(
    val user_id: Int,
    val nick_name: String,
    val user_name: String,
    val email: String,
    val password_hash: String,
    val profile_photo: String
        ){

    override fun toString(): String {
        // return a String in JSON format
        val userDataDAO = UserDataDAO()
        val animeDAO = AnimeDAO()
        val listFinished : MutableList<String> = mutableListOf()
        val listWatching : MutableList<String> = mutableListOf()
        val userDataFinished = userDataDAO.getOneUserList(user_id, 1)
        val userDataWatching =userDataDAO.getOneUserList(user_id, 3)
        for (i in userDataFinished){
            val userdata = i as UserData
            val anime = animeDAO.getOne(userdata.anime_id) as Anime
            val animeTitle = "\""+anime.title+"\""
            listFinished.add(animeTitle)
        }
        for (i in userDataWatching){
            val userdata = i as UserData
            val anime = animeDAO.getOne(userdata.anime_id) as Anime
            listWatching.add("\""+anime.title+"\"")
        }


        return "{\"user_id\":\"$user_id\"," +
                "\"nickName\":\"$nick_name\"," +
                "\"userName\":\"$user_name\"," +
                "\"email\":\"$email\"," +
                "\"passwordHash\":\"$password_hash\"," +
                "\"profilePhoto\":\"$profile_photo\"," +
                "\"finishedAnimes\" : $listFinished," +
                "\"watchlist\" : $listWatching}"
    }
}