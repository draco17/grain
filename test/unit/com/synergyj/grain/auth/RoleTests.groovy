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
package com.synergyj.grain.auth

import grails.test.GrailsUnitTestCase

import com.synergyj.grain.domain.CourseTests

class RoleTests extends GrailsUnitTestCase {
	def existingRole = new Role(description:CourseTests.buildString(200), name:CourseTests.buildString(200))
	
	void setUp() {
		super.setUp()
		
		mockForConstraintsTests Role, [ existingRole ]
	}
	
	void testNameConstraints() {
		def role = new Role()
		assertFalse role.validate()
		assertEquals "nullable", role.errors.name
		
		role = new Role(name:"")
		assertFalse role.validate()
		assertEquals "blank", role.errors.name
		
		role = new Role(name:CourseTests.buildString(201))
		assertFalse role.validate()
		assertEquals "size", role.errors.name
	}
	
	void testDescriptionConstraints() {
		def role = new Role(description:CourseTests.buildString(201))
		assertFalse role.validate()
		assertEquals "size", role.errors.description
	}
	
	void testConstraints() {
		assertTrue existingRole.validate()
		assertEquals existingRole.toString(), CourseTests.buildString(200)
	}
}
