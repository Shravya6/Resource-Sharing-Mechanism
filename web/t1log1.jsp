<%-- 
    Document   : ulog1
    Created on : Jul 10, 2017, 10:51:29 AM
    Author     : java3
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="network.DbConnection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String id = request.getParameter("name");
    String pass = request.getParameter("pass");
    
    Connection con = DbConnection.getConnection();
    Statement st = con.createStatement();
    ResultSet rs = null;
    try {
        rs = st.executeQuery("select * from t1 where id='" + id + "' and pass='" + pass + "'");
        if (rs.next()) {
            session.setAttribute("t1id", rs.getString("id"));
            session.setAttribute("t1mail", rs.getString("mail"));
            session.setAttribute("t1name", rs.getString("name"));
            session.setAttribute("t1tenant", rs.getString("tenant"));
            System.out.println("Sucess");
            response.sendRedirect("t1home.jsp?msg=sucess");
        } else {
            %>
           <script type="text/javascript">
           window.alert("Incorrect username or password"); 
           window.location="t1log.jsp";
           </script>
          <%
        }

    } catch (Exception e) {
        e.printStackTrace();

    }
%>