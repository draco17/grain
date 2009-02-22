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
package com.synergyj.grain.domain

class Course {
	String name
	String description
	Date dateCreated
	Date lastUpdated
	CourseType type
	SortedSet modules
	
	static hasMany = [modules:Module]
	
	static constraints = {
		name(blank:false,nullable:false,size:1..50)
		description(blank:false,nullable:false,size:1..10000)
		type(nullable:false)
	}
	
	String toString(){
		name
	}
	
	static mapping = {
		description type:"text"
	}
}