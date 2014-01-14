package com.cland.casting

import javax.servlet.http.HttpServletResponse

class CacheFilters {

    def filters = {
        all(controller:'*', action:'*') {
            before = {
				/** un-comment line below if cache issues arises **/
				// ((HttpServletResponse) response).setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
