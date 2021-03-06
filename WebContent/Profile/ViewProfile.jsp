<%@page import="java.io.Console"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modules.User"%>
<%@page import="Modules.Advertisement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>View Profile</title>
<!-- Bootstrap core CSS-->
<link href="./vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom fonts for this template-->
<link href="./vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- Custom styles for this template-->
<link href="./css/sb-admin.css" rel="stylesheet">

<style>
div.gallery:hover {
	border: 1px solid #777;
}

div.gallery img {
	width: 100%;
	height: auto;
}

div.desc {
	padding: 15px;
	text-align: center;
}

.checked {
	color: orange;
}
</style>


</head>
<body>
	<%
		if(session.getAttribute("userID")==null){
			response.sendRedirect("login.html");
			return;
		}
	%>
	<jsp:include page="../NavBar.jsp" />
	

	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="card">
				<img class="card-img-top" src=${user.profilePicture
				}
				alt="Card image cap" style="width: 20rem;">
				<div class="card-body">
					<table class="table">
						<tbody>
							<tr>
								<th>First Name :</th>
								<td>${user.firstName}</td>
							</tr>
							<tr>
								<th>Last Name :</th>
								<td>${user.lastName}</td>
							</tr>
							<tr>
								<th>Email :</th>
								<td>${user.email}</td>
							</tr>
							<tr>
								<th>Address :</th>
								<td>${user.address}</td>
							</tr>
							<tr>
								<th>Phone Number :</th>
								<td>${user.phoneNumber}</td>
							</tr>
							<tr>
								<td>
									<a href=<% 
											User user = (User) request.getAttribute("user");
											String tmp = "/IA-Project/editProfile?id=" +user.getUserId();
											out.print(tmp);
									%> >
										<button type="button" class="btn btn-primary btn-sm">Edit Profile</button>
									</a>
									</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">My Ads :</h4>
					<div class="card-body">
						<table class="table">
							<tbody>
								<tr>
									<th>Ad Name</th>
									<th>Rate</th>
									<th>Edit</th>
									<th>View</th>
								</tr>
								<%
									ArrayList<Advertisement> ads = (ArrayList<Advertisement>) user.getAds();
									for (int i = 0; i < ads.size(); i++) {
								%>
								<tr>
									<td>
										<%
											out.print(ads.get(i).getName());
										%>
									</td>
									<td>
									<%
										String[] read = ads.get(i).getRate().split("#");
											Integer[] readInt = new Integer[read.length];
											for (int j = 0; j < read.length; j++)
												readInt[j] = Integer.parseInt(read[j]);
											double rate = 0, sum = 0;
											for (int j = 0; j < readInt.length; j++) {
												rate += (readInt[j] * (j + 1));
												sum += readInt[j];

											}
											rate = rate / sum;
											for (int j = 0; j < 5; j++) {

												if (rate - 1 >= j) {
													%> <span class="fa fa-star checked"></span> <%
 												} else {
 													%> <span class="fa fa-star"></span> <%
 												}
 											}
									 %>
 									</td>
									<td><a href="
										<%
											out.print("EditAdvertisementServlet?id="+ads.get(i).getAdvertisementId());
										%>
									"> <span class="fa fa-fw fa-pencil"></span>
									</a></td>
									<td><a href=<%
											out.print("HouseDe?adId="+ads.get(i).getAdvertisementId());
									%>> <span class="fa fa-fw fa-film"></span>
									</a></td>
								</tr>

								<%
									}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>



</body>
</html>