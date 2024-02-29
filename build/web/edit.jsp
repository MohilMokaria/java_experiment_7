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
        <title>Edit Task</title>
    </head>
    <body>
        <form id="taskform" action="EditTask" method="post">
            <% 
                String exceptionMsg = (String) request.getAttribute("exception");
                if(exceptionMsg != null && !exceptionMsg.isEmpty()){
            %>
            <p class="alert alert-danger"><%= exceptionMsg %></p> 
            <%
                } 
            %>

            <%
            Task editTask = (Task) session.getAttribute("editTask");

            if (editTask != null) {
            %>
                <h1>Edit Task</h1>
                <input type="hidden" id="id" name="id" required value="<%= editTask.getId() %>">
                <label for="name">Name : </label>
                <input type="text" id="name" name="name" value="<%= editTask.getName() %>" autofocus required>

                <label for="task">Task : </label>
                <input type="text" id="task" name="task" value="<%= editTask.getTask() %>" required>

                <label for="student">Student : </label>
                <input type="text" id="student" name="student" value="<%= editTask.getAssignedTo() %>" required>

                <center><button type="submit">Modify</button></center>
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
