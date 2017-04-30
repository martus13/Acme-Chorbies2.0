<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<form:form action="${requestURI}" modelAttribute="chirp">
	
	<form:hidden path="id"/>
	<form:hidden path="version"/>
	<form:hidden path="copy"/>
	<form:hidden path="sender"/>
	<form:hidden path="recipient"/>
	<form:hidden path="sentMoment"/>
	
	<acme:input code="chirp.subject" path="subject"/>
	<acme:textarea code="chirp.text" path="text"/>
	<acme:textarea code="chirp.attachments" path="attachments"/>
	
	<security:authorize access="hasRole('CHORBI')">
	<acme:submit name="save" code="chirp.save" />
	</security:authorize>
	
	<security:authorize access="hasRole('MANAGER')">
	<form:form action="chirp/manager/create?eventId=${eventId}" modelAttribute="chirp">
		<acme:submit name="broadcast" code="chirp.save" />
	</form:form>
	</security:authorize>
	
	<acme:cancel url="chorbi/actor/list.do" code="chirp.cancel" />
	
</form:form>