<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="myClass.Task" %>
<%@ page import="java.util.List" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--GOOGLE ICONS CDN-->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
        <!--BOOTSTRAP CDN-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="./view.css" />
        <title>View Task</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="d-flex justify-content-between my-navbar">
                <div>
                    <h1 class="navbar-brand" href="#">Tasks</h1>
                </div>
                <div>
                    <a class="btn btn-primary" href="./add.jsp">Add Task</a>
                </div>
            </div>
        </nav>
        <div class="content">
            <% 
                String exceptionMsg = (String) request.getAttribute("exception");
                if(exceptionMsg != null && !exceptionMsg.isEmpty()){
            %>
            <p class="alert alert-danger"><%= exceptionMsg %></p> 
            <%
                } 
            %>
            <%
            List<Task> tasks = (List<Task>) session.getAttribute("tasks");

            if (tasks != null && !tasks.isEmpty()) {
            %>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Task</th>
                    <th>Student</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
                <%
                    for (Task t : tasks) {
                %>
                <tr>
                    <td><%= t.getId() %></td>
                    <td><%= t.getName() %></td>
                    <td><%= t.getTask() %></td>
                    <td><%= t.getAssignedTo() %></td>
                    <td>
                        <a class="btn btn-outline-primary" href="EditTask?id=<%= t.getId() %>">
                            <span class="material-symbols-outlined">
                                edit
                            </span>
                        </a>
                    </td>
                    <td>
                        <a class="btn btn-outline-danger" href="DeleteTask?id=<%= t.getId() %>">
                            <span class="material-symbols-outlined">
                                delete
                            </span>
                        </a>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
            <%
                        } else {
            %>
            <center><h1>No Tasks Added</h1></center>
                <%
                    }
                %>
        </div>
    </body>
</html>
