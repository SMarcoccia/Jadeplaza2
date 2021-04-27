<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
	<div id="pagination" class="d-flex justify-content-center">
		<nav aria-label="Page navigation">
		  	<ul class="pagination">
		        <c:if test="${page != 0}">
		        	<li class="page-item">
		        		<a class="page-link" href="?sort=${sort}&size=${size}&page=${page - 1}">
		        			Precedent
		        		</a>
		        	</li>
		        </c:if>
		        
				<!-- If the number of pages is less than 5, I display all the pages  -->
		        <c:if test="${nbPages <= 5 }">
		            <c:forEach var="i" begin="1" end="${nbPages}">
		                <c:if test="${page != i - 1}">
		                	<li class="page-item">
		                		<a class="page-link" href="?sort=${sort}&size=${size}&page=${i - 1}"> 
		                			${i} 
		                		</a>
		                	</li>
		                </c:if>
		                <c:if test="${page == i - 1}">
		                	<li class="page-item"><span class="page-link" style="color: red"> ${i} </span></li>
		                </c:if>
		            </c:forEach>
		        </c:if>
		
				<!-- Display of page numbers  -->
		        <c:if test="${pageDAppels.getTotalPages() > 5 }">
		        	<c:if test="${pageDAppels.number - 1 > 2}">
		            	<li class="page-item">
		            		<a class="page-link" href="?sort=${sort}&size=${size}&page=0"> 1 </a>
		            	</li>
		            	<span class="page-link" style="color: red">...</span>
		            </c:if>
		            <c:forEach var="i" begin="${pageDAppels.number - 1 <= 2 ? 1 : pageDAppels.number - 1 }" end="${pageDAppels.number + 3 >= pageDAppels.getTotalPages() - 1 ? pageDAppels.getTotalPages() : pageDAppels.number + 3 }">
		                <c:if test="${pageDAppels.number != i - 1}">
		                	<li class="page-item">
		                		<a class="page-link" href="?sort=${sort}&size=${size}&page=${i - 1}"> 
		                			${i} 
		                		</a>
		                	</li>
		                </c:if>
		                
		                <!-- Affiche le n° de page cliquée -->
		                <c:if test="${pageDAppels.number == i - 1}">
		                	<li class="page-item"><span class="page-link" style="color: red"> ${i} </span></li>
		                </c:if>
		            </c:forEach>
		            
		            <!-- Affiche le dernier n° de page -->
		            <c:if test="${pageDAppels.number + 3 < pageDAppels.getTotalPages() - 1}">
		            	<span class="page-link" style="color: red"> ...</span>
		            	<li class="page-item">
		            		<a class="page-link" href="?sort=${sort}&size=${size}&page=${pageDAppels.getTotalPages() - 1}"> 
		            			${pageDAppels.getTotalPages()} 
		            		</a>
		            	</li>
		            </c:if>
		        </c:if>

		        <c:if test="${pageDAppels.number != pageDAppels.getTotalPages() - 1}">
		        	<li class="page-item">
		        		<a class="page-link" href="?sort=${sort}&size=${size}&page=${pageDAppels.number + 1}">
		        			Suivant
		        		</a>
		        	</li>
		        </c:if>
	 		</ul>
		</nav>
	</div>