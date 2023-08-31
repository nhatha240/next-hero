
import React from 'react'
import HeadMenu from '@/components/HeadMenu'
import Footer from '@/components/FooterBar'

export default function Template({ children }: { children: React.ReactNode }) {
    return (
        <>
            <HeadMenu />
            {children}
            <Footer />
        </>
    )
}