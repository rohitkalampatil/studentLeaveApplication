<%-- 
    Document   : studentlogin
    Created on : Apr 23, 2023, 12:53:35 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        
            Statement st=null;
            Connection c1=null;
            String q="";
            int rn=0;
            int prn = Integer.parseInt(request.getParameter("sid") );
            String password = request.getParameter("spwd");
              
            try
            {
              Class.forName("com.mysql.jdbc.Driver"); 
              c1=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentapp","root","root");
              //out.println("Database Connected Succesfully");
              
              st=c1.createStatement();
              
              q="select prn,password,semail from student where prn="+prn+" and password='"+password+"'";
              
              //out.println("Name = "+email+"<br> pass"+password);
              ResultSet r =st.executeQuery(q);
              if(r.next())
              {
                  String email=r.getString("semail");
                 HttpSession s1 = request.getSession(true);
                 s1.setAttribute("email", email);
                 s1.setAttribute("prn", prn);
                 s1.setMaxInactiveInterval(3600);
                 response.sendRedirect("studentpannel.html");
                 //out.print("roll no: "+rollno+"<br>pass :"+password); 
              }
              else
                  out.print("");
              //st.close();
            }
            catch(Exception e)
            {
                out.println("Student Exception"+e);
            }
      
        
        %>
        <script type='text/javascript'>
            alert("Invalid Id or Password");
            location="studentlogin.html";
        </script>

    </body>
</html>
