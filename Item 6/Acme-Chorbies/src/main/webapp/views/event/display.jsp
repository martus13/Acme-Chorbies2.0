<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="f" uri="http://example.com/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<security:authentication var="principalUserAccount" property="principal" />

<div>
	<ul>
		<li>
			<b><spring:message code="event.title" />:</b>
			<jstl:out value="${event.title}" />
		</li>
		
		<li>
			<b><spring:message code="event.organisedMoment" />:</b>
			<fmt:formatDate value="${event.organisedMoment}" pattern="dd/MM/yyyy HH:mm:ss" />
		</li>
		
		<li>
			<b><spring:message code="event.description" />:</b>
			<jstl:out value="${event.description}" />
		</li>
		
		<li>
			<b><spring:message code="event.picture" />:</b>
			<img src="${event.picture}" style="max-height: 200px;" />
		</li>
		
		<li>
			<b><spring:message code="event.seatsNumber" />:</b>
			<jstl:out value="${event.seatsNumber}" />
		</li>
		
		<li>
			<b><spring:message code="event.availableSeats" />:</b>
			<jstl:out value="${event.availableSeats}" />
		</li>
		
		<li>
			<b><spring:message code="event.manager" />:</b>
			<jstl:out value="${event.manager.name}" />
			<security:authorize access="hasAnyRole('MANAGER','CHORBI')" >
				<jstl:if test="${principalUserAccount.id != event.manager.userAccount.id}">
					<a href="chirp/actor/create.do?receiverId=${event.manager.id}">
						<spring:message code="event.manager.chirp" />
					</a>
				</jstl:if>
			</security:authorize>
		</li>
		
		<security:authorize access="hasRole('MANAGER')">
			<jstl:if test="${principalUserAccount.id == event.manager.userAccount.id}">
				<li>
					<b><spring:message code="event.chorbies" />:</b><br />
					<display:table name="${event.chorbies}" id="row" >
					
						<spring:message code="event.chorbi.name" var="nameHeader" />
						<display:column title="${nameHeader}" sortable="true">
							<jstl:out value="${f:replaceAllPhoneAndEmail(row.name, '***')}" />
						</display:column>
						
						<spring:message code="event.chorbi.surname" var="surnameHeader" />
						<display:column title="${surnameHeader}" sortable="true">
							<jstl:out value="${f:replaceAllPhoneAndEmail(row.surname, '***')}" />
						</display:column>
						
						<acme:columnImages code="event.chorbi.picture" properties="${row.picture}" />
						
						<spring:message code="event.chorbi.description" var="descriptionHeader" />
						<display:column title="${descriptionHeader}" sortable="false">
							<jstl:out value="${f:replaceAllPhoneAndEmail(row.description, '***')}" />
						</display:column>
						
						<acme:column code="event.chorbi.birthDate" property="birthDate" format="{0,date,dd/MM/yyyy}" />
						
						<acme:column code="event.chorbi.genre" property="genre" />
						
						<acme:column code="event.chorbi.relationship" property="relationshipEngage" />
						
						<spring:message code="event.chorbi.coordinates" var="coordinatesHeader" />
						<display:column title="${coordinatesHeader}" sortable="false">
							<ul>
								<li>
									<spring:message code="event.chorbi.country" />: 
									<jstl:out value="${row.coordinates.country }" />
								</li>
								
								<jstl:if test="${not empty row.coordinates.state }">
									<li>
										<spring:message code="event.chorbi.state" />: 
										<jstl:out value="${row.coordinates.state }" />
									</li>
								</jstl:if>
								
								<jstl:if test="${not empty row.coordinates.provice }">
									<li>
										<spring:message code="event.chorbi.provice" />: 
										<jstl:out value="${row.coordinates.provice }" />
									</li>
								</jstl:if>
								
								<li>
									<spring:message code="event.chorbi.city" />: 
									<jstl:out value="${row.coordinates.city }" />
								</li>
							</ul>
						</display:column>
						
						<display:column sortable="false">
							<jstl:if test="${principalUserAccount.id != row.userAccount.id }">
								<a href="chirp/actor/create.do?receiverId=${row.id}">
									<spring:message code="event.chorbi.chirp" />
								</a>
							</jstl:if>
						</display:column>
					</display:table>
				</li>
			</jstl:if>
		</security:authorize>
		
	</ul>
</div>