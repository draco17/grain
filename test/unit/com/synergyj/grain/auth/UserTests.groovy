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

class UserTests extends GrailsUnitTestCase {
	def existingUser = new User(email:"something@server.com", login:"user", password:"secret", 
								realName:"User Real Name", enabled:true, about:"About the user", company:"User company",
								blog:"http://user.blogserver.com", geolocation:"somewhere", site:"http://my.com/")
								
	void setUp() {
		super.setUp()
		
		mockForConstraintsTests User, [ existingUser ]
	}
	

	void testEmailConstraints() {
		def user = new User()
		assertFalse user.validate()
		assertEquals "nullable", user.errors.email
		
		user = new User(email:"")
		assertFalse user.validate()
		assertEquals "blank", user.errors.email
		
		user = new User(email:"someuserserver.com")
		assertFalse user.validate()
		assertEquals "email", user.errors.email
		
		user = new User(email:CourseTests.buildString(201)+"@server.com")
		assertFalse user.validate()
		assertEquals "size", user.errors.email
		
		user = new User(email:"something@server.com")
		assertFalse user.validate()
		assertEquals "unique", user.errors.email
	}
	
	void testLoginConstraints() {
		def user = new User()
		assertFalse user.validate()
		assertEquals "nullable", user.errors.login
		
		user = new User(login:"")
		assertFalse user.validate()
		assertEquals "blank", user.errors.login
		
		user = new User(login:"12")
		assertFalse user.validate()
		assertEquals "size", user.errors.login
		
		user = new User(login:CourseTests.buildString(26))
		assertFalse user.validate()
		assertEquals "size", user.errors.login
		
		user = new User(login:"user")
		assertFalse user.validate()
		assertEquals "unique", user.errors.login
	}
	
	void testPasswordConstraints() {
		def user = new User()
		assertFalse user.validate()
		assertEquals "nullable", user.errors.password
		
		user = new User(password:"")
		assertFalse user.validate()
		assertEquals "blank", user.errors.password
		
		user = new User(password:"1234")
		assertFalse user.validate()
		assertEquals "size", user.errors.password
		
		user = new User(password:CourseTests.buildString(26))
		assertFalse user.validate()
		assertEquals "size", user.errors.password
	}
	
	void testRealNameConstraints() {
		def user = new User()
		assertFalse user.validate()
		assertEquals "nullable", user.errors.realName
		
		user = new User(realName:"")
		assertFalse user.validate()
		assertEquals "blank", user.errors.realName
		
		user = new User(realName:CourseTests.buildString(201))
		assertFalse user.validate()
		assertEquals "size", user.errors.realName
	}
	
	void testCompanyConstraints() {
		def user = new User(company:CourseTests.buildString(101))
		assertFalse user.validate()
		assertEquals "size", user.errors.company
	}
	
	void testGeolocationConstraints() {
		def user = new User(geolocation:CourseTests.buildString(201))
		assertFalse user.validate()
		assertEquals "size", user.errors.geolocation
	}
	
	void testAboutConstraints() {
		def user = new User(about:CourseTests.buildString(1001))
		assertFalse user.validate()
		assertEquals "size", user.errors.about
	}
	
	void testBlogConstraints() {
		def user = new User(blog:"thisIsNotAUrl")
		assertFalse user.validate()
		assertEquals "url", user.errors.blog
		
		user = new User(blog:"http://"+CourseTests.buildString(301)+".com")
		assertFalse user.validate()
		assertEquals "size", user.errors.blog
	}
	
	
	void testSiteConstraints() {
		def user = new User()
		assertFalse user.validate()
		assertEquals "nullable", user.errors.site
		
		user = new User(site:"")
		assertFalse user.validate()
		assertEquals "blank", user.errors.site
		
		user = new User(site:"fghjfghjf")
		assertFalse user.validate()
		assertEquals "url", user.errors.site
		
		user = new User(site:"http://${CourseTests.buildString(301)}.biz/homepage.php")
		assertFalse user.validate()
		assertEquals "size", user.errors.site
		
	}
	
	void testConstraints() {
		assertTrue existingUser.validate()
		assertEquals existingUser.toString(), "user"
	}
}
