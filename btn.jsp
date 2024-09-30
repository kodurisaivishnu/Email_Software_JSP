<!DOCTYPE html>
<html>
<head>
    <title>Using Buttons</title>
    <script type="text/javascript">
        function button1() {
            document.form1.buttonName.value = "button 1";
            document.form1.submit();
        }
        
        function button2() {
            document.form1.buttonName.value = "button 2";
            document.form1.submit();
        }
        
        function button3() {
            document.form1.buttonName.value = "button 3";
            document.form1.submit();
        }
    </script>
</head>
<body>
    <h1>Using Buttons</h1>
    <form name="form1" action="basic.jsp" >
        <input type="hidden" name="buttonName">
        <input type="button" value="Button 1" onclick="button1()">
        <input type="button" value="Button 2" onclick="button2()">
        <input type="button" value="Button 3" onclick="button3()">
    </form>
</body>
</html>
