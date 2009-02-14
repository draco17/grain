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

import grails.test.*
import com.synergyj.grain.domain.*

class CourseTests extends grails.test.GrailsUnitTestCase {
	void testBlankName() {
		mockDomain(Course)
		def course = new Course(name:"")
		assertFalse 'the name can not be blank', course.validate()
	}
	
	void testNullName() {
		mockDomain(Course)
		def course = new Course()
		assertFalse 'the name can not be null', course.validate()
	}
}
