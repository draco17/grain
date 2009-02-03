<html>
<head>
	<title>Bienvenidos</title>
	<meta name="layout" content="synergyj" />
</head>
<body>
	<div id="box">
		<h2>Controllers</h2>
		<ul>
			<g:each var="c" in="${grailsApplication.controllerClasses}">
				<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
			</g:each>
		</ul>
	</div>
</body>
</html>
