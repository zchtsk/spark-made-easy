'use client'
import {usePathname} from "next/navigation";

export function Canonical(){
    let pathname = usePathname()
    let url = `https://sparkmadeeasy.com${pathname}`
    return (
        <link rel="canonical" href={url}/>
    )
}