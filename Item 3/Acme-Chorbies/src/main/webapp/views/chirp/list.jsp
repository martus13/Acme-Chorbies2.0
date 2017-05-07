<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="f" uri="http://example.com/functions" %>
	
<display:table name="chirps" id="row" requestURI="${requestURI}" pagesize="5" class="displaytag">

	
	<spring:message code="chirp.subject" var="subjectHeader" />
	<display:column title="${subjectHeader}" sortable="true">
		<jstl:out value="${f:replaceAllPhoneAndEmail(row.subject, '***')}" />
	</display:column>
	
	<spring:message code="chirp.text" var="textHeader" />
	<display:column title="${textHeader}" sortable="true">
		<jstl:out value="${f:replaceAllPhoneAndEmail(row.text, '***')}" />
	</display:column>
	
	<acme:column code="chirp.attachments" property="attachments"/>

	<acme:column code="chirp.sentMoment" property="sentMoment" format="{0,date,dd/MM/yyyy HH:mm}" />
	
	<jstl:choose>
		<jstl:when test="${imSender}">
			<spring:message code="chirp.recipient" var="recipientHeader" />
			<display:column title="${recipientHeader}" sortable="true">
				<a href="chorbi/actor/display.do?chorbiId=${row.recipient.id }">
					<jstl:out value="${f:replaceAllPhoneAndEmail(row.recipient.name, '***')} ${f:replaceAllPhoneAndEmail(row.recipient.surname, '***')}"/>
				</a>
			</display:column>
			<display:column>
				<form:form action="chirp/actor/resend.do?chirpId=${row.id}" modelAttribute="chirp">
					<acme:submit name="resend" code="chirp.resend" />
				</form:form>
			</display:column>
			
		</jstl:when>
		<jstl:otherwise>
			<spring:message code="chirp.sender" var="senderHeader" />
			<display:column title="${senderHeader}" sortable="true">
				<a href="chorbi/actor/display.do?chorbiId=${row.sender.id }">
					<jstl:out value="${f:replaceAllPhoneAndEmail(row.sender.name, '***')} ${f:replaceAllPhoneAndEmail(row.sender.surname, '***')}"/>
				</a>
			</display:column>
			
			<display:column>
				<form:form action="chirp/actor/reply.do?chirpId=${row.id}" modelAttribute="chirp">
					<acme:submit name="reply" code="chirp.reply" />
				</form:form>
			</display:column>
		</jstl:otherwise>
	</jstl:choose>
	
	<display:column>
		<form:form id="formDeleteChirp" action="chirp/actor/delete.do?chirpId=${row.id}" modelAttribute="chirp">
			<input type="submit" name="delete" value="<spring:message code="chirp.delete" />" onclick="return confirm('<spring:message code="chirp.delete.confirmation" />')" />&nbsp;
		</form:form>
	</display:column>
	

</display:table>
