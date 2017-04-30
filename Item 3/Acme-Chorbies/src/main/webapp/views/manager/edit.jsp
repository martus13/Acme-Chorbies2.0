<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<form:form action="${requestURI }" modelAttribute="${actorForm }">
	
	<fieldset>
		<legend>
			<spring:message code="manager.userData" />
		</legend>
		<acme:input path="username" code="manager.username" />
		
		<acme:password path="password" code="manager.password" />
		
		<acme:password path="confirmPassword" code="manager.confirmPassword" />
		<br />
	</fieldset>
		
	<fieldset>
		<legend>
			<spring:message code="manager.personalData" />
		</legend>
		<acme:input path="name" code="manager.name" />
		
		<acme:input path="surname" code="manager.surname" />

		<acme:input path="email" code="manager.email" />
		
		<acme:input path="phoneNumber" code="manager.phoneNumber" />
			
	</fieldset>
	<br>
	
	<fieldset>
		<legend>
			<spring:message code="manager.managerData" />
		</legend>
		<acme:input path="company" code="manager.company" />
		
		<acme:input path="vatNumber" code="manager.vatNumber" />
					
	</fieldset>
	<br>
	
	<security:authorize access="isAnonymous()">
		<form:checkbox path="isAgree"/>
		<form:label path="isAgree">
			<spring:message code="manager.acceptConditions" />
			<a href="misc/conditions.do" target="_blank"><spring:message code="manager.conditions" /></a>
		</form:label>
		<br />
	</security:authorize>
	
	<acme:submit name="save" code="manager.save" />
	<acme:cancel url="welcome/index.do" code="manager.cancel" />
		
</form:form>
	

<script>
	function GeneralYes(){
		document.getElementById("general").disabled = false;
	}
	
	function GeneralNo(){
		document.getElementById("general").disabled = true;
	}
</script>
