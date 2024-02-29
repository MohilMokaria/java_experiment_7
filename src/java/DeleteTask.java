
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import myClass.Task;

@WebServlet("/DeleteTask")
public class DeleteTask extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        final String jdbcUri = getServletContext().getInitParameter("jdbcUri");
        final String dbUri = getServletContext().getInitParameter("dbUri");
        final String dbId = getServletContext().getInitParameter("dbId");
        final String dbPass = getServletContext().getInitParameter("dbPass");

        HttpSession session = request.getSession();
        String taskIdString = request.getParameter("id");
        int taskId = Integer.parseInt(taskIdString);
        Task deleteTask = new Task();

        try {
            Class.forName(jdbcUri);
            try (Connection connection = DriverManager.getConnection(dbUri, dbId, dbPass)) {
                String sql = "SELECT * FROM tasks WHERE id=?";
                try (PreparedStatement statement = connection.prepareStatement(sql)) {
                    statement.setInt(1, taskId);
                    try (ResultSet resultSet = statement.executeQuery()) {
                        while (resultSet.next()) {
                            deleteTask.setId(resultSet.getInt("id"));
                            deleteTask.setName(resultSet.getString("name"));
                            deleteTask.setTask(resultSet.getString("task"));
                            deleteTask.setAssignedTo(resultSet.getString("assigned_to"));
                        }
                    }
                }
                session.setAttribute("deleteTask", deleteTask);
                RequestDispatcher rd = request.getRequestDispatcher("delete.jsp");
                rd.forward(request, response);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ViewTask.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("exception", ex.getMessage());
            RequestDispatcher rd = request.getRequestDispatcher("delete.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        final String jdbcUri = getServletContext().getInitParameter("jdbcUri");
        final String dbUri = getServletContext().getInitParameter("dbUri");
        final String dbId = getServletContext().getInitParameter("dbId");
        final String dbPass = getServletContext().getInitParameter("dbPass");

        String taskIdString = request.getParameter("id");
        int taskId = Integer.parseInt(taskIdString);

        try {
            Class.forName(jdbcUri);

            try (Connection con = DriverManager.getConnection(dbUri, dbId, dbPass)) {

                PreparedStatement ps = con.prepareStatement("DELETE FROM tasks WHERE id=?");
                ps.setInt(1, taskId);
                int rowsAffected = ps.executeUpdate();

                if (rowsAffected > 0) {
                    response.sendRedirect("ViewTask");
                } else {
                    request.setAttribute("exception", "Something Went Wrong!");
                    RequestDispatcher rd = request.getRequestDispatcher("view.jsp");
                    rd.forward(request, response);
                }

                ps.close();
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AddTask.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("exception", ex.getMessage());
            RequestDispatcher rd = request.getRequestDispatcher("delete.jsp");
            rd.forward(request, response);
        }
    }
}
