
<%@ page import="com.synergyj.grain.auth.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create User</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">User List</g:link></span>
        </div>
        <div class="body">
            
            <g:if test="${flash.message}">
            <div id="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${userInstance}">
            <div id="errors">
                <g:renderErrors bean="${userInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
			<fieldset><legend><h2>Create User</h2></legend>
			      <div class="notes">
			        <h4>Signup</h4>
			        <p class="last">Please register to get your account.</p>
			       </div>
			      <div class="required">
			        <label for="email">Email:</label>
					<input type="text" id="email" name="email" value="${fieldValue(bean:userInstance,field:'email')}"/>
			      </div>

			      <div class="required">
			        <label for="login">Login:</label>
					<input type="text" maxlength="25" id="login" name="login" value="${fieldValue(bean:userInstance,field:'login')}"/><br/>
			      </div>
			      <div class="optional">

			        <label for="password">Password:</label>
					<input type="text" id="password" name="password" value="${fieldValue(bean:userInstance,field:'password')}"/>

			      </div>
			
				<div class="required">
					<label for="realName">Real Name:</label>
					<input type="text" maxlength="200" id="realName" name="realName" value="${fieldValue(bean:userInstance,field:'realName')}"/>
				</div>
				
				<div class="required">
					<label for="company">Company:</label>
					<input type="text" maxlength="100" id="company" name="company" value="${fieldValue(bean:userInstance,field:'company')}"/>
				</div>
				
				<div class="required">
					<label for="geolocation">Geolocation:</label>
					<input type="text" maxlength="200" id="geolocation" name="geolocation" value="${fieldValue(bean:userInstance,field:'geolocation')}"/>
				</div>
				
				<div class="required">
					<label for="about">About:</label>
					<textarea rows="5" cols="40" name="about">${fieldValue(bean:userInstance, field:'about')}</textarea>
				</div>
				
				<div class="required">
					<label for="blog">Blog:</label>
					<input type="text" maxlength="200" id="blog" name="blog" value="${fieldValue(bean:userInstance,field:'blog')}"/>
				</div>
				
				<div class="required">
					<label for="enabled">Enabled:</label><g:checkBox name="enabled" value="${userInstance?.enabled}" ></g:checkBox>
				</div>
				
				<div class="required">
				</div>
				
			
			
				

				

				

				

				

				

				<input class="save" type="submit" value="Create" />

			    </fieldset>




            </g:form>
        </div>
    </body>
</html>
