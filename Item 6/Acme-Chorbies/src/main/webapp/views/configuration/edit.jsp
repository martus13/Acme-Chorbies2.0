<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<form:form action="configuration/administrator/edit.do" modelAttribute="configuration" >
	
	<form:hidden path="id" />
	<form:hidden path="version" />
	
	<acme:input code="configuration.cachedTime" path="cachedTime" placeholder="HH:mm:ss" />
	<acme:input code="configuration.chorbiFee" path="chorbiFee" min="0" step="0.01" />
	<acme:input code="configuration.managerFee" path="managerFee" min="0" step="0.01" />
	
	<acme:submit name="save" code="configuration.save" />
	
	<acme:cancel url="" code="configuration.cancel" />
	
</form:form>
	