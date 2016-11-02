<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page
import="eu.telecom_bretagne.services.IServiceAuthentifier,
		eu.telecom_bretagne.services.IServiceCreerDemande,
		eu.telecom_bretagne.services.IServiceValiderDemande,
		eu.telecom_bretagne.services.IServiceImprimerDemande,
		eu.telecom_bretagne.services.IServiceLivrerDemande,
		eu.telecom_bretagne.data.model.Employe,
		eu.telecom_bretagne.data.model.Demande,
		eu.telecom_bretagne.data.model.Document,
		eu.telecom_bretagne.front.utils.*,
		java.util.List"
%>

<%
	Object utilisateur = session.getAttribute("utilisateur");

	IServiceAuthentifier authServ = (IServiceAuthentifier) ServicesLocator.getInstance().getRemoteInterface("ServiceAuthentifier");
	IServiceCreerDemande creerServ = (IServiceCreerDemande) ServicesLocator.getInstance().getRemoteInterface("ServiceCreerDemande");
	IServiceValiderDemande validerServ = (IServiceValiderDemande) ServicesLocator.getInstance().getRemoteInterface("ServiceValiderDemande");
	IServiceImprimerDemande imprimerServ = (IServiceImprimerDemande) ServicesLocator.getInstance().getRemoteInterface("ServiceImprimerDemande");
	IServiceLivrerDemande livrerServ = (IServiceLivrerDemande) ServicesLocator.getInstance().getRemoteInterface("ServiceLivrerDemande");

%>


<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cabinet de recrutement</title>
<link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

<script src="./js/bootstrap.min.js"></script>
</head>

<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="index.jsp"> Accueil </a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">

				<% if (utilisateur != null && utilisateur instanceof Employe) { 
				
						Employe employe = (Employe) utilisateur;
				
						%>

						<li><a href="deconnexion.jsp">DECONNEXION(USER_<%=employe.getNom()%>)
						</a></li>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">IMPRESSIONS <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="liste_demandes.jsp?id=<%=employe.getEmployeid()%>">Liste des demandes d'impressions</a></li>
						<li><a href="creer_demande.jsp">Créer une demande</a></li>

						<%
							if (employe != null && validerServ.estResponsable(employe.getEmployeid())) {
						%>

						<li role="separator" class="divider"></li>
						<li><a href="liste_demandes_responsable.jsp?id=<%=employe.getEmployeid()%>">Liste
								des demandes à valider</a></li>

						<% } %>


						<% if (employe != null && employe.getPoste().compareToIgnoreCase("imprimeur")==0) { %>

						<li><a href="liste_demandes_imprimeur.jsp%>">Liste
								des demandes à imprimer</a></li>

						<% } %>


						<% if (employe != null && employe.getPoste().compareToIgnoreCase("livreur")==0) { %>

						<li><a href="liste_demandes_livreur.jsp%>">Liste
								des demandes à livrer</a></li>

						<% } %>

					</ul>
				</li>
				
				<% } else { %>

						<li><a href="connexion.jsp">CONNEXION</a></li>

				<% } %>
				
			</ul>
		</div>
	</div>
</nav>
<body class="container" style="text-align: center">
	Bienvenue sur l'outil de gestion d'impression.
</body>

</html>
