
package bean;

public class DeptEmployeeMapping {
    private String dept;
    private String empName;

    public DeptEmployeeMapping() {
    }

    
    public DeptEmployeeMapping(String dept, String empName) {
        this.dept = dept;
        this.empName = empName;
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }
    
    
}
