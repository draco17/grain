
<%@ page import="com.synergyj.grain.domain.CourseModule" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit CourseModule</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">CourseModule List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New CourseModule</g:link></span>
        </div>
        <div class="body">
            <h1>Edit CourseModule</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${courseModuleInstance}">
            <div class="errors">
                <g:renderErrors bean="${courseModuleInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${courseModuleInstance?.id}" />
                <input type="hidden" name="version" value="${courseModuleInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:courseModuleInstance,field:'name','errors')}">
                                    <input type="text" maxlength="50" id="name" name="name" value="${fieldValue(bean:courseModuleInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:courseModuleInstance,field:'description','errors')}">
                                    <textarea rows="5" cols="40" name="description">${fieldValue(bean:courseModuleInstance, field:'description')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="course">Course:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:courseModuleInstance,field:'course','errors')}">
                                    <g:select optionKey="id" from="${com.synergyj.grain.domain.Course.list()}" name="course.id" value="${courseModuleInstance?.course?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="order">Order:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:courseModuleInstance,field:'order','errors')}">
                                    <input type="text" id="order" name="order" value="${fieldValue(bean:courseModuleInstance,field:'order')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated">Date Created:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:courseModuleInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${courseModuleInstance?.dateCreated}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdated">Last Updated:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:courseModuleInstance,field:'lastUpdated','errors')}">
                                    <g:datePicker name="lastUpdated" value="${courseModuleInstance?.lastUpdated}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="topics">Topics:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:courseModuleInstance,field:'topics','errors')}">
                                    
<ul>
<g:each var="t" in="${courseModuleInstance?.topics?}">
    <li><g:link controller="moduleTopic" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="moduleTopic" params="['courseModule.id':courseModuleInstance?.id]" action="create">Add ModuleTopic</g:link>

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
