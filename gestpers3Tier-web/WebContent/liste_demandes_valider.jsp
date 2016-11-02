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
	// R�cup�ration du service (bean session)
	IServiceAuthentifier authServ = (IServiceAuthentifier) ServicesLocator.getInstance().getRemoteInterface("ServiceAuthentifier");
	IServiceCreerDemande creerServ = (IServiceCreerDemande) ServicesLocator.getInstance().getRemoteInterface("ServiceCreerDemande");
	IServiceValiderDemande validerServ = (IServiceValiderDemande) ServicesLocator.getInstance().getRemoteInterface("ServiceValiderDemande");
	IServiceImprimerDemande imprimerServ = (IServiceImprimerDemande) ServicesLocator.getInstance().getRemoteInterface("ServiceImprimerDemande");
	IServiceLivrerDemande livrerServ = (IServiceLivrerDemande) ServicesLocator.getInstance().getRemoteInterface("ServiceLivrerDemande");

	String idUtilisateur = request.getParameter("id");
	String idDemandeValider = request.getParameter("demandeValider");
	String idDemandeEnvoyer = request.getParameter("demandeEnvoyer");
	if (idDemandeValider!=null) {
		validerServ.validerDemande(Integer.parseInt(idDemandeValider));
	}
	else if(idDemandeEnvoyer!=null){
		validerServ.envoyerDemande(Integer.parseInt(idDemandeEnvoyer));
	}
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
			<th>Nom Document</th>
			<th>Etat demande</th>
			<th>Date cr�ation</th>
			<th>Date validation</th>
			<th>imprimeur en charge</th>
			<th>Date impression</th>
			<th>livreur en charge</th>
			<th>Date livraison</th>
			<th>Actions</th>

		</tr>
		<%
			List<Demande> d = validerServ.getMyDemandes(Integer.parseInt(idUtilisateur));
			for (Demande dTemp : d) {

				%>
				<tr>
					<td>Demande_<%=dTemp.getDemandeid()%></td>
					<td><%=dTemp.getDocument().getNom() %></td>
					<td><%=dTemp.getEtat() %></td>
					<td><%=dTemp.getDatecreation() %></td>
					<td><%=dTemp.getDatevalidation() %></td>
					<% if(dTemp.getImprimeur()==null) { %>
						<td>non attribu�</td>
					<% } else { %>
						<td><%=dTemp.getImprimeur().getNom() %></td>
					<% } %>
					<td><%=dTemp.getDateimpression() %></td>
					<% if(dTemp.getLivreur()==null) { %>
						<td>non attribu�</td>
					<% } else { %>
						<td><%=dTemp.getLivreur().getNom() %></td>
					<% } %>
					<td><%=dTemp.getDatelivraison() %></td>
					<td><a href="liste_demandes_valider.jsp?id=<%=employe.getEmployeid()&demandeValider=dTemp.getDemandeid()%>"></a></td>
					<td><a href="liste_demandes_valider.jsp?id=<%=employe.getEmployeid()&demandeEnvoyer=dTemp.getDemandeid()%>"></a></td>
				</tr>
				<%

			}
		%>
	</table>

	<a href="index.jsp">Retour au menu</a>

</body>

</html>
