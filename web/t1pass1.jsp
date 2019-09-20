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
    String t1name=(String)session.getAttribute("t1name");String t1id=(String)session.getAttribute("t1id");
    Connection conn = DbConnection.getConnection();
    Statement sto = conn.createStatement();
    ResultSet rs=sto.executeQuery("select * from t1 where name='"+t1name+"'");
    rs.next();
    String pwd=rs.getString(3);
    
if(pass.equals(pwd)){
        if(nupass.equals(nupass1)){
        PreparedStatement ps=conn.prepareStatement("update t1 set pass=? where name='"+t1name+"'");
        ps.setString(1,nupass);
        
           
          
       int k=ps.executeUpdate();
       
        if(k!=0)
        {
            %>
            <script type="text/javascript">
           window.alert("Password updated successfully"); 
           window.location="t1home.jsp";
           </script>
            <% }}
                else{%>
                <script type="text/javascript">
           window.alert("Mismatch of Password and Re-enter Password"); 
           window.location="t1pass.jsp";
           </script>
                   <%  } 
           }else{
               %>
               <script type="text/javascript">
           window.alert("You've entered wrong current password"); 
           window.location="t1pass.jsp";
           </script>
               
               <%
               
           }
        %>

