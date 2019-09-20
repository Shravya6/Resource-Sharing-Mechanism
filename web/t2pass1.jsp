<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="network.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String pass = request.getParameter("pass");
    String nupass=request.getParameter("nupass");
    String nupass1=request.getParameter("nupass1");
    String t2name=(String)session.getAttribute("t2name");String t2id=(String)session.getAttribute("t2id");
    Connection conn = DbConnection.getConnection();
    Statement sto = conn.createStatement();
    ResultSet rs=sto.executeQuery("select * from t2 where name='"+t2name+"'");
    rs.next();
    String pwd=rs.getString(3);
    
if(pass.equals(pwd)){
        if(nupass.equals(nupass1)){
        PreparedStatement ps=conn.prepareStatement("update t2 set pass=? where name='"+t2name+"'");
        ps.setString(1,nupass);
        
           
          
       int k=ps.executeUpdate();
       
        if(k!=0)
        {
            %>
            <script type="text/javascript">
           window.alert("Password updated successfully"); 
           window.location="t2home.jsp";
           </script>
            <% }}
                else{%>
                <script type="text/javascript">
           window.alert("Mismatch of Password and Re-enter Password"); 
           window.location="t2pass.jsp";
           </script>
                   <%  } 
           }else{
               %>
               <script type="text/javascript">
           window.alert("You've entered wrong current password"); 
           window.location="t2pass.jsp";
           </script>
               
               <%
               
           }
        %>

