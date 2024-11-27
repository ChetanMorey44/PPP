<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    
    <%
    	 if(request.getParameter("submit")!=null){
    		 String Stname = request.getParameter("sname");
             String Course = request.getParameter("course");
             String Fee = request.getParameter("fee");
             
             Class.forName("com.mysql.cj.jdbc.Driver");
             Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/curd" , "root" , "root");
             Statement st = con.createStatement();
             st.executeUpdate("insert into one (stname , course , fee) values ('"+Stname+"' , '"+Course+"' , '"+Fee+"')");
    	
    %>
     <script>
         alert("Data inserted!! ")
     </script>
   <%
    	 }
   %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
     <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
</head>
<body class='container'>
   <h1>Student Registation System Crud using-JSP</h1>
        </br>
        <div class="row">
            <div class="col-sm-4 col-lg-4">
                <form  method="get" action="#" > 
                    
                    <div alight="left">
                        <label class="form-label">Student Name</label>
                        <input type="text" id="sname" class="form-control" placeholder="Student Name" name="sname" id="sname" required >
                     </div>
                         
                    <div alight="left">
                        <label class="form-label">Course</label>
                        <input type="text" id="course" class="form-control" placeholder="Course" name="course" id="course" required >
                     </div>
                         
                     <div alight="left">
                        <label class="form-label">Fee</label>
                        <input type="text" id="fee" class="form-control" placeholder="Fee" name="fee" id="fee" required >
                     </div>
                         </br>
                         
                     <div alight="right">
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                     </div>  
                         
                </form>
            </div>
            <div class='col-lg-8'>
               <table class='table table-bordered'>
                  <tr>
                     <th>Student Name</th>
                     <th>Course</th>
                     <th>Fee</th>
                     <th>Edit</th>
                     <th>Delete</th>
                  </tr>
                  <%
                  Class.forName("com.mysql.cj.jdbc.Driver");
                  Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/curd" , "root" , "root");
                  PreparedStatement ps = con1.prepareStatement("select * from one");
                  ResultSet rs = ps.executeQuery();
                   
                  while(rs.next()){
                	 String id = rs.getString("id");
                   %>
                      <tr>
                	     <td><%= rs.getString("stname") %></td>
                	     <td><%= rs.getString("course") %></td>
                	     <td><%= rs.getString("fee") %></td>
                	     <td><a href="update.jsp?id=<%=id%>" class='btn btn-success'>Update</a></td>
                	     <td><a href="delete.jsp?id=<%=id%>" class='btn btn-danger'>Delete</a></td>
                	   </tr>
                  
                  <%
                  }
                  %>
               </table>
            </div>
</body>
</html>