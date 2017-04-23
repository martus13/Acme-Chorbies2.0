<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<form:form action="event/manager/edit.do" modelAttribute="event">
	
	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="availableSeats" />
	<form:hidden path="manager" />
	<form:hidden path="chorbies" />
	
	<acme:input code="event.title" path="title" />
	<acme:input code="event.organisedMoment" path="organisedMoment" />
	<acme:textarea code="event.description" path="description" rows="3" />
	<acme:textarea code="event.picture" path="picture" rows="3" />
	<acme:input code="event.seatsNumber" path="seatsNumber" type="number" />
	
	<acme:submit name="save" code="event.save" />
	<jstl:if test="${event.id!=0}">
		<acme:submit name="delete" code="event.delete" />
	</jstl:if>
	<acme:cancel url="event/manager/listByManager.do" code="event.cancel" />
		
</form:form>
