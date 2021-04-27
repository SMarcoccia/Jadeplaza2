<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<head>
		<jsp:include page="head.jsp">
	    	<jsp:param name="style_css" value="css/connexion.css"/>
	    </jsp:include>
	</head>
	
	<body>
	
 	<jsp:include page="header.jsp"/>
	
	<main>
		<div class="container">
    		<h1 class="text-center mb-5">Bienvenue sur Jadeplaza</h1>
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
					<c:if test="${notification ne null }">
						<p>${notification }</p>
					</c:if>
					<div class="form-group ">
						<input 
							name="email" id="email" type="text" placeholder="Entrez votre email" 
							class="form-control my-1" required/>
					</div>
					<div class="form-group mt-5">
				    	<input 
				    		name="motDePasse" id="motDePasse" type=text 
				    		placeholder="Entrez votre mot de passe"  class="form-control my-1"/>
					</div>
                    <div class=text-center>				
						<input type=submit class="btn btn-primary my-3" value=Connexion />
					</div>
				</form>
			</div>	
		</div>
	</main>
	
	<jsp:include page="footer.jsp"/>
	
	</body>