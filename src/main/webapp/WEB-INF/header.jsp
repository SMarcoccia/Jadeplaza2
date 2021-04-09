<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>CLELIA - Jade - Liste des comptes</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootstrap/css/4.5.3/bootstrap.min.css" id="bootstrap-css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/base.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/${param.style_css}"/>
	</head>
	<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary d-flex align-items-center">
			<div class=container>
  				<span class="navbar-brand">CLELIA</span>
   				<div class="collapse navbar-collapse" id="navbarColor01">
				    <ul class="navbar-nav mr-auto">
						<li class="nav-item">
					        <c:if test="${sessionScope.personne ne null}"><a class="liste-appels nav-link" href="/appels">Liste des appels</a></c:if>
      					</li>
      					<li class="nav-item">
        					<c:if test="${sessionScope.personne ne null and sessionScope.personne.email == 'fxcote@clelia.fr'}"><a class="liste-comptes nav-link" href="/liste-des-comptes">Liste des comptes</a></c:if>
      					</li>
    				</ul>
  				</div>
  				<c:if test="${sessionScope.personne ne null}">
  					<span>${sessionScope.personne.nom} ${sessionScope.personne.prenom }</span>
  					<a class="deconnexion nav-link" href="deconnexion">Déconnexion</a>
  				</c:if>
			</div>
		</nav>
	</header>
	