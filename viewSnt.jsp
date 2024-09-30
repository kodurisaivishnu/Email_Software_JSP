<%@page import="java.sql.*"%>
<html>
    <head>
        <title>View Sent</title>
        <style>
            div{
                width:300px;
                height:300px;
                border:2px solid black;
                margin:20px auto;
                padding:20px;
            }
            input[type="text"]
            {
                margin:15px;
            }
        </style>
    </head>
    <body>
    <%
        String mid=request.getParameter("mid");
        ResultSet rs=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/soft","root","Saivishnu@123");
            PreparedStatement ps=conn.prepareStatement("select * from mail where mid="+mid);
            rs=ps.executeQuery();
            rs.next();
            
        }
        catch(Exception e)
        {
            out.println(e);
        }
        
    %>
    <div>
        MAIL TO:<input type="text" value=<%=rs.getString("mto")%>> <br>
        SubJect:<input type="text" value=<%=rs.getString("sub")%>> <br>
        <textarea rows=10 cols=40><%=rs.getString("mtext")%></textarea>
        <a href="delSnt.jsp?selected=<%out.println(mid);%>">DELETE</a>
    </div>
    </body>
</html>