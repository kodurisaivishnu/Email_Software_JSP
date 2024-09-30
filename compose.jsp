<%@page import="java.sql.*"%>
<html>
<head>
    <title>Compose mail</title>
    <style>
    .container{
        margin:auto;
        width:300px;
        height:400px;
        border:2px solid black;
        padding:15px;
    }
    input[type="text"]
    {
        margin:20px;
        font-size:20;
    }
    input[type="submit"]{
        margin-left:120px;
        margin-top:12px;
    }
    </style>
</head>
<body>

    <h1>
        <% String txt=request.getParameter("msg");
        if(txt!=null)
            out.println(txt);
        %>
    <h1>
    <form action="insertMail.jsp" method="post">
        <div class="container">
        mfrom:<input readonly type="text" name="mfrom" value=<%=session.getAttribute("email")%> >
        <br>
        mto:<input type="text" name="mto">
        <br>
        Sub:<input type="text" name="sub">
        <br>
        Text:<input type="text" name="text">
    <input type="submit">
    </div>
    </form>
</body>
</html>