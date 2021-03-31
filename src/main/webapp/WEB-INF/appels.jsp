<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>CLELIA - Jade - Liste des appels</title>
		<link rel="stylesheet" type="text/css" href="bootstrap/css/4.5.3/bootstrap.min.css" id="bootstrap-css"/>
		<link rel="stylesheet" type="text/css" href="css/appels.css"/>
	</head>
	<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary d-flex align-items-center">
			<div class=container>
  				<a class="navbar-brand" href="#">CLELIA</a>
   				<div class="collapse navbar-collapse" id="navbarColor01">
				    <ul class="navbar-nav mr-auto">
						<li class="nav-item">
					        <c:if test="${sessionScope.personne ne null}"><a class="liste-appels nav-link" href="#">Liste des appels</a></c:if>
      					</li>
      					<li class="nav-item">
        					<c:if test="${sessionScope.personne ne null and personne.email == 'fxcote@clelia.fr'}"><a class="liste-utilisateur nav-link" href="#">Liste des utilisateurs</a></c:if>
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
	
	<main>
		<div class="container">
   		<h1 class="text-center mb-5 mt-1">Liste des appels</h1>
    	<div>
    		<p>Nb d'appels : ${ pageDAppels.getTotalElements() }</p>
            <form action="filtrer" method="post" autocomplete="off">
				<div class="row mb-3">
					<!-- IL Y A 3 COLONNES -->
					<!-- DEBUT 1er COLONNE -->
	    			<div class="col-5">
				        <div class="row ">
        	            	<div class="d-flex justify-content-between mb-3">
                            	<a href="/ajouter-un-appel" class="button btn btn-primary py-0">Nouvel Appel</a>
            	            	<a href="/consulter-un-appel" class="button btn btn-primary py-0">Consulter</a>
                	        	<a href="/rafraichir" class="button btn btn-primary py-0">Rafraichir</a>
                    	    	<a href="/mes-appels" class="button btn btn-primary py-0">Mes Appels</a>
                    		</div> 
	                	</div>
	                	
    	             	<div class="row">
        	       			<div class="col-5">
               					<div class="form-check">
            	   					<input class="form-check-input" type="radio" name="CP" id="CP1" value="1"/>
                	  				<label class="form-check-label" for="CP1">Appels traités</label>
   	        					</div>
       	    					<div class="form-check">
            						<input class="form-check-input" type="radio" name="CP" id="CP2" checked value="2"/>
            						<label class="form-check-label" for="CP2">Appels non traités</label>
	           					</div>
		    				</div>
        					<div class="col-7">
            					<div class="form-check">
           	      					<input class="form-check-input" type="radio" name="CP" id="CP4" value="4"/>
	           	      				<label class="form-check-label" for="CP4">Appels en cours de traitement</label>
    	       					</div>
        						<div class="form-check">
                  					<input class="form-check-input" type="radio" name="CP" id="CP3" value="3"/>
   	        	  					<label class="form-check-label" for="CP3">Tous</label>
       	    					</div>
       						</div>
	    				</div>
    				</div> <!-- FIN 1er COLONNE -->
    			
    				<!-- DEBUT 2e COLONNE -->
	   				<div class="col-6 filter d-flex justify-content-between">	
    					<!-- FILTRE -->
    					<div class="filter1">
    						<div class="row mb-4">
    							<div class="col-7" style="width: 250px">
	        						<select name="mySelect1" class="form-select py-0" id="filter1_param" onChange="refreshFilter1()">
	     								<option value="-1">Sélectionnez</option>
	     								<option value="1" >Date & Heure</option>
	     								<option value="2" >Agence concernée</option>
	 								    <option value="3" >Destinataire(s)</option>
	 								    <option value="4" >Type d'appelant</option>
	 							    	<option value="5" >Nom</option>
	 								    <option value="6" >Prénom</option>
	 							    	<option value="7" >N° de mobile</option>
	 								    <option value="8" >N° de fixe</option>
	 								    <option value="9" >Email</option>
	 								    <option value="10">Objet de l'appel/Commentaire</option>
	 								    <option value="11">Support pub</option>
	 								    <option value="12">Origine contact</option>
	 						    
	 								    <option value="14">Nom du mandat</option>
	     								<option value="15">Saisie par</option>
	     								<option value="16">Vu</option>
	     								<option value="17">Actions/Commentaires</option>
	         						</select>
        						</div>
        						
								<!-- DATE -->
	 							<div class="filtre2Bis_1 col-5 w-auto">
	 	        					<div id="A1">
	 	        						<label for="AV1" class="form-check-label">Entre</label>
	     	    						<input id='AV1' name="AV1" type="date" class="py-0 form-control"/>
	         							<label for="AV1Bis" class="form-check-label" >Et</label>
	         							<input id='AV1Bis' name="AV1Bis" type="date" class="py-0 form-control"/>
	         						</div>
	         				
	 	        					<!-- AGENCE CONCERNEE -->
	     	    					<div id="A2">
	         							<select class="py-0 form-select" id="AV2" name="AV2"> 
	         								<option value="-1">?</option>
											<c:forEach items="${ agences }" var="agence">
		   										<option value="${ agence.id }">${ agence.nom }</option>
	   										</c:forEach>
	     	    						</select>
	 	        					</div>
	         					
	 		    					<!-- DESTINAIRE(S) -->
	     						   	<div id="A3">
	 							   		<select class="py-0 form-select" id='AV3' name='AV3'>
	 		   								<option value='-1'>?</option>
											<c:forEach items="${ personnes }" var="personne">
		   										<option value="${ personne.id }">${ personne.nom }</option>
	   										</c:forEach>
	 									</select>
	 								</div>
	 								
	 								<!-- TYPE D'APPELANT -->
	     							<div id="A4">
	 									<select class="py-0 form-select" id='AV4' name='AV4'>
	 										<option value='-1'>?</option>
											<c:forEach items="${ typeAppelants }" var="typeAppelant">
		   										<option value="${ typeAppelant.id }">${ typeAppelant.nom }</option>
	   										</c:forEach>
	 									</select>
	 								</div>
	  						
	  								<!-- NOM -->
	     							<div id="A5">
	 									<input class="py-0 form-control" style="width: "type="text" name="AV5"/>
	 								</div>
	 						
	 								<!-- PRENOM -->
	 	    						<div id="A6">
	 									<input class="py-0 form-control" type="text" name="AV6"/>
	 								</div>
	 							
	 								<!-- N° DE MOBILE -->
	 							    <div id="A7">
	 									<input class="py-0 form-control" type="text" name="AV7"/>
	 								</div>
	 						
	 								<!-- N° DE FIXE -->
	 						    	<div id="A8">
	 									<input class="py-0 form-control" type="text" name="AV8"/>
	 								</div>
	 							
	 								<!-- EMAIL -->
	 						    	<div id="A9">
	 									<input class="py-0 form-control" type="text" name="AV9"/>
	 								</div>
	 						
	 								<!-- OBJET DE L'APPEL/COMMENTAIRE -->
	 							    <div id="A10">
	 									<input class="py-0 form-control" type="text" name="AV10"/>
	 								</div>
	 							
	 								<!-- SUPPORT PUB -->
	     							<div id="A11">
	 									<select class="py-0 form-select" id='AV11' name='AV11'>
	 										<option value='-1'>?</option>
											<c:forEach items="${ annonces }" var="annonce">
		   										<option value="${ annonce.id }">${ annonce.nom }</option>
	   										</c:forEach>
	 									</select>
	 								</div>
	 						
	 								<!-- ORIGINE CONTACT -->
	 	    						<div id="A12">
	 									<select class="py-0 form-select" id='AV12' name='AV12'>
	 										<option value='-1'>?</option>
											<c:forEach items="${ origines }" var="origine">
		   										<option value="${ origine.id }">${ origine.nom }</option>
	   										</c:forEach>
	 									</select>
	 								</div>
	 						
	 								<!-- NOM DU MANDAT -->
	     							<div id="A14">
	 									<input class="py-0 form-control" type="text" name="AV14"/>
	 								</div>
	 						
	 								<!-- SAISIE PAR -->
	 	    						<div id="A15">
	 									<select class="py-0 form-select" id='AV15' name='AV15'>
	 										<option value='-1'>?</option>
											<c:forEach items="${ personnes }" var="personne">
		   										<option value="${ personne.id }">${ personne.nom }</option>
	   										</c:forEach>
	 									</select>
	 								</div>
	 						
	 								<!-- VU -->
	 	    						<div class="" id="A16">
	 									<input class="py-0 form-check-input" type="checkbox" name="AV16"/>
	 								</div>
	 								<!-- ACTIONS/COMMENTAIRES -->
	     							<div id="A17">
	 									<input class="py-0 form-control" type="text" name="AV17"/>
	 								</div>   						
   								</div> 						
 		    				</div>
 		    				
        					<!-- FILTRE 2 -->
	 		   				<div class="row mb-4">
	 		   					<div class="col-7" style="width: 250px">
	     	    					<select name="mySelect2" class="form-select py-0" id="filter2_param" onChange="refreshFilter2()">
	        							<option value="-1">Sélectionnez</option>
	     								<option value="1">Date & Heure</option>
	     								<option value="2">Agence concernée</option>
	 								    <option value="3">Destinataire(s)</option>
	 								    <option value="4">Type d'appelant</option>
	 							    	<option value="5">Nom</option>
	 								    <option value="6">Prénom</option>
	 							    	<option value="7">N° de mobile</option>
	 								    <option value="8">N° de fixe</option>
	 								    <option value="9">Email</option>
	 								    <option value="10">Objet de l'appel / Commentaire</option>
	 								    <option value="11">Support pub</option>
	 								    <option value="12">Origine contact</option>
	 						    							    
	 								    <option value="14">Nom du mandat</option>
	     								<option value="15">Saisie par</option>
	 	    							<option value="16">Vu</option>
	     								<option value="17">Actions / Commentaires</option>
	 	        					</select>    
	        					</div>
	        					
	         					<div class="filtre2Bis_2 col-5 w-auto">
	         						<!-- DATE -->
	         						<div id="B1">
										<label class="form-check-label" for="BV1">Entre</label>
	         							<input  id='BV1' name="BV1" type="date" class="py-0 form-control">
	 	        						<label class="form-check-label" for="BV1Bis">Et</label>	 	        						
	 	        						<input  id='BV1Bis' name="BV1Bis" type="date" class="py-0 form-control">
	     	    					</div>
	         				
	 	    						<!-- AGENCE CONCERNEE -->
	     	    					<div id="B2">
	         							<select class="py-0 form-select" id="BV2" name="BV2"> 
	         								<option value="-1">?</option>
											<c:forEach items="${ agences }" var="agence">
		   										<option value="${ agence.id }">${ agence.nom }</option>
	   										</c:forEach>
	     	    						</select>
	         						</div>
	         				
	 	        					<!-- DESTINAIRE(S) -->
	 		    				   	<div id="B3">
	 							   		<select class="py-0 form-select" id='BV3' name='BV3'>
	 			   							<option value='-1'>?</option>
											<c:forEach items="${ personnes }" var="personne">
		   										<option value="${ personne.id }">${ personne.nom }</option>
	   										</c:forEach>
	 									</select>
	 								</div>
	 						
	 								<!-- TYPE D'APPELANT -->
	     							<div id="B4">
	 									<select class="py-0 form-select" id='BV4' name='BV4'>
	 										<option value='-1'>?</option>
											<c:forEach items="${ typeAppelants }" var="typeAppelant">
		   										<option value="${ typeAppelant.id }">${ typeAppelant.nom }</option>
	   										</c:forEach>
	 									</select>
	 								</div>
	  						
	 		 						<!-- NOM -->
	     							<div id="B5">
	 									<input class="py-0 form-control" type="text" name="BV5"/>
	 								</div>
	 							
	 								<!-- PRENOM -->
	     							<div id="B6">
	 									<input class="py-0 form-control" type="text" name="BV6"/>
	 								</div>
	 							
	 								<!-- N° DE MOBILE -->
	 							    <div id="B7">
	 									<input class="py-0 form-control" type="text" name="BV7"/>
	 								</div>
	 							
	 								<!-- N° DE FIXE -->
	 						    	<div id="B8">
	 									<input class="py-0 form-control" type="text" name="BV8"/>
	 								</div>
	 						
	 								<!-- EMAIL -->
	 							    <div id="B9">
	 									<input class="py-0 form-control" type="text" name="BV9"/>
	 								</div>
	 							
	 								<!-- OBJET DE L'APPEL/COMMENTAIRE -->
	 							    <div id="B10">
	 									<input class="py-0 px-0 form-control" type="text" name="BV10"/>
	 								</div>
	 						
	 								<!-- SUPPORT PUB -->
	 		    					<div id="B11">
	 									<select class="py-0 form-select" id='BV11' name='BV11'>
	 										<option value='-1'>?</option>
											<c:forEach items="${ annonces }" var="annonce">
		   										<option value="${ annonce.id }">${ annonce.nom }</option>
	   										</c:forEach>
	 									</select>
	 								</div>
	 								
	 								<!-- ORIGINE CONTACT -->
	     							<div id="B12">
	 									<select class="py-0 form-select" id='BV12' name='BV12'>
	 										<option value='-1'>?</option>
											<c:forEach items="${ origines }" var="origine">
		   										<option value="${ origine.id }">${ origine.nom }</option>
	   										</c:forEach>
	 									</select>
	 								</div>
	 						
	 								<!-- NOM DU MANDAT -->
	     							<div id="B14">
	 									<input class="py-0 form-control" type="text" name="BV14"/>
	 								</div>
	 						
	 								<!-- SAISIE PAR -->
	 	    						<div id="B15">
	 									<select class="py-0 form-select" id='BV15' name='BV15'>
	 										<option value='-1'>?</option>
											<c:forEach items="${ personnes }" var="personne">
		   										<option value="${ personne.id }">${ personne.nom }</option>
	   										</c:forEach>
	 									</select>
	 								</div>
	 						
	 								<!-- VU -->
	     							<div class="py-0 " id="B16">
	 									<input class="py-0 form-check-input" type="checkbox" name="BV16"/>
	 								</div>
	 								<!-- ACTIONS/COMMENTAIRES -->
	     							<div id="B17">
	 									<input class="py-0 form-control" type="text" name="BV17"/>
	 								</div>
	 							</div>      					    					
     	    				</div>
        					<!-- FILTRE 3 -->
	        				<div class="row mb-4">
	        					<div class="col-7" style="width: 250px">
	     	    					<select name="mySelect3" class="form-select py-0" id="filter3_param" onChange="refreshFilter3()">
	     								<option value="-1">Sélectionnez</option>
	 	    							<option value="1">Date & Heure</option>
	     								<option value="2">Agence concernée</option>
	 								    <option value="3">Destinataire(s)</option>
	 								    <option value="4">Type d'appelant</option>
	 								    <option value="5">Nom</option>
	 								    <option value="6">Prénom</option>
	 							    	<option value="7">N° de mobile</option>
	 								    <option value="8">N° de fixe</option>
	 							    	<option value="9">Email</option>
	 								    <option value="10">Objet de l'appel / Commentaire</option>
	 								    <option value="11">Support pub</option>
	 								    <option value="12">Origine contact</option>
	 							    							    
	 								    <option value="14">Nom du mandat</option>
	     								<option value="15">Saisie par</option>
	     								<option value="16">Vu</option>
	     								<option value="17">Actions / Commentaires</option>
	 		    					</select>
		    					</div>

       							<div class="filtre2Bis_3 col-5 w-auto">
       								<!-- DATE -->
	        						<div id="C1">
	        							<label class="form-check-label" for="CV1">Entre</label>
        								<input id='CV1' name="CV1" type="date" class="py-0 form-control"/>
		        						<label class="form-check-label" for="CV1Bis">Et</label>
		        						<input id='CV1Bis' name="CV1Bis" type="date" class="py-0 form-control"/>
			    					</div>
        				
    								<!-- AGENCE CONCERNEE -->
        							<div id="C2">
        								<select class="py-0 form-select" id="CV2" name="CV2"> 
        									<option value="-1">?</option>
											<c:forEach items="${ agences }" var="agence">
		   										<option value="${ agence.id }">${ agence.nom }</option>
	   										</c:forEach>
   	    								</select>
        							</div>
        				
		    						<!-- DESTINAIRE(S) -->
	     						   	<div id="C3">
	 							   		<select class="py-0 form-select" class="py-0 form-select" id='CV3' name='CV3'>
	 		   								<option value='-1'>?</option>
											<c:forEach items="${ personnes }" var="personne">
		   										<option value="${ personne.id }">${ personne.nom }</option>
	   										</c:forEach>
	 									</select>
	 								</div>
						
									<!-- TYPE D'APPELANT -->
	       							<div id="C4">
	   									<select class="py-0 form-select" id='CV4' name='CV4'>
	   										<option value='-1'>?</option>
											<c:forEach items="${ typeAppelants }" var="typeAppelant">
		   										<option value="${ typeAppelant.id }">${ typeAppelant.nom }</option>
	   										</c:forEach>
	   									</select>
	   								</div>
	    						
	    							<!-- NOM -->
	       							<div id="C5">
	   									<input type="text" name="CV5"/>
	   								</div>
	   						
	   								<!-- PRENOM -->
	   	    						<div id="C6">
	   									<input class="py-0 form-control" type="text" name="CV6"/>
	   								</div>
	   							
	   								<!-- N° DE MOBILE -->
	   							    <div id="C7">
	   									<input class="py-0 form-control" type="text" name="CV7"/>
	   								</div>
	   						
	   								<!-- N° DE FIXE -->
	   							    <div id="C8">
	   									<input class="py-0 form-control" type="text" name="CV8"/>
	   								</div>
	   						
	   								<!-- EMAIL -->
	   							    <div id="C9">
	   									<input class="py-0 form-control" type="text" name="CV9"/>
	   								</div>
	   						
	   								<!-- OBJET DE L'APPEL/COMMENTAIRE -->
	   							    <div id="C10">
	   									<input class="py-0 form-control" type="text" name="CV10"/>
	   								</div>
	   						
	   								<!-- SUPPORT PUB -->
	       							<div id="C11">
	   									<select class="py-0 form-select" id='CV11' name='CV11'>
	   										<option value='-1'>?</option>
											<c:forEach items="${ annonces }" var="annonce">
		   										<option value="${ annonce.id }">${ annonce.nom }</option>
	   										</c:forEach>
	   									</select>
	   								</div>
	   						
	   								<!-- ORIGINE CONTACT -->
	       							<div id="C12">
	   									<select class="py-0 form-select" id='CV12' name='CV12'>
	   										<option value='-1'>?</option>
											<c:forEach items="${ origines }" var="origine">
		   										<option value="${ origine.id }">${ origine.nom }</option>
	   										</c:forEach>
	   									</select>
	   								</div>
	   						
	   								<!-- NOM DU MANDAT -->
	       							<div id="C14">
	   									<input class="py-0 form-control" type="text" name="CV14"/>
	   								</div>
	   						
	   								<!-- SAISIE PAR -->
	   		    					<div id="C15">
	   									<select class="py-0 form-select" id='CV15' name='CV15'>
	   										<option value='-1'>?</option>
											<c:forEach items="${ personnes }" var="personne">
		   										<option value="${ personne.id }">${ personne.nom }</option>
	   										</c:forEach>
	   									</select>
	   								</div>
	   							
	   								<!-- VU -->
	       							<div class="" id="C16">
	   									<input class="py-0 form-check-input" type="checkbox" name="CV16"/>
	   								</div>
	   								<!-- ACTIONS/COMMENTAIRES -->
	       							<div id="C17">
	   									<input class="py-0 form-control" type="text" name="CV17"/>
									</div>
								</div>							
	        				</div>
	   					</div>
					</div><!-- FIN 2e COLONNE -->
     				
     				<!-- DEBUT 3e COLONNE -->
    				<div class="col-1 d-flex flex-column jutify-content-end px-0">
       					<input type="submit" value="Filtrer" class="button btn btn-primary mb-3 py-0 px-0">
       					<a href="/enlever-filtre" class="button btn btn-primary py-0 px-0">Enlever Filtre</a>
    				</div> <!-- FIN 3e COLONNE -->
    			</div>
			</form>
 
			<div>
				<table class="table table-bordered mx-1 ">
					<thead>
						<tr>
							<th >DATE ET HEURE <a href="appels?sort=dateHeure">trier</a></th>
							<th >AGENCE <a href="index?sort=pageDAppels.agence.nom">trier</a></th>
							<th >DESTINATAIRE <a href="index?sort=pageDAppels.recuPar.initiales">trier</a></th>
							<th >TYPE D'APPELANT<a href="index?sort=pageDAppels.typeAppelant.nom">trier</a></th>
							<th >NOMS <a href="appels?sort=nom">trier</a></th>
							<th >PRENOMS <a href="index?sort=pageDAppels.prenom">trier</a></th>
							<th >N. DE MOBILE <a href="index?sort=pageDAppels.mobile">trier</a></th>
							<th >N. DE FIXE <a href="index?sort=pageDAppels.telephone">trier</a></th>
							<th >EMAIL <a href="index?sort=pageDAppels.email">trier</a></th>
							<th >OBJET DE L'APPEL/COMMENTAIRE <a href="index?sort=pageDAppels.objet">trier</a></th>
							<th >SUPPORT DE PUB <a href="index?sort=pageDAppels.annonce.nom">trier</a></th>
							<th >ORIGINE CONTACT <a href="index?sort=pageDAppels.origine.nom">trier</a></th>
							<th >TYPE CONTACT <a href="index?sort=pageDAppels.typeAppelant.nom">trier</a></th>
							<th >NOM DU MANDAT <a href="index?sort=pageDAppels.nomDuMandat">trier</a></th>
							<th >SAISIE PAR <a href="index?sort=pageDAppels.recuPar.initiales">trier</a></th>
							<th >VU <a href="index?sort=pageDAppels.estAccuse">trier</a></th>
							<th >ACTIONS/COMMENTAIRE <a href="index?sort=pageDAppels">trier</a></th>
							<th >TRAITE <a href="index?sort=pageDAppels.estTermine">trier</a></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ pageDAppels.content }" var="appel">
						<tr>
							<td>${ appel.dateHeure }</td>
							<td><!-- appel.agence.nom --></td>
							<td><!-- appel.recuPar.initiales --></td>
							<td><!-- appel.typeAppelant.nom --></td>
							<td>${ appel.nom }</td>
							<td>${ appel.prenom }</td>
							<td>${ appel.mobile }</td>
							<td>${ appel.telephone }</td>
							<td>${ appel.email }</td>
							<td>${ appel.objet }</td>
							<td>${ appel.nomAnnonce }</td>
							<td>${ appel.nomOrigine }</td>
							<td>${ appel.typeAppel }</td>
							<td>${ appel.nomDuMandat }</td>
							<td><!-- appel.recuPar.initiales  --> </td>
							<td>${ appel.estAccuse }</td>
							<td></td>
							<td>${ appel.estTermine }</td>
						</tr>
						</c:forEach> 
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center">
		<nav aria-label="Page navigation">
		  	<ul class="pagination">
    			<li class="page-item"><a class="page-link" href="index?page=${ pageDAppel.number-1 }">Precedent</a></li>
				<c:forEach var="i" begin="1" end="${ pageDAppel.getTotalPages() }" step="1">
					<li class="page-item"><a class="page-link" href="index?page=${i-1}">${i}</a></li>
		    	</c:forEach>	
				<li class="page-item"><a class="page-link" href="index?page=${ pageDAppel.number < pageDAppel.getTotalPages()-1 ? pageDAppel.number + 1 : pageDAppel.getTotalPages()-1}">Suivant</a></li>
  			</ul>
		</nav>
	</div>
	</main>
	<footer>
		<section class="container" id="footer">
		</section>
	</footer>
	<script src="js/appels.js"></script>
	</body>
</html>