package com.cland.casting


import org.compass.core.engine.SearchEngineQueryParseException

/**
 *
 * @author Jason Dembaremba
 */
class SearchController {
    def searchableService

    /**
     * Index page with search form and results
     */
    def index = {
        if (!params.q?.trim()) {
            return [:]
        }
        try {
            return [searchResult: searchableService.search(params.q, params)]
        } catch (SearchEngineQueryParseException ex) {
            return [parseException: true]
        } catch (Exception ex){
			params.suggestQuery = false;			
			return [searchResult: searchableService.search(params.q, params)]
        }
    }

    /**
     * Perform a bulk index of every searchable object in the database
     */
    def indexAll = {
        Thread.start {
            searchableService.index()
        }
        render("bulk index started in a background thread")
    }

    /**
     * Perform a bulk index of every searchable object in the database
     */
    def unindexAll = {
        searchableService.unindex()
        render("unindexAll done")
    }
}

