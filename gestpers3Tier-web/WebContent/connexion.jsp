
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@page import="eu.telecom_bretagne.front.utils.*,
                eu.telecom_bretagne.services.IServiceAuthentifier,
                eu.telecom_bretagne.data.model.Employe,
				java.util.List"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Connexion</title>
<link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

<script src="./js/bootstrap.min.js"></script>
</head>

<body class="container" style="text-align:center">

<h2>Connexion au systeme</h2>

<p style="font-style: italic;">
  Renseigner prenom, nom d'utilisateur et le mot de passe associé pour se connecter.
</p>

<%
  String prenom = request.getParameter("prenom");
  String nom = request.getParameter("nom");
  String mdp = request.getParameter("mdp");
  if(prenom == null || nom == null || mdp == null) // Pas de paramï¿½tre "identifiant" => affichage du formulaire
  {
  	%>
    <form action="connexion.jsp" method="get">
		  <!-- <input type="hidden" name="action" value="connexion" /> -->
	
     	<p> prenom : <input type="text" name="prenom"/> </p>
	
		<p> nom : <input type="text" name="nom"/> </p>
		    
      	<p> Password: <input type="text" name="mdp"/> </p>
		  
		<p> <input type="submit" value="Connexion"/> </p>
		</form>
    <hr>
  	<%
  }
  else                    // Paramï¿½tre "identifiant" existant => connexion
  {
	  	if(prenom == "" || nom == "" || mdp == "")
	  	{
	      %>
	      <p class="erreur">Veuillez renseignez votre numÃ©ro d'identifiant pour pouvoir vous connecter</p>
	      <a href="index.jsp">Retour...</a>
	      <%
	  	}
	  	else
	  	{
		  	  IServiceAuthentifier serviceAuthentifier = (IServiceAuthentifier) ServicesLocator.getInstance().getRemoteInterface("ServiceAuthentifier");
		  	  Employe em = serviceAuthentifier.authentifier(prenom, nom, mdp);
		      if(em == null)
		      {
			        %>
			        <p class="erreur">Erreur : il n'y a pas d'employe avec cet identifiant </p>
			        <a href="index.jsp">Retour...</a>
			        <%
		      }
		      else
		      {
		        session.setAttribute("utilisateur",em);
		        response.sendRedirect("index.jsp");
		      }
	  	}
  }
  
%>
</body>
