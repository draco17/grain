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
package com.grainapp.domain

class CourseController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ courseInstanceList: Course.list( params ), courseInstanceTotal: Course.count() ]
    }

    def show = {
        def courseInstance = Course.get( params.id )

        if(!courseInstance) {
            flash.message = "Course not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ courseInstance : courseInstance ] }
    }

    def delete = {
        def courseInstance = Course.get( params.id )
        if(courseInstance) {
            try {
                courseInstance.delete()
                flash.message = "Course ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Course ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Course not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def courseInstance = Course.get( params.id )

        if(!courseInstance) {
            flash.message = "Course not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ courseInstance : courseInstance ]
        }
    }

    def update = {
        def courseInstance = Course.get( params.id )
        if(courseInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(courseInstance.version > version) {
                    
                    courseInstance.errors.rejectValue("version", "course.optimistic.locking.failure", "Another user has updated this Course while you were editing.")
                    render(view:'edit',model:[courseInstance:courseInstance])
                    return
                }
            }
            courseInstance.properties = params
            if(!courseInstance.hasErrors() && courseInstance.save()) {
                flash.message = "Course ${params.id} updated"
                redirect(action:show,id:courseInstance.id)
            }
            else {
                render(view:'edit',model:[courseInstance:courseInstance])
            }
        }
        else {
            flash.message = "Course not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def courseInstance = new Course()
        courseInstance.properties = params
        return ['courseInstance':courseInstance]
    }

    def save = {
        def courseInstance = new Course(params)
        if(!courseInstance.hasErrors() && courseInstance.save()) {
            flash.message = "Course ${courseInstance.id} created"
            redirect(action:show,id:courseInstance.id)
        }
        else {
            render(view:'create',model:[courseInstance:courseInstance])
        }
    }
}
