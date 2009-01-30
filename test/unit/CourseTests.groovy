import grails.test.*

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
