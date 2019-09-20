<%-- 
    Document   : t2log1
    Created on : Jul 10, 2017, 12:27:54 PM
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
        rs = st.executeQuery("select * from t2 where id='" + id + "' and pass='" + pass + "'");
        if (rs.next()) {
            session.setAttribute("t2id", rs.getString("id"));
            session.setAttribute("t2mail", rs.getString("mail"));
            session.setAttribute("t2name", rs.getString("name"));
            session.setAttribute("t2tenant", rs.getString("tenant"));            
             session.setAttribute("t2pkey", rs.getString("pkey"));
             session.setAttribute("t2policy", rs.getString("policy"));
            System.out.println("Sucess");
            response.sendRedirect("t2home.jsp?msg=sucess");
        } else {
            %>
           <script type="text/javascript">
           window.alert("Incorrect username or password"); 
           window.location="t2log.jsp";
           </script>
          <%
        }

    } catch (Exception e) {
        e.printStackTrace();
    }
%>
