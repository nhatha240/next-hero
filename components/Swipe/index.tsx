'use client'
import React from 'react'
import style from './index.module.sass'
import { signIn, signOut, useSession } from "next-auth/react"
function index() {
    const { data: session, status } = useSession()
    const loading = status === "loading"
    return (
        <div className={style.frame1} >
            <p className={style.swipe}> Sign up and get 20% off to your first order.
                <button className={style.singIn} onClick={(e) => {
                    e.preventDefault()
                    signIn()
                }}>Sign Up Now </button></p>
        </div>
    )
}

export default index