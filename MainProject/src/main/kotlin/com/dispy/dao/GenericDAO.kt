package com.dispy.dao

interface GenericDAO {
    fun getOne(id:Int) : Any
    fun getAll() : List<Any>
    fun insertOne(Object : Any) : Unit
    fun insertSeveral(list : List<Any>) : Unit
    fun update(Object : Any) : Unit
    fun delete(id : Int) : Unit
}