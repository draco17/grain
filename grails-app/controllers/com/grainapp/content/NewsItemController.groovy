/*
 * Copyright 2002-2008 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.grainapp.content

class NewsItemController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ newsItemInstanceList: NewsItem.list( params ), newsItemInstanceTotal: NewsItem.count() ]
    }

    def show = {
        def newsItemInstance = NewsItem.get( params.id )

        if(!newsItemInstance) {
            flash.message = "NewsItem not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ newsItemInstance : newsItemInstance ] }
    }

    def delete = {
        def newsItemInstance = NewsItem.get( params.id )
        if(newsItemInstance) {
            try {
                newsItemInstance.delete()
                flash.message = "NewsItem ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "NewsItem ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "NewsItem not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def newsItemInstance = NewsItem.get( params.id )

        if(!newsItemInstance) {
            flash.message = "NewsItem not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ newsItemInstance : newsItemInstance ]
        }
    }

    def update = {
        def newsItemInstance = NewsItem.get( params.id )
        if(newsItemInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(newsItemInstance.version > version) {
                    
                    newsItemInstance.errors.rejectValue("version", "newsItem.optimistic.locking.failure", "Another user has updated this NewsItem while you were editing.")
                    render(view:'edit',model:[newsItemInstance:newsItemInstance])
                    return
                }
            }
            newsItemInstance.properties = params
            if(!newsItemInstance.hasErrors() && newsItemInstance.save()) {
                flash.message = "NewsItem ${params.id} updated"
                redirect(action:show,id:newsItemInstance.id)
            }
            else {
                render(view:'edit',model:[newsItemInstance:newsItemInstance])
            }
        }
        else {
            flash.message = "NewsItem not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def newsItemInstance = new NewsItem()
        newsItemInstance.properties = params
        return ['newsItemInstance':newsItemInstance]
    }

    def save = {
        def newsItemInstance = new NewsItem(params)
        if(!newsItemInstance.hasErrors() && newsItemInstance.save()) {
            flash.message = "NewsItem ${newsItemInstance.id} created"
            redirect(action:show,id:newsItemInstance.id)
        }
        else {
            render(view:'create',model:[newsItemInstance:newsItemInstance])
        }
    }
}
