<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String user=request.getParameter("user");
		String pw=request.getParameter("pw");
		ResultSet rs= null;
			try {

			Class.forName("com.mysql.jdbc.Driver").newInstance(); // MySQL database		
			Connection conn =DriverManager.getConnection("jdbc:mysql://localhost/a4uf3m8?" + "user=root&password=");
			PreparedStatement pst = conn.prepareStatement("Select usuari ,pass from `a4uf3m8`.`login` where usuari=? and pass=?");
			pst.setString(1, user);
			pst.setString(2, pw);
			rs = pst.executeQuery();
			
			} catch(SQLException e){
				out.println("SQLException: " + e.getMessage());
				out.println("VendorError: " + e.getErrorCode());
			//out.println("Something went wrong !! Please try again");
			}
		
			if(rs!=null){
				if(rs.next()){
				out.println("<h1 style='border:1px solid black;background-color:lightgreen;font-family:arial'>");
				out.println("L'usuari i el password existeixen</h1>");
				}else{
				
					out.println("<h1 style='border:1px solid black;background-color:red;font-family:arial'>");
					out.println("L'usuari i/o el password son incorrectes</h1>");
				
				}
			}
	%>
	
	
	
</body>
</html>