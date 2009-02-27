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

class ModuleTests extends grails.test.GrailsUnitTestCase {
	def existingCourse = new Course(name:CourseTests.buildString(50), description:CourseTests.buildString(10000), type:CourseType.COURSE)
	def existingModule = new Module(name:CourseTests.buildString(50), description:CourseTests.buildString(10000), course:existingCourse)	
	
	void testConstraints() {
		mockForConstraintsTests Module, [ existingModule ]
		mockForConstraintsTests Course, [ existingCourse ]
		
		assertTrue existingModule.validate()
		assertEquals existingModule.toString(), CourseTests.buildString(50)
	}
}