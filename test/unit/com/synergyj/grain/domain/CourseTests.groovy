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

import grails.test.GrailsUnitTestCase

class CourseTests extends GrailsUnitTestCase {
	def existingCourse = new Course(name:buildString(50), description:buildString(10000), type:CourseType.COURSE)
	
	void setUp() {
		super.setUp()
		
		mockForConstraintsTests Course, [ existingCourse ]
	}
	
	void testConstraintsName() {
		def course = new Course(name:null)
		assertFalse course.validate()
		assertEquals "nullable", course.errors.name
		
		course = new Course(name:"")
		assertFalse course.validate()
		assertEquals "blank", course.errors.name
		
		course = new Course(name:buildString(51))
		assertFalse course.validate()
		assertEquals "size", course.errors.name
	}
	
	void testConstraintsDescription() {
		def course = new Course(description:null)
		assertFalse course.validate()
		assertEquals "nullable", course.errors.description
		
		course = new Course(description:"")
		assertFalse course.validate()
		assertEquals "blank", course.errors.description
		
		course = new Course(description:buildString(10001))
		assertFalse course.validate()
		assertEquals "size", course.errors.description
	}
	
	void testConstraintsType() {
		def course = new Course(type:null)
		assertFalse course.validate()
		assertEquals "nullable", course.errors.type
	}
	
	void testConstraints() {
		assertTrue existingCourse.validate()
		assertEquals existingCourse.toString(), buildString(50)
	}
	
	static def buildString(length) {
		def str = ""
		
		while (length > 0) {
			str += "A"
			length--
		}
		
		str
	}
	
}
