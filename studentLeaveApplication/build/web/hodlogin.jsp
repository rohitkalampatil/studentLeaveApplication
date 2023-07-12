<%-- 
    Document   : hodlogin
    Created on : 20 Apr, 2023, 2:16:49 PM
    Author     : Dell 5310
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
       
        <%Connection c1=null;
        Statement st=null;
        String q="",branch="";
        
        String aid=request.getParameter("aid");
        String apwd=request.getParameter("apwd");
        
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver"); 
            c1=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentapp","root","root");
            
            st=c1.createStatement();
            q="select userid,password,branch from hod where userid='"+aid+"' and password='"+apwd+"'";
            ResultSet r=st.executeQuery(q);
            
            
              if(r.next())
              {  
                  branch=r.getString("branch");
                        HttpSession s1 = request.getSession(true);
                        s1.setAttribute("branch",branch);
                        s1.setMaxInactiveInterval(3600);
                        response.sendRedirect("hodpannel.html");
            
                    
                    
              }
              else
              {
                  //out.println("Invalid Id or Password");
                  
              }
              st.close();
        }
        catch(Exception ex){
            out.print(""+ex);
        }
       
        %>
        <script type='text/javascript'>
            alert("Invalid Id or Password");
            location="hodlogin.html";
        </script>
    </body>
    
</html>
