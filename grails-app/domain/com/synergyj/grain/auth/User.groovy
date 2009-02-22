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

class User {
	Date dateCreated
	Date lastUpdated
	String email
	String login
	String password
	String realName
	Boolean enabled = true
	String about = ''
	String company
	String blog
	String geolocation

	static hasMany = [roles:Role]

	static constraints = {
		email(nullable:false,blank:false,unique:true,email:true,size:1..200)
		login(nullable:false,blank:false,unique:true,size:3..25)
		password(nullable:false,blank:false,size:5..25)
		realName(nullable:false,blank:false,size:0..200)
		company(nullable:true,blank:true,size:0..100)
		//geolocation(nullable:true,blank:true,size:0..200,geolocation:true)
		geolocation(nullable:true,blank:true,size:0..200)
		about(nullable:true,blank:true,size:0..1000)
		blog(nullable:true,blank:true,url:true,size:0..300)
		enabled()
	}

	static mapping = {
		cache true
		table 'users'
    }

	String toString() {
		login
	}
}
