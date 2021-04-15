
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<head>
		<jsp:include page="head.jsp">
	    	<jsp:param name="style_css" value="css/comptes.css"/>
	    </jsp:include>
	</head>
    
    <body>
    
    <jsp:include page="header.jsp"/>
    
	<main>
		<div class="container">
   		<h1 class="text-center mb-5">Liste des comptes</h1>
    	<div>
    		<p>Nb de comptes : ${pageDeComptes.getNumberOfElements() }</p>
			<div>
				<div class="row ">
	        		<div class="d-flex justify-content-between mb-3">
	                	<a href="/ajouter-un-compte" class="button btn btn-primary py-0">Ajouter un compte</a>
	            	</div> 
		        </div>
				<table class="table table-bordered mx-1 ">
					<thead>
						<tr>
							<th>SERVICE</th>
							<th>ID EMPLOYE <a href="comptes?sort.asc=id">trier</a></th>
							<th>PRENOM <a href="comptes?sort=prenom">trier</a></th>
							<th>NOM <a href="comptes?sort=nom">trier</a></th>
							<th>EMAIL<a href="comptes?sort=email">trier</a></th>
							<th>CREATION <a href="comptes?sort=dateHeureCreation">trier</a></th>
							<th>IDENTIFIANT<a href="comptes?sort=login">trier</a></th>
							<th>MOT DE PASSE <a href="comptes?sort=motDePasse">trier</a></th>
							<th>DERNIERE VISITE <a href="comptes?sort=DateHeureDerniereVisite">trier</a></th>
							<th>CREATION DU COMPTE <a href="comptes?sort=dateHeureCreationCompte">trier</a></th>
							<th>NOMBRE DE CONNEXION<a href="comptes?sort=nbDeConnexions">trier</a></th>
							<th>SUPPRIMER<a href="comptes?sort=estSupprime">trier</a></th>
							<th>INITIALES<a href="comptes?sort=initiales">trier</a></th>
							<th>ENREGISTREMENT ACTIF <a href="comptes?sort=estActive">trier</a></th>
						</tr>
					</thead>
					<tbody id="tbody">
						<c:forEach items="${ pageDeComptes.content }" var="personne">
						<tr id="tr">
							<td>
								<a href="/modifier-un-compte?idPersonne=${ personne.id}" class="btnAction btn btn-warning m-1">Modifier</a>
							</td>
							<td >${personne.id }</td>
							<td>${ personne.prenom }</td>
							<td>${ personne.nom }</td>
							<td>${ personne.email }</td>
							<td>${ personne.dateHeureCreation }</td>
							<td>${ personne.login }</td>
							<td>${ personne.motDePasse }</td>
							<td>${ personne.dateHeureDerniereVisite }</td>
							<td>${ personne.dateHeureCreationCompte }</td>
							<td>${ personne.nbDeConnexions }</td>
							<td>${ personne.estSupprime }</td>
							<td>${ personne.initiales }</td>
							<td>${ personne.estActive }</td>
						</tr>
						</c:forEach> 
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<jsp:include page="pagination.jsp"/>
	
	</main>
	     
	<jsp:include page="footer.jsp"/>
	
	</body>