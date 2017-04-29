<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<security:authentication var="principalUserAccount" property="principal" />
<display:table name="events" id="row" requestURI="${requestURI }" class="table">
	
	<jstl:set var="style" value="background-color:#FFFFFF" />
	<jstl:if test="${currentDate != null && currentPlusOneMonthDate!=null}">
		<jstl:choose>
			<jstl:when test="${row.organisedMoment lt currentDate }">
				 <!-- Pasado -->
				 <jstl:set var="style" value="background-color:#A4A4A4" />
			</jstl:when>
			<jstl:when test="${(row.organisedMoment lt currentPlusOneMonthDate || row.organisedMoment == currentPlusOneMonthDate) && row.availableSeats>0}">
				 <!-- Disponibles en mas de un mes -->
				 <jstl:set var="style" value="background-color:#F3F781" />
			</jstl:when>
		</jstl:choose>
	</jstl:if>
	
	<acme:column code="event.title" property="title" style="${style }" />
	<acme:column code="event.organisedMoment" property="organisedMoment" format="{0,date,dd/MM/yyyy}" style="${style }" />
	<acme:column code="event.description" property="description" style="${style }" />
	<acme:columnImages code="event.picture" properties="${row.picture}" maxHeight="150px" style="${style}" />
	<acme:column code="event.seatsNumber" property="seatsNumber" style="${style }" />
	<acme:column code="event.availableSeats" property="availableSeats" style="${style }" />
	<acme:column code="event.manager" property="manager.name" style="${style }" />
	
	<security:authorize access="hasRole('CHORBI')">
		<jstl:set var="registered" value="false" />
		<jstl:forEach items="${row.chorbies }" var="chorbi">
			<jstl:if test="${chorbi.userAccount.id==principalUserAccount.id }">
				<jstl:set var="registered" value="true" />
			</jstl:if>
		</jstl:forEach>
		
		<display:column sortable="false" style="${style}" >
			<jstl:choose>
				<jstl:when test="${registered}">
					<form:form action="event/chorbi/unregister.do?eventId=${row.id}" modelAttribute="event">
						<acme:submit name="unregister" code="event.unregister" />
					</form:form>
				</jstl:when>
				<jstl:otherwise>
					<jstl:if test="${row.availableSeats>0 }">
						<form:form action="event/chorbi/register.do?eventId=${row.id}" modelAttribute="event">
							<acme:submit name="register" code="event.register" />
						</form:form>
					</jstl:if>
				</jstl:otherwise>
			</jstl:choose>
		</display:column>
	</security:authorize>
	
	<security:authorize access="hasRole('MANAGER')">
		<display:column sortable="false" style="${style}" >
			<jstl:if test="${row.manager.userAccount.id==principalUserAccount.id }">
				<a href="event/manager/edit.do?eventId=${row.id}">
					<spring:message code="event.edit" />
				</a>
			</jstl:if>
		</display:column>
	</security:authorize>
	
</display:table>

<security:authorize access="hasRole('MANAGER')">
	<a href="event/manager/create.do">
		<spring:message code="event.create" />
	</a>
</security:authorize>

