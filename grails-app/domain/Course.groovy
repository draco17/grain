class Course {
	String name
	String description
	
	static constraints = {
		name(blank:false,nullable:false,size:1..50)
		name(blank:false,nullable:false,size:1..10000)
	}
}