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

class ModuleTopic implements Comparable {
	String topicName
	SortedSet subModuleTopics
	Date dateCreated
	Date lastUpdated
	
	static hasMany = [subModuleTopics:ModuleTopic]
	static belongsTo = [module:Module,moduleTopic:ModuleTopic]
	
	static constraints = {
		subModuleTopics nullable:true
	}
	
	int compareTo(Object obj){
		topicName.compareTo(obj.topicName)
	}
	
	String toString() {
		topicName
	}
}