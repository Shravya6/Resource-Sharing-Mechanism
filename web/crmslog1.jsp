<%-- 
    Document   : crmslog1
    Created on : Jul 10, 2017, 6:33:18 PM
    Author     : java3
--%>

<%
String name = request.getParameter("name");
    String pass = request.getParameter("pass");
    try {
        if (name.equalsIgnoreCase("crms") && pass.equalsIgnoreCase("crms")) {
            response.sendRedirect("crmshome.jsp");
        } else {
            %>
           <script type="text/javascript">
           window.alert("Incorrect username or password"); 
           window.location="crmslog.jsp";
           </script>
          <%
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>