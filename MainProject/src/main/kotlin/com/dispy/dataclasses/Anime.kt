package com.dispy.dataclasses

import com.dispy.dao.GenreDAO

import com.dispy.dao.ReviewDAO

data class Anime (
    val anime_id : Int,
    val title: String,
    val description : String,
    val score : Double,
    val cover_photo : String
){
    override fun toString(): String {
        // return a String in JSON format

        val reviewDAO = ReviewDAO()
        val listofReviews = reviewDAO.getAllReview(anime_id)
        val GenreDAO = GenreDAO()
        val genre = GenreDAO.getAllGenreFromAnime(anime_id)
        val review = reviewDAO.getAllReview(anime_id)
        val review_list : MutableList<String> = mutableListOf()
        for (i in listofReviews){
            i as Review
            review_list.add("\""+i.review_text+"\"")
        }
        return "{\"anime_id\":\"$anime_id\",\"title\":\"$title\",\"description\":\"$description\",\"score\":\"$score\",\"coverPhoto\":\"$cover_photo\",\"genre\": $genre}"


    }
}
