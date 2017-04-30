<%--
 * header.jsp
 *
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<div>
	<img src="images/logo.png" alt="Acme-Chorbies Co., Inc." />
</div>

<div>
	<ul id="jMenu">
		<!-- Do not forget the "fNiv" class for the first level links !! -->
		
		<security:authorize access="permitAll">
			<li><a class="fNiv"><spring:message	code="master.page.events" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="event/list.do"><spring:message code="master.page.event.listAll" /> </a></li>
					<li><a href="event/listOrganisedLessOneMonth.do"><spring:message code="master.page.event.lessOneMonth" /> </a></li>
					<security:authorize access="hasRole('CHORBI')">
						<li><a href="event/chorbi/listByChorbi.do"><spring:message code="master.page.event.listByChorbi" /> </a></li>
					</security:authorize>
					<security:authorize access="hasRole('MANAGER')">
						<li><a href="event/manager/listByManager.do"><spring:message code="master.page.event.listByManager" /> </a></li>
						<li><a href="event/manager/create.do"><spring:message code="master.page.event.create" /> </a></li>
					</security:authorize>
					
				</ul>
			</li>
		</security:authorize>
		
		<security:authorize access="isAnonymous()">
			<li><a class="fNiv" href="chorbi/register.do"><spring:message code="master.page.chorbi.register" /></a></li>
			<li><a class="fNiv" href="manager/register.do"><spring:message code="master.page.manager.register" /></a></li>
			<li><a class="fNiv" href="security/login.do"><spring:message code="master.page.login" /></a></li>
		</security:authorize>
		
		<security:authorize access="isAuthenticated()">
			<li><a class="fNiv" href="chorbi/actor/list.do"><spring:message code="master.page.chorbi.listNotBanned" /></a></li>
		</security:authorize>
		
		<security:authorize access="hasRole('CHORBI')">
			<li><a class="fNiv" href="searchTemplate/chorbi/display.do"><spring:message code="master.page.chorbi.searchTemplate" /></a></li>
			<li><a class="fNiv" href="chorbi/listWhoLikeMe.do"><spring:message code="master.page.chorbi.likedMe" /></a></li>
		</security:authorize>
		
		<security:authorize access="hasAnyRole('MANAGER','CHORBI')">
			<li><a class="fNiv" href="creditCard/actor/list.do"><spring:message code="master.page.actor.creditCard" /></a></li>
			
			<li><a class="fNiv"><spring:message	code="master.page.actor.chirps" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="chirp/actor/receivedChirps.do"><spring:message code="master.page.actor.receivedChirps" /> </a></li>
					<li><a href="chirp/actor/sentChirps.do"><spring:message code="master.page.actor.sentChirps" /> </a></li>
					
				</ul>
			</li>
		</security:authorize>
		
		<security:authorize access="hasRole('ADMIN')">
			<li><a class="fNiv"><spring:message	code="master.page.admin.banner" /></a>
				<ul>
					<li class="arrow"></li>
					<li><a href="banner/administrator/list.do"><spring:message code="master.page.admin.banner.list" /> </a></li>
					<li><a href="banner/administrator/create.do"><spring:message code="master.page.admin.banner.create" /> </a></li>		
				</ul>
			</li>
			<li><a class="fNiv" href="configuration/administrator/edit.do"><spring:message code="master.page.admin.configuration" /></a></li>
			<li><a class="fNiv" href="administrator/dashboard.do"><spring:message code="master.page.admin.dashboard" /></a></li>
		</security:authorize>
		
		<security:authorize access="isAuthenticated()">
			<li>
				<a class="fNiv"> 
					<spring:message code="master.page.profile" /> 
			        (<security:authentication property="principal.username" />)
				</a>
				<ul>
					<li class="arrow"></li>
					<security:authorize access="hasRole('CHORBI')">
						<li><a href="profile/chorbi/edit.do"><spring:message code="master.page.editProfile" /> </a></li>
					</security:authorize>
					<li><a href="j_spring_security_logout"><spring:message code="master.page.logout" /> </a></li>
				</ul>
			</li>
		</security:authorize>
	</ul>
</div>

<div>
	<a href="javascript:setParam('language', 'en');">en</a> | <a href="javascript:setParam('language', 'es');">es</a>
</div>

<script> 
    function setParam(name, value) {
        var l = window.location;

        /* build params */
        var params = {};        
        var x = /(?:\??)([^=&?]+)=?([^&?]*)/g;        
        var s = l.search;
        for(var r = x.exec(s); r; r = x.exec(s))
        {
            r[1] = decodeURIComponent(r[1]);
            if (!r[2]) r[2] = '%%';
            params[r[1]] = r[2];
        }

        /* set param */
        params[name] = encodeURIComponent(value);

        /* build search */
        var search = [];
        for(var i in params)
        {
            var p = encodeURIComponent(i);
            var v = params[i];
            if (v != '%%') p += '=' + v;
            search.push(p);
        }
        search = search.join('&');

        /* execute search */
        l.search = search;
    }
</script>

