package com.dispy

import com.dispy.dao.AnimeDAO
import com.dispy.dao.ConnectionMySQL
import com.dispy.dao.ReviewDAO
import com.dispy.dao.UserDataDAO
import com.dispy.dataclasses.Anime
import com.dispy.dataclasses.Review
import com.dispy.dataclasses.UserData
import com.dispy.format.Format
import io.ktor.routing.*
import io.ktor.http.*
import io.ktor.application.*
import io.ktor.response.*
import io.ktor.request.*
import kotlin.test.*
import io.ktor.server.testing.*
import com.dispy.plugins.*

fun main() {
    var anime :Anime
    var animedao = AnimeDAO();
    var format = Format();
    println(format.jsontoAnime("{\"anime_id\":2,\"title\":\"Kimetsu no yaiba\",\"description\":\"alskdfjalksjdf\",\"score\":85.0,\"coverPhoto\":\"sadfasdf\"}"))
}