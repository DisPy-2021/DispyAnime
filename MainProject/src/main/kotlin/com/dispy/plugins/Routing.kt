package com.dispy.plugins

import com.dispy.dao.AnimeDAO
import com.dispy.dao.ReviewDAO
import com.dispy.dao.UserDAO
import com.dispy.dao.UserDataDAO
import com.dispy.dataclasses.Anime
import com.dispy.dataclasses.Review
import com.dispy.dataclasses.User
import com.dispy.dataclasses.UserData
import com.dispy.format.Format
import io.ktor.routing.*
import io.ktor.http.*
import io.ktor.application.*
import io.ktor.request.*
import io.ktor.response.*
import org.json.JSONObject

fun Application.configureRouting() {
    // Starting point for a Ktor app:
    routing {
        val animeDAO = AnimeDAO()
        val reviewDAO = ReviewDAO()
        val userDataDao = UserDataDAO()
        val userDao = UserDAO()
        val format = Format()
        var user : User
        var userNick : String
        var anime : Anime
        var animeUpdate : Anime
        var animeTitle: String
        var review: Review
        var reviewId: Int
        var reviewObject : Review
        var jsonAnime : String
        var jsonReview : String
        var newScore : Double
        var jsonUserData : String
        var userData : UserData

        get("/") {
            call.respondText("Hello World!", ContentType.Text.Plain)
        }
        get("/anime") {
            /**
             *  Send back a list of all the anime in the database in JSON format
             * */
            call.respondText(animeDAO.getAll().toString(), ContentType.Text.Plain)
        }
        get("/anime/{animeTitle}"){
            // if anime_id not fount, return anime not found
            /**
             *  Send back the anime with the given id in a json format
             * */
            animeTitle = call.parameters["animeTitle"].toString()
            anime = animeDAO.getAnimeByTitle(animeTitle)
            if (anime.anime_id == -1) {
                call.respondText("Anime not found", ContentType.Text.Plain)
            } else {
                call.respondText(anime.toString(), ContentType.Text.Plain)
            }
        }
        get("/anime/{animeTitle}/reviews"){
            // if Anime has no reviews, return String "Anime has no reviews"
            /**
             *  Send all reviews for a given anime_id in the form of a JSON array
             * */
            animeTitle = call.parameters["animeTitle"]!!.toString()
            anime = animeDAO.getAnimeByTitle(animeTitle)
            val listOfReviews = reviewDAO.getAllReview(anime.anime_id)
            if (listOfReviews.isEmpty()) {
                call.respondText("No reviews found", ContentType.Text.Plain)
            } else {
                call.respondText(listOfReviews.toString(), ContentType.Text.Plain)
                }
            }
        get("/anime/{id}/reviews/{review_id}"){
            // if review_id not found, return review not found
            /**
             * Send a review for an anime in JSON format
             * */
            reviewId = call.parameters["review_id"]!!.toInt()
            reviewObject = reviewDAO.getOne(reviewId) as Review
            if (reviewObject.review_id == -1) {
                call.respondText("Review not found", ContentType.Text.Plain)
            } else {
                call.respondText(reviewObject.toString(), ContentType.Text.Plain)
            }
        }
        get("/user/{userName}")
        {
            /**
             *  Send back the user data for the given user_id in JSON format
             * */
            userNick = call.parameters["userName"]!!.toString()
            user = userDao.getOne(userDao.getIdbyUserName(userNick)) as User
            if (user.user_id == -1) {
                call.respondText("User not found", ContentType.Text.Plain)
            } else {
                call.respondText(user.toString(), ContentType.Text.Plain)
            }
        }
        get("user/{userName}/watchlist"){
            userNick = call.parameters["userName"]!!.toString()
            user = userDao.getOne(userDao.getIdbyUserName(userNick)) as User
            val userDataList = userDataDao.getOneUserList(user.user_id,3)
            val watchList= mutableListOf<String>()
            for(i in userDataList){
                i as UserData
                anime = animeDAO.getOne(i.anime_id) as Anime
                watchList.add(anime.title)
            }
            if (watchList.isEmpty()) {
                call.respondText("No anime in watchlist", ContentType.Text.Plain)
            } else {
                call.respondText(watchList.toString(), ContentType.Text.Plain)
            }
        }
        get("user/{userName}/finished"){
            userNick = call.parameters["userName"]!!.toString()
            user = userDao.getOne(userDao.getIdbyUserName(userNick)) as User
            val userDataList = userDataDao.getOneUserList(user.user_id,1)
            val watchList= mutableListOf<String>()
            for(i in userDataList){
                i as UserData
                anime = animeDAO.getOne(i.anime_id) as Anime
                watchList.add(anime.title)
            }
            if (watchList.isEmpty()) {
                call.respondText("No anime in finishedList", ContentType.Text.Plain)
            } else {
                call.respondText(watchList.toString(), ContentType.Text.Plain)
            }
        }
        post("user/login"){
            /**
             * Receive a JSON with UserName and the Password
             * if the login is successful, return JSON with the User
             * if not, return "User not found"
             * */
            val obj = JSONObject(call.receive<String>())
            val userName = obj.getString("userName")
            val password = obj.getString("password")
            if(userDao.login(userName,password)){
                user = userDao.getOne(userDao.getIdbyUserName(userName)) as User
                call.respondText(user.toString(), ContentType.Text.Plain)
            }
            else{
                call.respondText("User not found", ContentType.Text.Plain)
            }
        }
        post("user/new"){
            /**
             * Receive a JSON to create a new User
             */
            val obj = call.receive<String>()
            user = format.jsontoUser(obj)
            userDao.insertOne(user)
            user = userDao.getOne(userDao.getIdbyUserName(user.user_name)) as User
            call.respondText( user.toString(), ContentType.Text.Plain)
        }
        post("/anime/new"){
            /** receive json body turn it into an anime object
            insert into database
            */

            jsonAnime = call.receive<String>()
            anime = format.jsontoAnime(jsonAnime)
            animeDAO.insertOne(anime)
            call.respondText("Anime added", ContentType.Text.Plain)
        }
        post("/anime/{anime_title}/reviews/new"){
            /** receive json body turn it into a review object
             * insert into database
             */

            jsonReview = call.receive<String>()
            review = format.jsontoReview(jsonReview)
            print(review.user_id)
            reviewDAO.insertOne(review)
            println(review.toString())
            animeTitle = call.parameters["anime_title"].toString()

            anime = animeDAO.getAnimeByTitle(animeTitle)
            newScore = reviewDAO.getAvgGrade(anime.anime_id)
            animeUpdate = Anime(anime.anime_id, anime.title, anime.description,newScore,anime.cover_photo)
            animeDAO.update(animeUpdate)
            call.respondText("Review added", ContentType.Text.Plain)
        }
        post("/user/{user_id}/anime/{anime_id}/add/watchList"){
            /**
             *  Receive a JSON body and turn it into a UserData object
             * */
            jsonUserData = call.receive<String>()
            userData = format.jsontoUserData(jsonUserData)
            if (userDataDao.checkIfAnimeInList(userData.user_id,userData.anime_id,userData.type_list))
                call.respondText { "Anime already in watchlist" }
            else {
                userDataDao.insertOne(userData)
                call.respondText("Anime added to watchlist", ContentType.Text.Plain)
            }
        }
        post("/user/{user_id}/anime/{anime_id}/add/finishedList"){
            /**
             *  Receive a JSON body and turn it into a UserData object
             * */
            jsonUserData = call.receive<String>()
            userData = format.jsontoUserData(jsonUserData)
            if (userDataDao.checkIfAnimeInList(userData.user_id,userData.anime_id,userData.type_list))
                call.respondText { "Anime already in watchlist" }
            else {
                userDataDao.insertOne(userData)
                call.respondText("Anime added to watchlist", ContentType.Text.Plain)
            }
        }
    }
}