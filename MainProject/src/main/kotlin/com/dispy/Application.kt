package com.dispy


import io.ktor.application.*
import io.ktor.server.engine.*
import io.ktor.server.netty.*
import io.ktor.features.*
import io.ktor.http.*
import com.dispy.dao.AnimeDAO
import com.dispy.dataclasses.Anime
import com.dispy.dataclasses.User
import com.dispy.plugins.configureRouting
import io.ktor.server.engine.*
import io.ktor.server.netty.*

fun main() {
    embeddedServer(Netty, port = 8080, host = "localhost"){
        install(CORS) {
            method(HttpMethod.Options)
            anyHost()
        }
        install(DefaultHeaders) {
            header(HttpHeaders.AcceptCharset, "utf-8")
        }
        configureRouting()
    }.start(wait = true)
}
