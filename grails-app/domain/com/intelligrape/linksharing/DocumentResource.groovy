package com.intelligrape.linksharing

import org.codehaus.groovy.grails.commons.ConfigurationHolder

class DocumentResource extends Resource {
    String fileName
    String uuid
    byte[] document

    static transients = ['document']

    static constraints = {
        uuid(unique: true)
    }

    static mapping = {
        table 'document'
    }

    void setDocument(def document) {
        this.document = document.getBytes()
        this.fileName = document.getOriginalFilename().replaceAll(" ", "_")
        this.uuid = UUID.randomUUID().toString()
        new File("${ConfigurationHolder.config.path + this.uuid}-${this.fileName}").withOutputStream {out ->
            out.write this.document
        }
    }
}
