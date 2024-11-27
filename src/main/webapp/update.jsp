
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 

<% 
    if(request.getParameter("submit")!=null)
    {
        String id = request.getParameter("id");
        String name = request.getParameter("sname");
        String course = request.getParameter("course");
        String fee = request.getParameter("fee");
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/curds","root" , "root");
        PreparedStatement ps = con.prepareStatement("update school set stname=? , course=? , fee=? where id=?");
        ps.setString(1, name);
        ps.setString(2, course);
        ps.setString(3, fee);
        ps.setString(4, id);
        ps.executeUpdate();
        
        %>
        
        <script>   
            alert("Record Updateddddd");           
       </script>
    <%             
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title> 
        
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        
        
        
    </head>
    <body>
        <h1>Student Update</h1>
        
        
        <div class="row">
            <div class="col-sm-4">
                <form  method="get" action="#" >
                    
                    <%    
                      
                        
                        String id = request.getParameter("id");
                        
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/curds","root" , "root");
                        PreparedStatement ps = con.prepareStatement("select * from school where id=?");
                        ps.setString(1, id);
                        ResultSet rs = ps.executeQuery();
                        
                         while(rs.next())
                        	 
                         {
                    
                    %>
                    <div alight="left">
                        <label class="form-label">Student Name</label>
                        <input type="text" class="form-control" placeholder="Student Name" value="<%= rs.getString("stname")%>" name="sname" id="sname" required >
                     </div>
                         
                    <div alight="left">
                        <label class="form-label">Course</label>
                        <input type="text" class="form-control" placeholder="Course" name="course" value="<%= rs.getString("course")%>" id="course" required >
                     </div>
                         
                     <div alight="left">
                        <label class="form-label">Fee</label>
                        <input type="text" class="form-control" placeholder="Fee" name="fee" id="fee" value="<%= rs.getString("fee")%>" required >
                     </div>
                       <% 
                        }
                       %>
                         </br>
                     <div alight="right">
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                       
                     </div>  
                         <div align="right">
                             <p><a href="NewFile.jsp">Click Back</a></p>
                         </div>
                </form>
            </div>          
        </div>
  
    </body>
</html>
 