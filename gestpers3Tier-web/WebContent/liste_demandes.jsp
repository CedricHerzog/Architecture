<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page
	import="eu.telecom_bretagne.cabinet_recrutement.front.utils.ServicesLocator,
                eu.telecom_bretagne.cabinet_recrutement.service.IServiceDemande,
                java.util.HashSet,
                java.util.Set,
                eu.telecom_bretagne.cabinet_recrutement.front.utils.Utils,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Demande,
                eu.telecom_bretagne.cabinet_recrutement.data.model.Utilisateur,
                java.util.List"%>

<%
	// R�cup�ration du service (bean session)
	IServiceDemande serviceDemande = (IServiceDemande) ServicesLocator
			.getInstance().getRemoteInterface("ServiceDemande");
			String idUtilisateur = request.getParameter("id");
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cabinet de recrutement : liste offres r�f�renc�es</title>
<link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

<script src="./js/bootstrap.min.js"></script>
</head>

<body class="container">

	<h2>Liste des demandes pour cet utilisateur :</h2>
	<table id="affichage" class="table-striped table-bordered">
		<tr>
			<th>Id</th>
			<th>Titre</th>
			<th>Nom Document</th>
			<th>Etat demande</th>
			<th>Date création</th>

		</tr>
		<%
			List<Demande> d = serviceDemande.listeDesDemandes();
			for (Demande dTemp : d) {
				if(d.getDemandeur==idUtilisateur){
		%>
		<tr>
			<td>Demande_<%=dTemp.getId()%></td>
			<td><%=dTemp.getTitre() %></td>
			<td><%=dTemp.getNom() %></td>
			<td><%=dTemp.getEtat() %></td>
			<td><%=dTemp.getDateCreation() %></td>
		</tr>
		<%
				}
			}
		%>
	</table>

	<a href="index.jsp">Retour au menu</a>

</body>

</html>
