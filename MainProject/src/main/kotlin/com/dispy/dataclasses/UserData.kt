package com.dispy.dataclasses
//  1-finished; 2-onogoing; 3-watchlist; 4-reviewedAnime
data class UserData(
    val userData_id : Int,
    val review_id : Int,
    val user_id : Int,
    val type_list : Int,
    val anime_id : Int,
){
    override fun toString(): String {
        // return a String in JSON format
        return "{\"userData_id\":$userData_id,\"review_id\":$review_id,\"user_id\":$user_id,\"type_list\":$type_list}"
    }
}