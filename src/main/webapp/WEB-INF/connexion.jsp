<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Bienvenue sur la plateforme Jadeplaza</title>
		<link rel="stylesheet" type="text/css" href="bootstrap/css/4.5.3/bootstrap.min.css" id="bootstrap-css"/>
		<link rel="stylesheet" href="css/base.css" />
		<style type="text/css">
   			@import "https://ajax.googleapis.com/ajax/libs/dojo/1.14.1/dojo/resources/dojo.css";
		</style>
		<link rel="stylesheet" type="text/css" href="css/connexion.css"/>
		
	</head>
	<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary d-flex align-items-center">
			<div class=container>
  				<a class="navbar-brand" href="#">CLELIA</a>
   				<div class="collapse navbar-collapse" id="navbarColor01">
				    <ul class="navbar-nav mr-auto">
						<li class="nav-item">
					        <c:if test="${sessionScope.personne ne null}"><a class="liste-appels nav-link" href="/appels">Liste des appels</a></c:if>
      					</li>
      					<li class="nav-item">
        					<c:if test="${sessionScope.personne ne null and personne.email == 'fxcote@clelia.fr'}"><a class="liste-utilisateur nav-link" href="/utilisateurs">Liste des utilisateurs</a></c:if>
      					</li>
    				</ul>
  				</div>
  				<c:if test="${sessionScope.personne ne null}"><a class="deconnexion nav-link" href="deconnexion">Déconnexion</a></c:if>
			</div>
		</nav>
	</header>
	
	<main>
		<div class="container">
    		<h1 class="text-center mb-5 mt-1">Bienvenue </h1>
    		<div class="row justify-content-center">
				<c:choose>
					<c:when test="${sessionScope.personne eq null}">
						<h3 class="text-center mt-3 mb-1">Identifiez-vous</h3>
					</c:when>
					<c:otherwise>
						<h3 class="text-center mt-3 mb-1">Vous êtes connecté !</h3>
					</c:otherwise>
				</c:choose>
				<form action="connexion" method="post" class="col-4 form-signin my-5">
					<c:if test="${notification ne null }"><p>${notification }</p></c:if>
					<div class="form-group ">
						<input name="email" id="email" type="text" placeholder="Entrez votre email" class="form-control my-1" required/>
					</div>
					<div class="form-group mt-5">
				    	<input name="motDePasse" id="motDePasse" type=text placeholder="Entrez votre mot de passe"  class="form-control my-1"/>
					</div>
                    <div class=text-center>				
						<input type=submit class="btn btn-primary my-3" value=Connexion />
					</div>
				</form>
			</div>	
		</div>
	</main>
	
	<footer>
		<section class="container" id="footer">
		</section>
	</footer>
	</body>
</html>