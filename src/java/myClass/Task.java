package myClass;

public class Task {

    private int id;
    private String name;
    private String task;
    private String assignedTo;

    public Task() {
    }

    public Task(int id, String name, String task, String assignedTo) {
        this.id = id;
        this.name = name;
        this.task = task;
        this.assignedTo = assignedTo;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setTask(String task) {
        this.task = task;
    }

    public void setAssignedTo(String assignedTo) {
        this.assignedTo = assignedTo;
    }

    public int getId() {
        return this.id;
    }

    public String getName() {
        return this.name;
    }

    public String getTask() {
        return this.task;
    }

    public String getAssignedTo() {
        return this.assignedTo;
    }

}
