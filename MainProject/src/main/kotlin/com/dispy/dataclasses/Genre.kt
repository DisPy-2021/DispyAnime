package com.dispy.dataclasses

data class Genre (
    val genre_id : Int,
    val anime_id : Int,
    val genre : String
){
    override fun toString(): String {
        // return a String in JSON format

        return genre

        return "\""+genre+"\""

    }
}