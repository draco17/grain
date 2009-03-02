
<%@ page import="com.synergyj.grain.domain.CourseModule" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>CourseModule List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New CourseModule</g:link></span>
        </div>
        <div class="body">
            <h1>CourseModule List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                   	        <g:sortableColumn property="description" title="Description" />
                        
                   	        <th>Course</th>
                   	    
                   	        <g:sortableColumn property="order" title="Order" />
                        
                   	        <g:sortableColumn property="dateCreated" title="Date Created" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${courseModuleInstanceList}" status="i" var="courseModuleInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${courseModuleInstance.id}">${fieldValue(bean:courseModuleInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:courseModuleInstance, field:'name')}</td>
                        
                            <td>${fieldValue(bean:courseModuleInstance, field:'description')}</td>
                        
                            <td>${fieldValue(bean:courseModuleInstance, field:'course')}</td>
                        
                            <td>${fieldValue(bean:courseModuleInstance, field:'order')}</td>
                        
                            <td>${fieldValue(bean:courseModuleInstance, field:'dateCreated')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${courseModuleInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
