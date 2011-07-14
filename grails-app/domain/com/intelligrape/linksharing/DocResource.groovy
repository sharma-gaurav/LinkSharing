package com.intelligrape.linksharing

class DocResource extends Resource{
    String path

    static constraints = {
        path(unique: true)
    }
}
