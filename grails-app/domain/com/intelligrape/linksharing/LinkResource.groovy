package com.intelligrape.linksharing

class LinkResource extends Resource {
    String url

    static constraints = {
        url(url: true, blank: false, nullable: false)
    }
    static mapping = {
        tablePerHierarchy false
        table 'hyperlink'
    }
}
