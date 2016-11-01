
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@page import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceEntreprise,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceCandidature,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Entreprise,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Candidature"%>

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
  Renseigner le nom d'utilisateur et le mot de passe associé pour se connecter.
</p>
<%
  String identifiant = request.getParameter("identifiant");
  if(identifiant == null) // Pas de param�tre "identifiant" => affichage du formulaire
  {
  	%>
    <form action="connexion.jsp" method="get">
		  <!-- <input type="hidden" name="action" value="connexion" /> -->
		  <p>
		    Identifiant : <input type="text" name="identifiant"/>
		  </p>
      <p>
		    Password: <input type="text" name="mdp"/>
		  </p>
		  <p>
		    <input type="submit" value="Connexion"/>
		  </p>
		</form>
    <hr>
  	<%
  }
  else                    // Param�tre "identifiant" existant => connexion
  {
  	if(identifiant.equals(""))
  	{
      %>
      <p class="erreur">Veuillez renseignez votre numéro d'identifiant pour pouvoir vous connecter</p>
      <a href="index.jsp">Retour...</a>
      <%
  	else
  	{
  		IServiceUtilisateur serviceUtilisateur = (IServiceUtilisateur) ServicesLocator.getInstance().getRemoteInterface("ServiceUtilisateur");
  		Candidature candidature = serviceCandidature.getCandidature(identifiant);
      if(candidature == null)
      {
        %>
        <p class="erreur">Erreur : il n'y a pas de candidature avec cet identifiant : <%=identifiant%></p>
        <a href="index.jsp">Retour...</a>
        <%
      }
      else
      {
        session.setAttribute("utilisateur",candidature);
        response.sendRedirect("index.jsp");
      }
  	}
  }
%>
</body>
