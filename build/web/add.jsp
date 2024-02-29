<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- BOOTSTRAP CDNs -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="./add.css" />
        <title>Add Task</title>
    </head>
    <body>
        <form id="taskform" action="AddTask" method="post">
            <% 
                String exceptionMsg = (String) request.getAttribute("exception");
                if(exceptionMsg != null && !exceptionMsg.isEmpty()){
            %>
            <p class="alert alert-danger"><%= exceptionMsg %></p> 
            <%
                } 
            %>
            <h1>Add New Task</h1>
            <label for="name">Name : </label>
            <input type="text" id="name" name="name" autofocus required>

            <label for="task">Task : </label>
            <input type="text" id="task" name="task" required>

            <label for="student">Student : </label>
            <input type="text" id="student" name="student" required>

            <center><button type="submit">Create</button></center>
        </form>
    </body>
</html>
