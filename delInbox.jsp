<%@page import="java.sql.*"%>
<% String ids[]=request.getParameter("ids").split(",");
for(String id:ids)
{   try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/soft","root","Saivishnu@123");
        int x=Integer.parseInt(id.trim());
        PreparedStatement ps=conn.prepareStatement("Update mail set inbox=0 where mid="+x);
        ps.executeUpdate();
        // out.println("<a href='inbox.jsp'>Check Now</a>");
        response.sendRedirect("inbox.jsp");
    }catch(Exception e)
    {
        out.println(e.getMessage());
    }
}
%>