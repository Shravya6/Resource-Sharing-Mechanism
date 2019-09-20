/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package network;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import network.DbConnection;

/**
 *
 * @author IBN33
 */
public class Download extends HttpServlet {

    private static Connection getConnection() {
        throw new UnsupportedOperationException("Not yet implemented");
    }

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {

            String fkey = request.getParameter("fkey");
            System.out.println("fkey===" + fkey);

            HttpSession user = request.getSession();
            String t2id = user.getAttribute("t2id").toString();
            String t2name = user.getAttribute("t2name").toString();
            String t2mail = user.getAttribute("t2mail").toString();
            Connection con = DbConnection.getConnection();
            Connection con2 = DbConnection.getConnection();
            Statement st1 = con2.createStatement();
            Statement st = con.createStatement();
            Statement st2 = con.createStatement();
            ResultSet rt = st.executeQuery("select * from filereq where t2id='" + t2id + "' And fskey='" + fkey + "' And status1='GRANTED' ");
            if (rt.next()) {
               String finame = rt.getString("filename");
               String fikey = rt.getString("fskey");
               System.out.println("fikey=="+fikey);
                ResultSet rtt = st2.executeQuery("select * from fileupload where skey='" + fikey + "'");
                if (rtt.next()) {
                    String fname = rtt.getString("filename");
                    String fid = rtt.getString("id");
                    System.out.println("fname fid=="+fname+fid);
                     InputStream is = rtt.getAsciiStream("content");
                    BufferedReader br = new BufferedReader(new InputStreamReader(is));
                    StringBuffer sb = new StringBuffer();
                    String temp = null;

                    while ((temp = br.readLine()) != null) {
                        sb.append(temp);

                    }
                    response.setHeader("Content-Disposition", "attachment;filename=\"" + fname + ".txt" + "\"");
                    out.write(sb.toString());
                    out.close();
                    int i = st1.executeUpdate("insert into download (t2id, fid, fname, time)values('" + t2id + "','" + fid + "','" + fname + "',now())");

                    if (i != 0) {
                        // response.sendRedirect("download.jsp");
                    } else {
                        System.out.println("error  while updating information...");
                    }
                     } else {
                    System.out.println("file not found...");
                }
                } else {
                response.sendRedirect("t2vt1file2.jsp?revoke=revoked");
                    System.out.println("File Cant Download Because Your Revoked for this file");
                
            }
            }  catch (Exception e) {
            e.printStackTrace();
        } finally {
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}