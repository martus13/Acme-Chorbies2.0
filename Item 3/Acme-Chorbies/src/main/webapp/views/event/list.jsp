<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<display:table name="events" id="row" requestURI="${requestURI }">
	
	<jstl:set var="style" value="null" />
	<security:authorize access="isAnonymous()">
		<jstl:if test="${currentDate != null && currentPlusOneMonthDate!=null}">
			<jstl:choose>
				<jstl:when test="${row.organisedMoment lt currentDate }">
					<jstl:set var="style" value="background-color:#A4A4A4" />
				</jstl:when>
				<jstl:when test="${row.organisedMoment lt currentPlusOneMonthDate || row.organisedMoment == currentPlusOneMonthDate}">
					<jstl:set var="style" value="background-color:#F3F781" />
				</jstl:when>
			</jstl:choose>
		</jstl:if>
	</security:authorize>
	
	<acme:column code="event.title" property="title" style="${style }" />
	<acme:column code="event.organisedMoment" property="organisedMoment" format="{0,date,dd/MM/yyyy}" style="${style }" />
	<acme:column code="event.description" property="description" style="${style }" />
	<acme:columnImages code="event.picture" properties="${row.picture}" maxHeight="150px" style="${style}" />
	<acme:column code="event.seatsNumber" property="seatsNumber" style="${style }" />
	<acme:column code="event.availableSeats" property="availableSeats" style="${style }" />
	
</display:table>
