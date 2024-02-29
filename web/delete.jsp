<%@ page import="myClass.Task" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
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
        <form action="DeleteTask" method="post">
            <% 
                String exceptionMsg = (String) request.getAttribute("exception");
                if(exceptionMsg != null && !exceptionMsg.isEmpty()){
            %>
                <p class="alert alert-danger"><%= exceptionMsg %></p> 
            <%
                } 
            %>

            <%
            Task deleteTask = (Task) session.getAttribute("deleteTask");

            if (deleteTask != null) {
            %>
                <p>Sure Want To Delete (<%= deleteTask.getName() %> - [<%= deleteTask.getTask() %>]), Which Is Assigned to Student (<%= deleteTask.getAssignedTo() %>)</p>
                <input type="hidden" id="id" name="id" required value="<%= deleteTask.getId() %>">
                <center><button class="btn btn-outline-danger" type="submit">Delete</button></center>
            <%
            } else {
            %>
                <center><h1>Something Went Wrong!</h1></center>
            <%
                }
            %>
        </form>
    </body>
</html>
