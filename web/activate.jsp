<%-- 
    Document   : activate
    Created on : Jul 13, 2016, 6:00:23 PM
    Author     : java4
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="network.DbConnection"%>
<%
    String j = request.getQueryString();
                Connection con = DbConnection.getConnection();
                Statement st =con.createStatement();

    String  email=(String)session.getAttribute("Email");
     System.out.println("Email id"+email);
     String  title=(String)session.getAttribute("Title");
     System.out.println("Title name: "+title);
    int i = st.executeUpdate("update request set status = 'Yes' where email = '" + email + "' and title='"+title+"'");
    if (i != 0) {
        %>
           <script type="text/javascript">
           window.alert("Secret key sent to your email"); 
           window.location="userrequest.jsp";
           </script>
          <%
        
    } else {
        %>
           <script type="text/javascript">
           window.alert("error"); 
           window.location="userrequest.jsp";
           </script>
          <%
    }
%>