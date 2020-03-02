
package bean;

public class Ticket {

    private String projectName, description, requested_by, department, doc;
    public Ticket() {
    }

    public Ticket(String projectName, String description, String requested_by, String department, String doc) {
        this.projectName = projectName;
        this.description = description;
        this.requested_by = requested_by;
        this.department = department;
        this.doc = doc;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getRequested_by() {
        return requested_by;
    }

    public void setRequested_by(String requested_by) {
        this.requested_by = requested_by;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getDoc() {
        return doc;
    }

    public void setDoc(String doc) {
        this.doc = doc;
    }
    
    
}
