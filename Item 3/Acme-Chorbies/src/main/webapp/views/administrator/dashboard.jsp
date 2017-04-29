<%--
 * action-1.jsp
 *
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="f" uri="http://example.com/functions" %>

<p><spring:message code="admin.dashboard.numChorbiesPerCountryCity" /></p>
<display:table name="numChorbiesPerCountryAndCity" id="row" requestURI="${requestURI }"
	pagesize="5" class="displaytag">
	
	<acme:column code="admin.dashboard.country" property="[0]" />
	
	<acme:column code="admin.dashboard.city" property="[1]" />
	
	<acme:column code="admin.dashboard.numChorbies" property="[2]" />
	
</display:table>

<div>
	<spring:message code="admin.dashboard.minMaxAvgAges" />
	<ul>
		<li>
			<b><spring:message code="admin.dashboard.min"/>:</b>
			<jstl:out value="${minMaxAvgAges[0]}"/>
		</li>
		<li>
			<b><spring:message code="admin.dashboard.max"/>:</b>
			<jstl:out value="${minMaxAvgAges[1]}"/>
		</li>
		<li>
			<b><spring:message code="admin.dashboard.avg"/>:</b>
			<jstl:out value="${minMaxAvgAges[2]}"/>
		</li>
	</ul>
</div>

<p>
	<spring:message code="admin.dashboard.ratioInvalidCreditCard" />: 
	<jstl:out value="${ratioInvalidCreditCard }" />.
</p>

<p><spring:message code="admin.dashboard.ratioActivitiesLoveFriendship" /></p>
<display:table name="ratioActivitiesLoveFriendship" id="row" requestURI="${requestURI }"
	pagesize="5" class="displaytag">
	
	<acme:column code="admin.dashboard.relationshipType" property="[0]" />
	
	<acme:column code="admin.dashboard.ratio" property="[1]" />
	
</display:table>

<p><spring:message code="admin.dashboard.chorbiesSortedByNumLikes" /></p>
<display:table name="chorbiesSortedByNumLikes" id="row" requestURI="${requestURI }"
	pagesize="5" class="displaytag">
	
	<spring:message code="admin.dashboard.chorbi.name" var="nameHeader" />
	<display:column title="${nameHeader}" sortable="true">
		<jstl:out value="${f:replaceAllPhoneAndEmail(row.name, '***')}" />
	</display:column>
	
	<spring:message code="admin.dashboard.chorbi.surname" var="surnameHeader" />
	<display:column title="${surnameHeader}" sortable="true">
		<jstl:out value="${f:replaceAllPhoneAndEmail(row.surname, '***')}" />
	</display:column>
	
	<acme:columnImages code="admin.dashboard.chorbi.picture" properties="${row.picture}" />
	
	<spring:message code="admin.dashboard.chorbi.description" var="descriptionHeader" />
	<display:column title="${descriptionHeader}" sortable="false">
		<jstl:out value="${f:replaceAllPhoneAndEmail(row.description, '***')}" />
	</display:column>
	
	<acme:column code="admin.dashboard.chorbi.birthDate" property="birthDate" format="{0,date,dd/MM/yyyy}" />
	
	<acme:column code="admin.dashboard.chorbi.genre" property="genre" />
	
	<acme:column code="admin.dashboard.chorbi.relationshipEngage" property="relationshipEngage" />
	
	<spring:message code="admin.dashboard.chorbi.coordinates" var="coordinatesHeader" />
	<display:column title="${coordinatesHeader}" sortable="false">
		<ul>
			<li>
				<spring:message code="admin.dashboard.chorbi.country" />: 
				<jstl:out value="${row.coordinates.country }" />
			</li>
			
			<jstl:if test="${not empty row.coordinates.state }">
				<li>
					<spring:message code="admin.dashboard.chorbi.state" />: 
					<jstl:out value="${row.coordinates.state }" />
				</li>
			</jstl:if>
			
			<jstl:if test="${not empty row.coordinates.provice }">
				<li>
					<spring:message code="admin.dashboard.chorbi.provice" />: 
					<jstl:out value="${row.coordinates.provice }" />
				</li>
			</jstl:if>
			
			<li>
				<spring:message code="admin.dashboard.chorbi.city" />: 
				<jstl:out value="${row.coordinates.city }" />
			</li>
		</ul>
	</display:column>
	
</display:table>

