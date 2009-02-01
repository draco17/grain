
<%@ page import="com.grainapp.domain.Course" %>
<html>
    <head>
        <meta name="layout" content="synergyj" />
        <title>Course List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(controller:'home')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Course</g:link></span>
        </div>

		<h2>Course List</h2>
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
                    
               	        <g:sortableColumn property="dateCreated" title="Date Created" />
                    
               	        <g:sortableColumn property="lastUpdated" title="Last Updated" />
                    
                    </tr>
                </thead>
                <tbody>
                <g:each in="${courseInstanceList}" status="i" var="courseInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                    
                        <td><g:link action="show" id="${courseInstance.id}">${fieldValue(bean:courseInstance, field:'id')}</g:link></td>
                    
                        <td>${fieldValue(bean:courseInstance, field:'name')}</td>
                    
                        <td>${fieldValue(bean:courseInstance, field:'description')}</td>
                    
                        <td>${fieldValue(bean:courseInstance, field:'dateCreated')}</td>
                    
                        <td>${fieldValue(bean:courseInstance, field:'lastUpdated')}</td>
                    
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
        <div class="paginateButtons">
            <g:paginate total="${courseInstanceTotal}" />
        </div>
    </body>
</html>
