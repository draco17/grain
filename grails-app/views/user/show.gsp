
<%@ page import="com.grainapp.auth.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show User</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">User List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New User</g:link></span>
        </div>
        <div class="body">
            <h1>Show User</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:userInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Email:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:userInstance, field:'email')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Login:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:userInstance, field:'login')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Password:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:userInstance, field:'password')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Real Name:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:userInstance, field:'realName')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Company:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:userInstance, field:'company')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Geolocation:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:userInstance, field:'geolocation')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">About:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:userInstance, field:'about')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Blog:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:userInstance, field:'blog')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Enabled:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:userInstance, field:'enabled')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date Created:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:userInstance, field:'dateCreated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Last Updated:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:userInstance, field:'lastUpdated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Roles:</td>
                            
                            <td  valign="top" style="text-align:left;" class="value">
                                <ul>
                                <g:each var="r" in="${userInstance.roles}">
                                    <li><g:link controller="role" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${userInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