<spring:message code="admin.dashboard.minMaxAvgLikesPerChorbi" />
<ul>
	<li>
		<b><spring:message code="admin.dashboard.min"/>:</b>
		<jstl:out value="${minMaxAvgLikesPerChorbi[0]}"/>
	</li>
	<li>
		<b><spring:message code="admin.dashboard.max"/>:</b>
		<jstl:out value="${minMaxAvgLikesPerChorbi[1]}"/>
	</li>
	<li>
		<b><spring:message code="admin.dashboard.avg"/>:</b>
		<jstl:out value="${minMaxAvgLikesPerChorbi[2]}"/>
	</li>
</ul>

<spring:message  code="admin.dashboard.minMaxAvgReceivedChirps" />
<ul>
	<li>
		<b><spring:message code="admin.dashboard.min"/>:</b>
		<jstl:out value="${minMaxAvgReceivedChirps[0]}"/>
	</li>
	<li>
		<b><spring:message code="admin.dashboard.max"/>:</b>
		<jstl:out value="${minMaxAvgReceivedChirps[1]}"/>
	</li>
	<li>
		<b><spring:message code="admin.dashboard.avg"/>:</b>
		<jstl:out value="${minMaxAvgReceivedChirps[2]}"/>
	</li>
</ul>

<spring:message  code="admin.dashboard.MinMaxAvgChirpsSentPerChorbi" />
<ul>
	<li>
		<b><spring:message code="admin.dashboard.min"/>:</b>
		<jstl:out value="${minMaxAvgChirpsSentPerChorbi[0]}"/>
	</li>
	<li>
		<b><spring:message code="admin.dashboard.max"/>:</b>
		<jstl:out value="${minMaxAvgChirpsSentPerChorbi[1]}"/>
	</li>
	<li>
		<b><spring:message code="admin.dashboard.avg"/>:</b>
		<jstl:out value="${minMaxAvgChirpsSentPerChorbi[2]}"/>
	</li>
</ul>

<spring:message code="admin.dashboard.chorbiesMoreReceived" />
<display:table name="chorbiWithMostReceivedChirps" id="row" requestURI="${requestURI }"
	pagesize="5" class="displaytag">

	<spring:message code="admin.dashboard.chorbi.name" var="nameHeader" />
	<display:column title="${nameHeader}" sortable="true">
		<jstl:out value="${f:replaceAllPhoneAndEmail(row[1].name, '***')} ${f:replaceAllPhoneAndEmail(row[1].surname, '***')}" />
	</display:column>
	<spring:message code="admin.dashboard.chorbi.quantity" var="quantityHeader" />
	<display:column title="${quantityHeader}" sortable="true">
		<jstl:out value="${row[0]}" />
	</display:column>
</display:table>

<spring:message code="admin.dashboard.chorbiesMoreSent" />
<display:table name="chorbiWithMostSentChirps" id="row" requestURI="${requestURI }"
	pagesize="5" class="displaytag">

	<spring:message code="admin.dashboard.chorbi.name" var="nameHeader" />
	<display:column title="${nameHeader}" sortable="true">
		<jstl:out value="${f:replaceAllPhoneAndEmail(row[1].name, '***')} ${f:replaceAllPhoneAndEmail(row[1].surname, '***')} " />
	</display:column>
	<spring:message code="admin.dashboard.chorbi.quantity" var="quantityHeader" />
	<display:column title="${quantityHeader}" sortable="true">
		<jstl:out value="${row[0]}" />
	</display:column>
</display:table>

<spring:message code="admin.dashboard.managersSortedByEvents" />
<display:table name="managersSortedByEvents" id="row" requestURI="${requestURI }"
	pagesize="5" class="displaytag">

	<acme:column code="admin.dashboard.manager.name" property="[1].name"/>
	<acme:column code="admin.dashboard.manager.surname" property="[1].surname"/>
	<acme:column code="admin.dashboard.manager.email" property="[1].email"/>
	<acme:column code="admin.dashboard.manager.phoneNumber" property="[1].phoneNumber"/>
	<acme:column code="admin.dashboard.manager.company" property="[1].company"/>
	<acme:column code="admin.dashboard.manager.vatNumber" property="[1].vatNumber"/>
	
	<spring:message code="admin.dashboard.actor.eventsNumber" var="quantityHeader" />
	<display:column title="${quantityHeader}" sortable="true">
		<jstl:out value="${row[0]}" />
	</display:column>
</display:table>

<spring:message code="admin.dashboard.managersAndFee" />
<display:table name="managersAndFee" id="row" requestURI="${requestURI }"
	pagesize="5" class="displaytag">

	<acme:column code="admin.dashboard.manager.name" property="[0].name"/>
	<acme:column code="admin.dashboard.manager.surname" property="[0].surname"/>
	<acme:column code="admin.dashboard.manager.email" property="[0].email"/>
	<acme:column code="admin.dashboard.manager.phoneNumber" property="[0].phoneNumber"/>
	<acme:column code="admin.dashboard.manager.company" property="[0].company"/>
	<acme:column code="admin.dashboard.manager.vatNumber" property="[0].vatNumber"/>
	
	<spring:message code="admin.dashboard.actor.amountFees" var="quantityHeader" />
	<display:column title="${quantityHeader}" sortable="true">
		<jstl:out value="${row[1]}" />
	</display:column>
