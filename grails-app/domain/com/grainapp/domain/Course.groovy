package com.grainapp.domain

class Course {
	String name
	String description
	
	static constraints = {
		name(blank:false,nullable:false,size:1..50)
		description(blank:false,nullable:false,size:1..10000)
	}
}
