
<%@ page import="com.synergyj.grain.domain.ModuleTopic" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit ModuleTopic</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">ModuleTopic List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New ModuleTopic</g:link></span>
        </div>
        <div class="body">
            <h1>Edit ModuleTopic</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${moduleTopicInstance}">
            <div class="errors">
                <g:renderErrors bean="${moduleTopicInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${moduleTopicInstance?.id}" />
                <input type="hidden" name="version" value="${moduleTopicInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name">Name:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:moduleTopicInstance,field:'name','errors')}">
                                    <input type="text" maxlength="50" id="name" name="name" value="${fieldValue(bean:moduleTopicInstance,field:'name')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:moduleTopicInstance,field:'description','errors')}">
                                    <textarea rows="5" cols="40" name="description">${fieldValue(bean:moduleTopicInstance, field:'description')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="module">Module:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:moduleTopicInstance,field:'module','errors')}">
                                    <g:select optionKey="id" from="${com.synergyj.grain.domain.CourseModule.list()}" name="module.id" value="${moduleTopicInstance?.module?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="parent">Parent:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:moduleTopicInstance,field:'parent','errors')}">
                                    <g:select optionKey="id" from="${com.synergyj.grain.domain.ModuleTopic.list()}" name="parent.id" value="${moduleTopicInstance?.parent?.id}" noSelection="['null':'']"></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="order">Order:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:moduleTopicInstance,field:'order','errors')}">
                                    <input type="text" id="order" name="order" value="${fieldValue(bean:moduleTopicInstance,field:'order')}" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated">Date Created:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:moduleTopicInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${moduleTopicInstance?.dateCreated}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="lastUpdated">Last Updated:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:moduleTopicInstance,field:'lastUpdated','errors')}">
                                    <g:datePicker name="lastUpdated" value="${moduleTopicInstance?.lastUpdated}" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="topics">Topics:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:moduleTopicInstance,field:'topics','errors')}">
                                    
<ul>
<g:each var="t" in="${moduleTopicInstance?.topics?}">
    <li><g:link controller="moduleTopic" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="moduleTopic" params="['moduleTopic.id':moduleTopicInstance?.id]" action="create">Add ModuleTopic</g:link>

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
