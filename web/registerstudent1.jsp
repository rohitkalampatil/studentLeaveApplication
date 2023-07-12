<%-- 
    Document   : registerstudent1
    Created on : Jul 12, 2023, 11:07:43 AM
    Author     : COCSIT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>register Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
  
    </head>

   
    <%! 
        int rn=0,c=0,cc=0,prn=0;
    %>
    <%
        Connection c1=null;
        Statement st=null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            //out.print("Mysql Driver Load Successfully");
            c1=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentapp","root","root");
            //out.print(" Database Connected Successfully ");
            st=c1.createStatement();
            String q="select max(rollno),max(prn) from student";
            ResultSet r=st.executeQuery(q);
            r.next();
            c=r.getInt("max(rollno)");
            cc=r.getInt("max(prn)");
            rn=c+1;
            prn=cc+1;
        }
        catch(Exception ex)
        {
                
        }
    %>
   
    <body>
<section class="vh-100" style="background-color: #eee;">
  <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-12 col-xl-11">
        <div class="card text-black" style="border-radius: 25px;">
          <div class="card-body p-md-5">
            <div class="row justify-content-center">
              <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign up</p>

                <form action="registerstudent.jsp" method="POST" class="mx-1 mx-md-4">
             
                <!-- Name  field-->
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="text" name="sname" id="form3Example1c" class="form-control" required=""/>
                      <label class="form-label" for="form3Example1c">Enter Student Name</label>
                    </div>
                  </div>
                
                <!-- roll no field-->
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="number" name="rollno" value="<%= rn%>" readonly=true id="form3Example3c" class="form-control" />
                      <label class="form-label" for="form3Example3c">Roll No</label>
                    </div>
                  </div>
                    
                 <!-- prn no field-->
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="number" name="prn" value="<%= prn%>" readonly=true class="form-control" />
                      <label class="form-label" for="prn">PRN No</label>
                    </div>
                  </div>
                
                <!-- Contact field-->
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                        <input type="number" name="contact" id="contact" class="form-control" required="" />
                      <label class="form-label" for="contact">contact</label>
                    </div>
                  </div>
                    
                <!-- Branch field -->
                    <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                        <div class="form-check form-check-inline">
                          <input class="form-check-input" type="radio" name="branch" id="inlineRadio1" value="cse" required=""/>
                          <label class="form-check-label" for="inlineRadio1">CSE</label>
                        </div>

                        <div class="form-check form-check-inline">
                          <input class="form-check-input" type="radio" name="branch" id="inlineRadio2" value="bsc" required=""/>
                          <label class="form-check-label" for="inlineRadio2">B.Sc</label>
                        </div>
                        <br>
                      <!--<label class="form-label" for="branch">Branch</label>-->
                    </div>
                  </div>
                   
                <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                        <select class="browser-default custom-select" name="years" required="">
                            <option value="First Year">First Year</option>
                            <option value="Second Year">Second Year</option>
                            <option value="Third Year">Third Year</option>
                            <option value="Fourh Year">Fourth Year</option>
                        </select>
                      <label class="form-label" for="years"> Select Year</label>
                    </div>
                  </div>
                
                <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="email" name="semail" class="form-control" required=""/>
                      <label class="form-label" for="semail">email</label>
                    </div>
                  </div>
                
                <!-- date Field-->
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="date" name="rdate" id="rdate" class="form-control" required=""/>
                      <label class="form-label" for="rdate">Registration Date</label>
                    </div>
                  </div>
                    
                    <!-- password-->
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input type="password" name="pwd1" id="pwd1" class="form-control" required=""/>
                      <label class="form-label" for="pwd1">Password</label>
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                        <input type="password" id="pwd2" name="pwd2" onkeyup="validate_password()" class="form-control"  required=""/>
                      <label class="form-label" for="pwd2">Repeat your password</label>
                    </div>
                  </div>
                    <span id="wrong_pass_alert"></span><br>
                  

                  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                    <input type="submit" class="btn btn-primary btn-lg" id="create"  value="Register">
                  </div>
                    <script>
		function validate_password() {

			var pass = document.getElementById('pwd1').value;
			var confirm_pass = document.getElementById('pwd2').value;
			if (pass != confirm_pass) {
				document.getElementById('wrong_pass_alert').style.color = 'red';
				document.getElementById('wrong_pass_alert').innerHTML
					= '? Use same password';
				document.getElementById('create').disabled = true;
				document.getElementById('create').style.opacity = (0.4);
			} else {
				document.getElementById('wrong_pass_alert').style.color = 'green';
				document.getElementById('wrong_pass_alert').innerHTML =
					'?? Password Matched';
				document.getElementById('create').disabled = false;
				document.getElementById('create').style.opacity = (1);
			}
		}

		function wrong_pass_alert() {
			if (document.getElementById('pass').value != "" &&
				document.getElementById('confirm_pass').value != "") {
				alert("Your response is submitted");
			} else {
				alert("Please fill all the fields");
			}
		}
	</script>

                </form>

              </div>
              <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
                  class="img-fluid" alt="Sample image">

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

    
    </body>
</html>
