<%-- 
    Document   : loginaction
    Created on : Feb 23, 2016, 3:43:53 PM
    Author     : java4
--%>

<%@page import="java.util.UUID"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="network.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Random"%>

<%
    Connection con = null;
    Statement st = null;
   ResultSet rs = null;

       String skey = request.getParameter("skey");
      session.setAttribute("ssskey", skey);
  
     //int status = Integer.parseInt(request.getParameter("status"));

        con = DbConnection.getConnection();
        st = con.createStatement();
       
                 
                 

                    rs = st.executeQuery("select * from upload where secret_key='" + skey + "'");
                    if (rs.next()) {
                    %>
           <script type="text/javascript">
           window.alert("Success"); 
           window.location="dufiledown2.jsp";
           </script>
          <%
                        
                    } else {
                        %>
           <script type="text/javascript">
           window.alert("Fail"); 
           window.location="dufiledown2.jsp";
           </script>
          <%
                    }
       

%>