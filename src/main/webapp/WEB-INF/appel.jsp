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
	   				<c:when test="${ idAppel eq null }">Ajouter</c:when>
	   				<c:otherwise>Modifier</c:otherwise>
	   			</c:choose>
	   			un Appel
	   		</h1>
	    	<div>
	 			<form:form action="/ajouter-un-appel" method="post" modelAttribute="appel" autocomplete="off">
					<div class="form-group row">
						<div class="col-4">Date de l'appel</div>
						<div class="col-8">${ appel.dateHeure }</div>
					</div>
					
					<div class="form-group row">
						<form:label class="col-4" path="agence">Agence concernée</form:label>
						<form:select 
							path='agence' class="form-control py-1 col-8 " style="width: 200px" autocomplete='true' 
							null="null">
	         				<form:option value="${ agences.get(0).id }">${ agences.get(0).nom }</form:option>
	   						<%-- <form:options items="${ agences }" itemValue="id" itemLabel="nom"/> --%>
						</form:select>
					</div>
						
					<div class="form-group row">
						<form:label class="col-4" path="suiviPar">Destinataire(s)</form:label>
				   		<div class="d-flex justify-content-between col-8 px-0">
							<div class="form-group">	
							   	<form:select class="form-control py-1 col-4" style="width: 200px" path='suiviPar' 
							   		autocomplete='true' null="null">
								   	<form:option value='-1'>?</form:option>
									<form:options items="${ personnes }" itemValue="id" itemLabel="nom"/>
								</form:select>
							</div>
							
							<div class="form-group">
								<form:select class="form-control py-1 col-4" style="width: 200px" path='suiviPar2' autocomplete='true' null="null">
								    <form:option value='-1'>?</form:option>
		   							<form:options items="${ personnes }" itemValue="id" itemLabel="nom"/>
								</form:select>
							</div>
							
							<div class="form-group">
								<form:select class="form-control py-1 col-4" style="width: 200px" path='suiviPar3' autocomplete='true' null="null">
								    <form:option value='-1'>?</form:option>
									<form:options items="${ personnes }" itemValue="id" itemLabel="nom"/>
								</form:select>
							</div>
						</div>
					</div>
					
					<div class="form-group row">
						<form:label class="col-4" path="typeAppelant">Type d'appelant</form:label>					
						<form:select class="form-control py-1 col-8" style="width: 200px" path='typeAppelant' autocomplete='true' null="null">
							<form:option value='-1'>?</form:option>
							<form:options items="${ typeAppelants }" itemValue="id" itemLabel="nom"/>
						</form:select>
					</div>
			
					<div class="form-group row">				
						<form:label class="col-4" path="nom">Nom</form:label>
						<form:input class="form-control py-0 col-7" style="width: 200px;" type="text" size="30" path="nom" value=""/>
					</div>						
	
					<div class="form-group row">				
						<form:label class="col-4" path="prenom">Prénom</form:label>
						<form:input class="form-control py-0 col-8" style="width: 200px" type="text" size="30" path="prenom" value=""/>
					</div>						
	
					<div class="form-group row">				
						<form:label class="col-4" path="mobile">N. de Mobile</form:label>
						<form:input class="form-control py-0 col-8" style="width: 200px" type="text" size="30" path="mobile" value=""/>
					</div>						
	
					<div class="form-group row">				
						<form:label class="col-4" path="telephone">N. de fixe</form:label>
						<form:input class="form-control py-0 col-8" style="width: 200px" type="text" size="30" path="telephone" value=""/>
					</div>						
	
					<div class="form-group row">				
						<form:label class="col-4" path="email">Email</form:label>
						<form:input class="form-control py-0 col-8" style="width: 200px" type="email" size="30" path="email" value=""/>
						<span style="color:#B94A48" class="help-block"><form:errors path="email"></form:errors></span>
					</div>					
					
					<div class="form-group row d-flex">
						<form:label class="col-4" path="objet">Object de l'appel / Commentaire</form:label>
						<form:textarea class="form-control py-0 col-8" style="width: 600px" path="objet" rows="2" cols="80"></form:textarea>
					</div>
			
					<div class="form-group row">
						<form:label class="col-4" path="annonce">Support pub</form:label>					
						<form:select class="form-control py-1 col-8" style="width: 200px" path='annonce' autocomplete='true' null="null">
							<form:option value='-1'>?</form:option>
							<form:options items="${ annonces }" itemValue="id" itemLabel="nom"/>
						</form:select>
					</div>
					
					<div class="form-group row">
						<form:label class="col-4" path="origine">Origine contact</form:label>
						<form:select class="form-control py-1 col-8" style="width: 200px" path='origine' autocomplete='true' null="null">
							<form:option value="-1">?</form:option>
							<form:options items="${ origines }" itemValue="id" itemLabel="nom"/>
						</form:select>
					</div>
					
					<div class="form-group row">				
						<form:label class="col-4" path="nomDuMandat">Nom du mandat</form:label>
						<form:input class="form-control py-0 col-8" path="nomDuMandat" style="width: 200px" type="text" size="30" value=""/>
					</div>				
			
					<div class="form-group row">
						<div class="col-4">Saisie par</div>
						<div class="col-8 px-0 recuPar">${ sessionScope.personne.initiales }</div>
						<form:input path="recuPar" value="${ sessionScope.personne.id }" type="hidden"/>
					</div>
					
					<div class="form-group row">
						<form:label class="form-check-label col-4" path="estAccuse">Vu</form:label>
						<div class="col-1 px-0">
							<form:checkbox class="form-check-label" path="estAccuse"/>
						</div>
					</div>
	    
					<div class="form-group row d-flex">
						<form:label class="col-4" path="suivre">Actions / Commentaires</form:label>
						<form:textarea class="form-control py-0 col-8" style="width: 600px" path="suivre" rows="2" cols="80"></form:textarea>
					</div>
			
					<div class="form-group row">
						<form:label class="col-4" path="estTermine">Traitement</form:label>	
						<div class="col-8" id="estTermine">
							<form:label class="form-check-label" path="estTermine">Non traité</form:label>
							<form:radiobutton class="form-check-input" path="estTermine" value="0" checked="checked"/>
							<form:label class="form-check-label" path="estTermine">En cours de traitement</form:label>
							<form:radiobutton class="form-check-input" path="estTermine" value="2"/>
							<form:label class="form-check-label" path="estTermine">Traité</form:label>
							<form:radiobutton class="form-check-input" path="estTermine" value="1"/>
						</div>
					</div>
					
					<td><form:hidden  path="id"/></td>
					
	    			<div class="row px-0 my-5">
	    				<div class="offset-4 col-4">
							<form:button class="button btn btn-primary py-0">Enregistrer</form:button>
							<a href="/appels" class="button btn btn-primary py-0">Annuler</a>
						</div>
	  				</div>						
	            </form:form>	           
	       	</div>
       	</div>
	</main>
	
	<jsp:include page="footer.jsp"/>
	</body>