</display:table>

<spring:message code="admin.dashboard.chorbiesSortedByEvents" />
<display:table name="chorbiesSortedByEvents" id="row" requestURI="${requestURI }"
	pagesize="5" class="displaytag">

	<spring:message code="admin.dashboard.chorbi.name" var="nameHeader" />
	<display:column title="${nameHeader}" sortable="true">
		<jstl:out value="${f:replaceAllPhoneAndEmail(row[1].name, '***')}" />
	</display:column>
	
	<spring:message code="admin.dashboard.chorbi.surname" var="surnameHeader" />
	<display:column title="${surnameHeader}" sortable="true">
		<jstl:out value="${f:replaceAllPhoneAndEmail(row[1].surname, '***')}" />
	</display:column>
	
	<acme:columnImages code="admin.dashboard.chorbi.picture" properties="${row[1].picture}" />
	
	<spring:message code="admin.dashboard.chorbi.description" var="descriptionHeader" />
	<display:column title="${descriptionHeader}" sortable="false">
		<jstl:out value="${f:replaceAllPhoneAndEmail(row[1].description, '***')}" />
	</display:column>
	
	<acme:column code="admin.dashboard.chorbi.birthDate" property="[1].birthDate" format="{0,date,dd/MM/yyyy}" />
	
	<acme:column code="admin.dashboard.chorbi.genre" property="[1].genre" />
	
	<acme:column code="admin.dashboard.chorbi.relationshipEngage" property="[1].relationshipEngage" />
	
	<spring:message code="admin.dashboard.chorbi.coordinates" var="coordinatesHeader" />
	<display:column title="${coordinatesHeader}" sortable="false">
		<ul>
			<li>
				<spring:message code="admin.dashboard.chorbi.country" />: 
				<jstl:out value="${row[1].coordinates.country }" />
			</li>
			
			<jstl:if test="${not empty row[1].coordinates.state }">
				<li>
					<spring:message code="admin.dashboard.chorbi.state" />: 
					<jstl:out value="${row[1].coordinates.state }" />
				</li>
			</jstl:if>
			
			<jstl:if test="${not empty row[1].coordinates.provice }">
				<li>
					<spring:message code="admin.dashboard.chorbi.provice" />: 
					<jstl:out value="${row[1].coordinates.provice }" />
				</li>
			</jstl:if>
			
			<li>
				<spring:message code="admin.dashboard.chorbi.city" />: 
				<jstl:out value="${row[1].coordinates.city }" />
			</li>
		</ul>
	</display:column>
	
	<spring:message code="admin.dashboard.actor.eventsNumber" var="quantityHeader" />
	<display:column title="${quantityHeader}" sortable="true">
		<jstl:out value="${row[0]}" />
	</display:column>
</display:table>

<spring:message code="admin.dashboard.chorbiesAndFee" />
<display:table name="chorbiesAndFee" id="row" requestURI="${requestURI }"
	pagesize="5" class="displaytag">

	<spring:message code="admin.dashboard.chorbi.name" var="nameHeader" />
	<display:column title="${nameHeader}" sortable="true">
		<jstl:out value="${f:replaceAllPhoneAndEmail(row[0].name, '***')}" />
	</display:column>
	
	<spring:message code="admin.dashboard.chorbi.surname" var="surnameHeader" />
	<display:column title="${surnameHeader}" sortable="true">
		<jstl:out value="${f:replaceAllPhoneAndEmail(row[0].surname, '***')}" />
	</display:column>
	
	<acme:columnImages code="admin.dashboard.chorbi.picture" properties="${row[0].picture}" />
	
	<spring:message code="admin.dashboard.chorbi.description" var="descriptionHeader" />
	<display:column title="${descriptionHeader}" sortable="false">
		<jstl:out value="${f:replaceAllPhoneAndEmail(row[0].description, '***')}" />
	</display:column>
	
	<acme:column code="admin.dashboard.chorbi.birthDate" property="[0].birthDate" format="{0,date,dd/MM/yyyy}" />
	
	<acme:column code="admin.dashboard.chorbi.genre" property="[0].genre" />
	
	<acme:column code="admin.dashboard.chorbi.relationshipEngage" property="[0].relationshipEngage" />
	
	<spring:message code="admin.dashboard.chorbi.coordinates" var="coordinatesHeader" />
	<display:column title="${coordinatesHeader}" sortable="false">
		<ul>
			<li>
				<spring:message code="admin.dashboard.chorbi.country" />: 
				<jstl:out value="${row[0].coordinates.country }" />
			</li>
			
			<jstl:if test="${not empty row[0].coordinates.state }">
				<li>
					<spring:message code="admin.dashboard.chorbi.state" />: 
					<jstl:out value="${row[0].coordinates.state }" />
				</li>
			</jstl:if>
			
			<jstl:if test="${not empty row[0].coordinates.provice }">
				<li>
					<spring:message code="admin.dashboard.chorbi.provice" />: 
					<jstl:out value="${row[0].coordinates.provice }" />
				</li>
			</jstl:if>
			
			<li>
				<spring:message code="admin.dashboard.chorbi.city" />: 
				<jstl:out value="${row[0].coordinates.city }" />
			</li>
		</ul>
	</display:column>
	
	<spring:message code="admin.dashboard.actor.amountFees" var="quantityHeader" />
	<display:column title="${quantityHeader}" sortable="true">
		<jstl:out value="${row[1]}" />
	</display:column>
