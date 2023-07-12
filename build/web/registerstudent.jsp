<%-- 
    Document   : registerstudent
    Created on : 20 Apr, 2023, 2:51:17 PM
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
        <%
            Statement st=null;
            Connection c1=null;
            String q="";
            try
            {
              Class.forName("com.mysql.jdbc.Driver"); 
              c1=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentapp","root","root");
              //out.println("Database Connected Succesfully...<br>");
              
              st=c1.createStatement();
              
              String sname=request.getParameter("sname");
              int rollno = Integer.parseInt(request.getParameter("rollno"));
              long contact = Long.parseLong(request.getParameter("contact"));
              String branch = request.getParameter("branch");
              String pass = request.getParameter("pwd1");
              
              String email=request.getParameter("semail");
              String rdate=request.getParameter("rdate");
              String year=request.getParameter("years");
              int prn=Integer.parseInt(request.getParameter("prn"));
              
              
                    q="insert into student values('"+sname+"',"+rollno+","+prn+","+contact+",'"+branch+"','"+year+"','"+email+"','"+pass+"','"+rdate+"')";           
                    int r=st.executeUpdate(q);
                    if(r>0)
                    {
                        //out.print("student Added");
                    }
                    else
                    {

                    }
              
              st.close();
            }
            catch(Exception e)
            {
                out.print(""+e);
            }
        %>
        <script type='text/javascript'>
            alert("Student Added Successfully..");
            location="registerstudent1.jsp";
        </script>
    </body>
</html>
