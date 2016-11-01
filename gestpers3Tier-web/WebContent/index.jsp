<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

	<%@page
	import="eu.telecom_bretagne.services.IServiceAuthentifier,
	        eu.telecom_bretagne.data.model.Employe,
	        eu.telecom_bretagne.front.utils.*"
	%>

<%
	Object utilisateur = session.getAttribute("utilisateur");
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

				<%if (utilisateur != null
							&& utilisateur instanceof Employe) {
						Employe u = (Employe) utilisateur;
				%>

				<li><a href="deconnexion.jsp">DECONNEXION(USER_<%=u.getId()%>)
				</a></li>

				<%
					} else {
				%>

				<li><a href="connexion.jsp">CONNEXION</a></li>

				<%
					}
				%>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">IMPRESSIONS <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="liste_demandes.jsp?id=<%=utilisateur.getId()%>">Liste des demandes d'impressions</a></li>
						<li><a href="créer_demande.jsp">Créer une demande</a></li>

						<%
							if (utilisateur != null && utilisateur.getRole()=="responsable") {
						%>

						<li role="separator" class="divider"></li>
						<li><a href="liste_demandes_responsable.jsp?id=<%=utilisateur.getId()%>">Liste
								des demandes à valider</a></li>

						<%
							}
						%>


			<%
				if (utilisateur != null && utilisateur.getRole()=="responsable") {
			%>

						<li><a href="liste_demandes_imprimeur.jsp%>">Liste
								des demandes à imprimer</a></li>

						<%
							}
						%>


						<%
							if (utilisateur != null && utilisateur.getRole()=="responsable") {
						%>

						<li><a href="liste_demandes_livreur.jsp%>">Liste
								des demandes à livrer</a></li>

						<%
							}
						%>

					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav>
<body class="container" style="text-align: center">
	Bienvenue sur l'outil de gestion d'impression.
</body>

</html>
