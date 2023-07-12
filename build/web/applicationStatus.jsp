<%-- 
    Document   : applicationStatus
    Created on : Apr 27, 2023, 3:10:41 PM
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
            String q="",status="";
            int appid=0;
            try
            {
              Class.forName("com.mysql.jdbc.Driver"); 
              c1=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentapp","root","root");
              //out.println("Database Connected Succesfully");
              
              status=request.getParameter("status");
              appid=Integer.parseInt(request.getParameter("appid"));
              //out.print("status="+status+"<br>id="+appid);
              st=c1.createStatement();
              q="update leaveapplications set status='"+status+"' where applicationid="+appid;
              int r=st.executeUpdate(q);
              if(r>0)
              {
                  response.sendRedirect("inbox.jsp");
                  //out.print("accepted yor application <br>Application id :"+appid+"Status : "+status);
              }
              else
              {
                  //out.print("rejected yor application <br>Application id :"+appid+"Status : "+status);
              }
              
              st.close();
            }
            catch(Exception e)
            {
                out.println("Student Exception"+e);
            }
       

        %>
       <%-- <script type='text/javascript'>
            alert("Application Updated");
            location="hodpannel.html";
        </script>--%>
    </body>
</html>
