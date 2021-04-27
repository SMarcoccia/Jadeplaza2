<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


	<head>
		<jsp:include page="head.jsp">
	    	<jsp:param name="style_css" value="css/appel.css"/>
	    </jsp:include>
	</head>
	
	<body>
	
	<jsp:include page="header.jsp"/>
	
	<main>
		<div class="container">
	   		<h1 class="text-center mb-5 mt-1">
	   			<c:choose>
	   				<c:when test="${ idPersonne eq null }">Ajouter</c:when>
	   				<c:otherwise>Modifier</c:otherwise>
	   			</c:choose>
	   			un Compte
	   		</h1>
	   		
	    	<div>
	 			<form:form action="/ajouter-un-compte" method="post" modelAttribute="personne" autocomplete="off">
					<div class="form-group row">
						<div class="col-4">Date de création</div>
						<div class="col-8"><fmt:formatDate type="both" timeZone="Europe/Paris" value="${ sessionScope.personne.dateHeureCreationCompte }" /></div>
					</div>

					<div class="form-group row">				
						<form:label class="col-4" path="prenom">Prénom</form:label>
						<form:input class="form-control py-0 col-8" style="width: 200px" type="text" size="30" path="prenom" value=""/>
					</div>
	
					<div class="form-group row">				
						<form:label class="col-4" path="nom">Nom</form:label>
						<form:input class="form-control py-0 col-8" style="width: 200px" type="text" size="30" path="nom" value=""/>
					</div>						
	
					<div class="form-group row">				
						<form:label class="col-4" path="email">Email</form:label>
						<form:input class="form-control py-0 col-8" style="width: 200px" type="email" size="30" path="email" value=""/>
						<form:errors path="email"><span style="color:#B94A48" class="help-block">L'email n'est pas valide</span></form:errors>
					</div>					

					<div class="form-group row">				
						<form:label class="col-4" path="login">Login</form:label>
						<form:input class="form-control py-0 col-8" style="width: 200px" type="text" size="30" path="login" value=""/>
					</div>						

					<div class="form-group row d-flex">
						<form:label class="col-4" path="motDePasse">Mot de passe</form:label>
						<form:input class="form-control py-0 col-8" style="width: 200px" path="motDePasse" rows="2" cols="80"></form:input>
					</div>
					
					<div class="form-group row d-flex">
						<form:label class="col-4" path="initiales">Initiales</form:label>
						<form:input class="form-control py-0 col-8" style="width: 200px" path="initiales" rows="2" cols="80"></form:input>
					</div>
							
					<div class="form-group row">
						<form:label class="form-check-label col-4" path="estActive">Compte actif</form:label>
						<div class="col-1 px-0">
							<form:checkbox class="form-check-label" path="estActive"/>
						</div>
					</div>
					
					<c:if test="${ idPersonne ne null }">
						<div class="form-group row">
							<form:label class="form-check-label col-4" path="estActive">estSupprime</form:label>
							<div class="col-1 px-0">
					   			<c:choose>
	   								<c:when test="${ personne.estSupprime eq true}"><form:checkbox class="form-check-label" path="estActive" checked="checked"/></c:when>
	   								<c:otherwise><form:checkbox class="form-check-label" path="estActive" checked="checked"/></c:otherwise>
	   							</c:choose>
							</div>
						</div>
					</c:if>
								
	    			<div class="row px-0 my-5">
	    				<div class="offset-4 col-4">
							<form:button class="button btn btn-primary py-0">Enregistrer</form:button>
							<a href="/liste-des-comptes" class="button btn btn-primary py-0">Annuler</a>
						</div>
	  				</div>						
	            </form:form>	           
	       	</div>
       	</div>
	</main>
	
	<jsp:include page="footer.jsp"/>
	</body>