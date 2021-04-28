
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="head.jsp">
	    	<jsp:param name="style_css" value="css/appels.css"/>
	    </jsp:include>
	</head>
	<body>

		<jsp:include page="header.jsp"/>
		
		<main>
			<div class="container">
				<div class=row>
					<h1 id="h1" class="col-md-12 col-sm-12 text-center mb-5">Liste des appels</h1>
				</div>
	    		<p id=nbAppels >Nb d'appels : ${ pageDAppels.getTotalElements () }</p>
	    		
	            <form id=form action="filtrer" method="post" class="row">
					<!-- 1er COLONNE NOUVEL APPEL ... -->
	    			<div class="column1-filters col-md-5">
       	            	<div class="d-flex justify-content-between mb-3">
                           	<a href="/ajouter-un-appel" class="button btn btn-primary py-0">Nouvel Appel</a>
               	        	<a href="/rafraichir" class="button btn btn-primary py-0">Rafraichir</a>
                   	    	<a href="/mes-appels" class="button btn btn-primary py-0">Mes Appels</a>
                   		</div> 
						<div class="row mx-1">	
		                	<div class="col-6">
	               				<div class="form-check">
	            	   				<input class="form-check-input" type="radio" name="CP" id="CP1" value="1"/>
	                	  			<label class="form-check-label" for="CP1">Appels traités</label>
	   	        				</div>
	       	    				<div class="form-check">
	            					<input class="form-check-input" type="radio" name="CP" id="CP2" checked value="0"/>
	            					<label class="form-check-label" for="CP2">Appels non traités</label>
		           				</div>
	           				</div>
	          				<div class="col-6">
		          				<div class="form-check">
	           	      				<input class="form-check-input" type="radio" name="CP" id="CP4" value="2"/>
		           	      			<label class="form-check-label" for="CP4">Appels en cours</label>
	    	       				</div>
	        					<div class="form-check">
	                  				<input class="form-check-input" type="radio" name="CP" id="CP3" value="3"/>
	   	        	  				<label class="form-check-label" for="CP3">Tous</label>
	       	    				</div>
       	    				</div>
   	    				</div>
					</div>
					
	    			<!--2e COLUMN : LISTES -->
	   				<div class="col-md-6 col-12 filter mb-5 px-0">
		   				<div class="column2-filter1 row d-flex mr-1">
		   					<div class="col-8 col-md-7 mx-1">
				     			<select name="mySelect1" class="form-select py-0 mb-1 px-0" id="filter1_param" onChange="refreshFilter1()">
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
		 						    <option value="10">Objet de l'appel/Commentaire</option>
		 						    <option value="11">Support pub</option>
		 						    <option value="12">Origine contact</option>
		 						
		 						    <option value="14">Nom du mandat</option>
		     						<option value="15">Saisie par</option>
		     						<option value="16">Vu</option>
		     						<option value="17">Actions/Commentaires</option>
		         				</select>
	        				</div>
       						<div class="col-8 col-md-4 mx-1 mb-1">
								<!-- DATE -->
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
 							   		<select 
 							   			class="py-0 form-select" 
 							   			id='AV3' 
 							   			name='AV3'>
 		   								<option value='-1'>?</option>
										<c:forEach 
											items="${ personnes }" 
											var="personne">
	   										<option 
	   											value="${ personne.id }">
	   											${ personne.nom }
	   										</option>
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
 									<input class="py-0 form-check-input" type="checkbox" name="AV16" value="1"/>
 								</div>
 								<!-- ACTIONS/COMMENTAIRES -->
     							<div id="A17">
 									<input class="py-0 form-control" type="text" name="AV17"/>
 								</div>   						
							</div>
						</div>
						
						<div class="column2-filter2 row d-flex mr-1">
	   						<div class="col-8 col-md-7 mx-1">
	     	    				<select name="mySelect2" class="form-select py-0 my-1 px-0" id="filter2_param" onChange="refreshFilter2()">
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
	        				
	   						<div class="col-8 col-md-4 mx-1 my-1">
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
	 								<select style="width: 195px;" class="py-0 form-select" id='BV4' name='BV4'>
	 									<option value='-1'>?</option>
										<c:forEach items="${ typeAppelants }" var="typeAppelant">
		   									<option style="width: 195px;" value="${ typeAppelant.id }">${ typeAppelant.nom }</option>
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
	 								<input class="py-0 form-check-input" type="checkbox" name="BV16" value="1"/>
	 							</div>
	 							<!-- ACTIONS/COMMENTAIRES -->
	     						<div id="B17">
	 								<input class="py-0 form-control" type="text" name="BV17"/>
	 							</div>
							</div>
						</div>
	    					
		    			<div class="column2-filter3 row d-flex mr-1">
				   			<div class="col-8 col-md-7 mx-1">
		     	    			<select name="mySelect3" class="form-select py-0 mt-1 px-0" id="filter3_param" onChange="refreshFilter3()">
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
							
			   				<div class="col-8 col-md-4 mx-1 mt-1">	
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
		   							<input class="py-0 form-control" type="text" name="CV5"/>
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
		       					<div id="C16">
		   							<input class="py-0 form-check-input" type="checkbox" name="CV16" value="1"/>
		   						</div>
		   						<!-- ACTIONS/COMMENTAIRES -->
		       					<div id="C17">
		   							<input class="py-0 form-control" type="text" name="CV17"/>
								</div>
							</div>
						</div>
					</div>
					
 					<!-- DEBUT BOUTON VALIDATION 3e COLONNE -->

		 			<div id=filtrer class="col-md-1 mb-3 py-0">
		 				<div class="row d-flex justify-content-center" >
			 				<div class="col-offset-1 col-5 col-lg-7 d-flex justify-content-center">
			  					<input id=input-filtrer type="submit" value="Filtrer" class="button btn btn-primary py-0">
			  				</div>
		   					<div class="col-5 d-flex justify-content-center">
		   						<a id=enlever-filtre href="/enlever-filtre" class="button btn btn-primary py-0">Enlever Filtre</a>
		   					</div>
		   				</div>
		    		</div><!-- FIN 3e COLONNE -->
    				
				</form>
			</div>
			<div class="container">
				<table id="table" class="table table-bordered mx-1">
    				<thead>
						<tr>
							<th>SERVICE</th>
							<th>DATE ET HEURE <br>
								<div>
									<a href="?sort=dateHeure,desc">&#x27F0;</a>
									<a href="?sort=dateHeure,asc">&#x27F1;</a>
								</div>
							</th>
							<th>AGENCE <br>
								<a href="?sort=agence.nom,desc">&#x27F0;</a>
								<a href="?sort=agence.nom,asc">&#x27F1;</a>
							</th>
							<th>DESTINATAIRE <br>
								<a href="?sort=recuPar.initiales,desc">&#x27F0;</a>
								<a href="?sort=recuPar.initiales,asc">&#x27F1;</a>
							</th>
							<th>TYPE D'APPELANT <br>
								<a href="?sort=typeAppelant.nom,desc">&#x27F0;</a>
								<a href="?sort=typeAppelant.nom,asc">&#x27F1;</a>
							</th>
							<th>NOMS <br>
								<a href="?sort=nom,desc">&#x27F0;</a>
								<a href="?sort=nom,asc">&#x27F1;</a>
							</th>
							<th>PRENOMS <br>
								<a href="?sort=prenom,desc">&#x27F0;</a>
								<a href="?sort=prenom,asc">&#x27F1;</a>
							</th>
							<th>N. DE MOBILE <br>
								 <a href="?sort=mobile,desc">&#x27F0;</a>
								 <a href="?sort=mobile,asc">&#x27F1;</a>
							 </th>
							<th>N. DE FIXE <br>
								 <a href="?sort=telephone,desc">&#x27F0;</a>
								 <a href="?sort=telephone,asc">&#x27F1;</a>
							 </th>
							<th>EMAIL <br>
								<a href="?sort=email,desc">&#x27F0;</a>
								<a href="?sort=email,asc">&#x27F1;</a>
							</th>
							<th>OBJET DE L'APPEL/COMMENTAIRE <br>
								 <a href="?sort=objet,desc">&#x27F0;</a>
								 <a href="?sort=objet,asc">&#x27F1;</a>
							</th>
							<th>SUPPORT DE PUB <br>
								<a href="?sort=annonce.nom,desc">&#x27F0;</a>
								<a href="?sort=annonce.nom,asc">&#x27F1;</a>
							</th>
							<th>ORIGINE CONTACT <br>
								<a href="?sort=origine.nom,desc">&#x27F0;</a>
								<a href="?sort=origine.nom,asc">&#x27F1;</a>
							</th>
							<th>TYPE CONTACT <br>
								<a href="?sort=origine.nom,desc">&#x27F0;</a>
								<a href="?sort=origine.nom,asc">&#x27F1;</a>
							</th>
							<th>NOM DU MANDAT <br>
								<a href="?sort=nomDuMandat,desc">&#x27F0;</a>
								<a href="?sort=nomDuMandat,asc">&#x27F1;</a>
							</th>
							<th>SAISIE PAR <br>
								<a href="?sort=recuPar.initiales,desc">&#x27F0;</a>
								<a href="?sort=recuPar.initiales,asc">&#x27F1;</a>
							</th>
							<th>VU <br>
								<a href="?sort=estAccuse,desc">&#x27F0;</a>
								<a href="?sort=estAccuse,asc">&#x27F1;</a>
							</th>
							<th>ACTIONS/COMMENTAIRE <br>
								<a href="?sort=suivre,desc">&#x27F0;</a>
								<a href="?sort=suivre,asc">&#x27F1;</a>
							</th>
							<th>TRAITE <br>
								<a href="?sort=estTermine,desc">&#x27F0;</a>
								<a href="?sort=estTermine,asc">&#x27F1;</a>
							</th>
						</tr>
					</thead>
					<tbody id="tbody">
						<c:forEach items="${ pageDAppels.content }" var="appel">
							<tr id="tr">
								<td style="display: none">${appel.id }</td>
								<td><a 
										href="/ajouter-un-appel?idAppel=${appel.id}" 
										class="btnAction btn btn-warning m-1">
										Modifier
									</a>
								</td>
								<td>${ appel.dateHeure }</td>
								<td>${ appel.agence.nom }</td>
								<td>
									${ appel.suiviPar.initiales } 
									${ appel.suiviPar2.initiales } 
									${ appel.suiviPar3.initiales }
								</td>
								<td>${ appel.typeAppelant.nom }</td>
								<td>${ appel.nom }</td>
								<td>${ appel.prenom }</td>
								<td>${ appel.mobile }</td>
								<td>${ appel.telephone }</td>
								<td>${ appel.email }</td>
								<td id=td-objet-appel-commentaire>${ appel.objet }</td>
								<td>${ appel.annonce.nom }</td>
								<td>${ appel.origine.nom }</td>
								<td></td>
								<td>${ appel.nomDuMandat }</td>
								<td>${ appel.recuPar.initiales }</td>
								<td>
									<c:if test="${ appel.estAccuse }">Oui</c:if>
									<c:if test="${ ! appel.estAccuse }">Non</c:if>
								</td>
								<td id=td-action-commentaire>${ appel.suivre }</td>
								<td>
									<c:choose>
										<c:when test="${ appel.estTermine eq 1}">
											Oui
										</c:when>
										<c:when test="${ appel.estTermine eq 0}">
											Non
										</c:when>
										<c:otherwise>En cours</c:otherwise>
									</c:choose>
								</td>								
							</tr>
						</c:forEach> 
					</tbody>
   				</table>
			</div>

			<jsp:include page="pagination.jsp"/>

		</main>
	
		<jsp:include page="footer.jsp"/>
	
	</body>