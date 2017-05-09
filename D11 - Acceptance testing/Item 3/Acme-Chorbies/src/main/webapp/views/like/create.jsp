<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<form:form action="like/chorbi/create.do" modelAttribute="like">
	
	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="givenBy" />
	<form:hidden path="givenTo" />
	<form:hidden path="likeMoment" />
	
	<form:label path="starsNumber">
			<spring:message code="like.stars" />
	</form:label>	
	<form:select path="starsNumber">
			<form:option value="0" label="0" />		
			<form:option value="1" label="1" />
			<form:option value="2" label="2" />
			<form:option value="3" label="3" />
	</form:select>
	<form:errors path="starsNumber" cssClass="error" />
	
	
	<acme:textarea code="like.comment" path="comment" rows="3" />
	
	<acme:submit name="save" code="like.save" />
	<acme:cancel url="chorbi/actor/list.do" code="like.cancel" />
		
</form:form>
