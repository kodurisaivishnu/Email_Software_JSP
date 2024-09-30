<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        .container{
            margin:50px auto;
            width: 300px;
            height: 200px;
            border: 2px solid black;
        }
        .box{
            margin: 20px;
        }
        input[type="submit"]{
            width: 60%;
            height: 30px;
            margin-top:50px;
            margin-left:60px;
            background-color: blueviolet;
            color: azure;
            border-radius:10px ;
        }
        h1{
            color:red;
            text-align:center;
        }
    </style>
</head>
<body>
    <h1>
    <%
        String str=request.getParameter("msg");
        if(str!=null)
        {
            out.println(str);
        }
    %>
    </h1>

    <form action="validate.jsp" method="post">
        <div class="container">
            <div class="box">
                <label for="name">Email:</label>
                <input type="text" name="email" id="name">
            </div>
            <div class="box">
                <label for="password">Password:</label>
                <input type="text" name="password" id="password">
            </div>

            <input type="submit" value="SUBMIT">
        </div>
    </form>
</body>
</html>