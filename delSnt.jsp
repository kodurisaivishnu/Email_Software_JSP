<%@page import="java.sql.*"%>
<%
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/soft","root","Saivishnu@123");
        String ids[]=request.getParameterValues("selected");
        for(String id:ids)
        {
           PreparedStatement ps=conn.prepareStatement("update mail set sentbox=0 where mid="+id);
           ps.executeUpdate();
        }
        response.sendRedirect("sentbox.jsp");
    }catch(Exception e)
    {
        out.println(e);
    }
%>