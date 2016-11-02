
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Deconnexion</title>

</head>

<body class="container" style="text-align:center">

<%

	session.setAttribute("utilisateur", null);
	response.sendRedirect("index.jsp");
  
%>
</body>
