
<%@ page import="com.grainapp.content.NewsItem" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create NewsItem</title>      
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(controller:'home')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">NewsItem List</g:link></span>
        </div>

		


        <div class="body">
            <h1>Create NewsItem</h1>
            <g:if test="${flash.message}">
            <div id="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${newsItemInstance}">
            <div id="errors">
                <g:renderErrors bean="${newsItemInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title">Title:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:newsItemInstance,field:'title','errors')}">
                                    <input type="text" maxlength="200" id="title" name="title" value="${fieldValue(bean:newsItemInstance,field:'title')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="body">Body:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:newsItemInstance,field:'body','errors')}">
                                    <textarea rows="5" cols="40" name="body">${fieldValue(bean:newsItemInstance, field:'body')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="author">Author:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:newsItemInstance,field:'author','errors')}">
                                    <g:select optionKey="id" from="${com.grainapp.auth.User.list()}" name="author.id" value="${newsItemInstance?.author?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="publishedDate">Published Date:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:newsItemInstance,field:'publishedDate','errors')}">
                                    <g:datePicker name="publishedDate" value="${newsItemInstance?.publishedDate}" ></g:datePicker>


                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
<input id="datepicker" type="text" name="publishedDate" value="${newsItemInstance?.publishedDate}">

                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>



			<div id="right">
				<h2 class="mem">Member Login</h2>
				<form name="memberLogin" action="#" method="post">
				<input type="text" name="name" class="txtBox" value="-your name-" />
				<input type="password" name="name" class="txtBox" value="-password-" />
				<a href="#">Register here</a>
				<input type="submit" name="login" value="" class="login" />
				<br class="spacer" />
				</form>
				<p class="bottom2"></p>
				<br class="spacer" />
				</div>
        </div>
    </body>
</html>
