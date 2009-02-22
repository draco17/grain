dataFile = "cobertura.ser"

codeCoverageExclusionList = [
    "**/*BootStrap*",
    "Config*",
    "**/*DataSource*",
    "**/*resources*",
    "**/*UrlMappings*",
    "**/*Tests*",
    "**/grails/test/**",
    "**/org/codehaus/groovy/grails/**",
    "**/PreInit*",
    "*GrailsPlugin*" ]

ant.path(id: "cobertura.classpath"){
	fileset(dir:"${codeCoveragePluginDir}/lib"){
		include(name:"*.jar")
	}
}

eventTestPhasesStart = {
	println 'instrumenting classes for coverage'

	ant.delete(file:"${dataFile}")    

	ant.taskdef (  classpathRef : 'cobertura.classpath', resource:"tasks.properties" )

    if (config.coverage.exclusions) {
      codeCoverageExclusionList += config.coverage.exclusions
    }

    try {
        //for now, instrument classes in the same directory grails creates for testClasses
        //TODO - need to figure out how to put cobertura instrumented classes in different dir
        //and put that dir in front of testClasses in the classpath
        ant.'cobertura-instrument' (datafile:"${dataFile}") {
            fileset(dir:classesDirPath) {
                include(name:"**/*.class")
                codeCoverageExclusionList.each { pattern ->
                    exclude(name:pattern)
                }
            }
        }
    }
    catch(Exception e) {
       event("StatusFinal", ["Error instrumenting classes: ${e.message}"])
       exit(1)
    }
}

eventTestPhasesEnd = {
	flushReportData()
	
	coverageReportDir = "${config.grails.testing.reports.destDir ?: testReportsDir}/cobertura"
    ant.mkdir(dir:"${coverageReportDir}")
    ant.taskdef (  classpathRef : 'cobertura.classpath', resource:"tasks.properties" )

    ant.'cobertura-report'(destDir:"${coverageReportDir}", datafile:"${dataFile}", format:'html'){
        //load all these dirs independently so the dir structure is flattened,
        //otherwise the source isn't found for the reports
        fileset(dir:"${basedir}/grails-app/controllers")
        fileset(dir:"${basedir}/grails-app/domain")
        fileset(dir:"${basedir}/grails-app/services")
        fileset(dir:"${basedir}/grails-app/taglib")
        fileset(dir:"${basedir}/grails-app/utils")
        fileset(dir:"${basedir}/src/groovy")
        fileset(dir:"${basedir}/src/java")
        if (config.coverage?.sourceInclusions){
            config.coverage.sourceInclusions.each {
                fileset(dir:"${basedir}/${it}")
            }
        }
    }
}

def flushReportData(){
	try {
		net.sourceforge.cobertura.coveragedata.ProjectData.saveGlobalProjectData()
	} catch (Exception e){
       event("StatusError", ["""
--------------------------------------------
***********WARNING*************
Unable to flush code coverage data.  
This usually happens when tests don't actually test anything;
e.g. none of the instrumented classes were exercised by tests!
--------------------------------------------
"""])
	}
}