</display:table>

<spring:message  code="admin.dashboard.minMaxAvgStarsPerChorbi" />
<ul>
	<li>
		<b><spring:message code="admin.dashboard.min"/>:</b>
		<jstl:out value="${minMaxAvgStarsPerChorbi[0]}"/>
	</li>
	<li>
		<b><spring:message code="admin.dashboard.max"/>:</b>
		<jstl:out value="${minMaxAvgStarsPerChorbi[1]}"/>
	</li>
	<li>
		<b><spring:message code="admin.dashboard.avg"/>:</b>
		<jstl:out value="${minMaxAvgStarsPerChorbi[2]}"/>
	</li>
</ul>

<spring:message code="admin.dashboard.chorbiesSortedByAvgStars" />
<display:table name="chorbiesSortedByAvgStars" id="row" requestURI="${requestURI }"
	pagesize="5" class="displaytag">

	<spring:message code="admin.dashboard.chorbi.name" var="nameHeader" />
	<display:column title="${nameHeader}" sortable="true">
		<jstl:out value="${f:replaceAllPhoneAndEmail(row[0].name, '***')}" />
	</display:column>
	
	<spring:message code="admin.dashboard.chorbi.surname" var="surnameHeader" />
	<display:column title="${surnameHeader}" sortable="true">
		<jstl:out value="${f:replaceAllPhoneAndEmail(row[0].surname, '***')}" />
	</display:column>
	
	<acme:columnImages code="admin.dashboard.chorbi.picture" properties="${row[0].picture}" />
	
	<spring:message code="admin.dashboard.chorbi.description" var="descriptionHeader" />
	<display:column title="${descriptionHeader}" sortable="false">
		<jstl:out value="${f:replaceAllPhoneAndEmail(row[0].description, '***')}" />
	</display:column>
	
	<acme:column code="admin.dashboard.chorbi.birthDate" property="[0].birthDate" format="{0,date,dd/MM/yyyy}" />
	
	<acme:column code="admin.dashboard.chorbi.genre" property="[0].genre" />
	
	<acme:column code="admin.dashboard.chorbi.relationshipEngage" property="[0].relationshipEngage" />
	
	<spring:message code="admin.dashboard.chorbi.coordinates" var="coordinatesHeader" />
	<display:column title="${coordinatesHeader}" sortable="false">
		<ul>
			<li>
				<spring:message code="admin.dashboard.chorbi.country" />: 
				<jstl:out value="${row[0].coordinates.country }" />
			</li>
			
			<jstl:if test="${not empty row[0].coordinates.state }">
				<li>
					<spring:message code="admin.dashboard.chorbi.state" />: 
					<jstl:out value="${row[0].coordinates.state }" />
				</li>
			</jstl:if>
			
			<jstl:if test="${not empty row[0].coordinates.provice }">
				<li>
					<spring:message code="admin.dashboard.chorbi.provice" />: 
					<jstl:out value="${row[0].coordinates.provice }" />
				</li>
			</jstl:if>
			
			<li>
				<spring:message code="admin.dashboard.chorbi.city" />: 
				<jstl:out value="${row[0].coordinates.city }" />
			</li>
		</ul>
	</display:column>
	
	<spring:message code="admin.dashboard.chorbi.starsNumber" var="quantityHeader" />
	<display:column title="${quantityHeader}" sortable="true">
		<jstl:out value="${row[1]}" />
	</display:column>
</display:table>


