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

	List<Demande> demandes = creerServ.getMyDemandes();

%>
<%
  // R�cup�ration du param�tre (id) pass� par l'URL : http://localhost:8080/infos_entreprises.jsp?id=1
  // Attention : la valeur r�cup�r�e, m�me num�rique, est sous la forme d'une cha�ne de caract�res.
  String nomString = request.getParameter("nomDocument");
  String etatString = request.getParameter("etat");
  String dateString = request.getParameter("date");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>R�f�rencer offre</title>
<link rel="stylesheet" href="./css/bootstrap.min.css" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

<script src="./js/bootstrap.min.js"></script>
</head>
<body style="text-align: center" class="container">

	<% if(nomString!=null && etatString!=null){
		if(!nomString.isEmpty() && !etatString.isEmpty()){

			int id = creerServ.creerDemande(nomString, etatString);
	%>
	<table id="affichage" style="text-align: center" class="table-bordered table-striped">
		<tr>
			<th>Nom Document</th>
			<th>Etat demande</th>
			<th>Date Création</th>
		</tr>
			<tr>
				<td><%=nomString%></td>
				<td><%=etatString %></td>
				<td><%=dateString %></td>
			</tr>
	</table>

	<% }
	}
	else{
		%>Veuillez renseigner les informations de l'offre<%
	}

	%>

	<h2>Référencer offre</h2>
	<form action="referencer_offre.jsp" method="post">
		<h3>Titre</h3>
		<input type="text" name="nomDocument">
		<h3>Descriptif</h3>
		<input type="text" name="etat">

		<input type="hidden" name="date" value="Aujourd'hui">
		<input type="submit" value="Envoyer">
	</form>



	<a href="index.jsp">Retour au menu</a>
</body>
</html>
