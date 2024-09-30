<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>

<%
ResultSet rs=null;
    String mid=request.getParameter("mid");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/soft","root","Saivishnu@123");
        PreparedStatement ps =conn.prepareStatement("select * from mail where mid=?");
        ps.setString(1,mid);
        rs=ps.executeQuery();
        rs.next();
    }catch(Exception e)
    {
        out.println(e);
    }
    String url="delInboxView.jsp?ids="+mid;
    url="delInbox.jsp?ids="+mid;
%>

<html>
    <head>
        <title>View Sent</title>
    </head>
    <body>

        <form action="delInboxView.jsp">
        <input type="hidden" readonly value=<%=rs.getString("mid")%> name='ids'>
        From:<input type="text" readonly value=<%=rs.getString("mfrom")%>> <br> 
        Subject:<input type="text" readonly value=<%=rs.getString("sub")%>> <br>
        Mail Text:<textarea rows=10 cols=20 ><%=rs.getString("mtext")%> </textarea>
        <% out.println("<a href=delInboxView.jsp?ids="+rs.getString("mid")+">DELETE</a>");%>
        <input type="submit">
        <input type="button"  value="DELETE BUTTON" onclick="f1('<%=url%>')">
        
        <form>
    </body>
    <script>
    function f1(url) {
        window.location.href=url;
    }
</script>

</html>