package com.intelligrape.linksharing

class DocumentResource extends Resource {
    String fileName
    String uuid

    static constraints = {
        uuid(unique: true)
    }
    static mapping = {
        table 'document'
    }
}
