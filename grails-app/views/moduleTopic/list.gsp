
<%@ page import="com.synergyj.grain.domain.ModuleTopic" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>ModuleTopic List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New ModuleTopic</g:link></span>
        </div>
        <div class="body">
            <h1>ModuleTopic List</h1>
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
                        
                   	        <g:sortableColumn property="lastUpdated" title="Last Updated" />
                        
                   	        <g:sortableColumn property="dateCreated" title="Date Created" />
                        
                   	        <th>Module</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${moduleTopicInstanceList}" status="i" var="moduleTopicInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${moduleTopicInstance.id}">${fieldValue(bean:moduleTopicInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:moduleTopicInstance, field:'name')}</td>
                        
                            <td>${fieldValue(bean:moduleTopicInstance, field:'description')}</td>
                        
                            <td>${fieldValue(bean:moduleTopicInstance, field:'lastUpdated')}</td>
                        
                            <td>${fieldValue(bean:moduleTopicInstance, field:'dateCreated')}</td>
                        
                            <td>${fieldValue(bean:moduleTopicInstance, field:'module')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${moduleTopicInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
