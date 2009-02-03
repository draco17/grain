
<%@ page import="com.grainapp.domain.Course" %>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>Edit Course</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Course List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Course</g:link></span>
        </div>
        <div class="body">
            <h2>Edit Course</h2>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${courseInstance}">
            <div class="errors">
                <g:renderErrors bean="${courseInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${courseInstance?.id}" />
                <input type="hidden" name="version" value="${courseInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:courseInstance,field:'name','errors')}">
                                    <input type="text" maxlength="50" id="name" name="name" value="${fieldValue(bean:courseInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:courseInstance,field:'description','errors')}">
                                    <textarea rows="5" cols="40" name="description">${fieldValue(bean:courseInstance, field:'description')}</textarea>
                                </td>
                            </tr> 
                                                
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Update" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
