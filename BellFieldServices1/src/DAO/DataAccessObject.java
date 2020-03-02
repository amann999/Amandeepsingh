/*

 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import bean.Ticket;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DataAccessObject {

    public static JsonArray getAllDeptAndEMP() {
        Connection connection = Utility.DbUtil.getConnection();
        try {
            PreparedStatement prepareStatement = connection.prepareStatement("select * from emp_dept");
            ResultSet rs = prepareStatement.executeQuery();
            JsonArray arr = new JsonArray();
            while (rs.next()) {
                String emp_name = rs.getString(2);
                String dept = rs.getString(1);
                JsonObject object = new JsonObject();
                object.addProperty("dept", dept);
                object.addProperty("emp_name", emp_name);
                arr.add(object);
            }
            return arr;
        } catch (SQLException ex) {
            Logger.getLogger(DataAccessObject.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Utility.DbUtil.closeConnection(connection);
        }
        return new JsonArray();
    }

    public static boolean insertTicket(Ticket ticket) {
        Connection connection = Utility.DbUtil.getConnection();
        try {
            String sql = "insert into ticket(project_name,description,requested_by,department,doc) values (?,?,?,?,?)";
            PreparedStatement prepareStatement = connection.prepareStatement(sql);
            prepareStatement.setString(1, ticket.getProjectName());
            prepareStatement.setString(2, ticket.getDescription());
            prepareStatement.setString(3, ticket.getRequested_by());
            prepareStatement.setString(4, ticket.getDepartment());
            prepareStatement.setString(5, ticket.getDoc());
            prepareStatement.execute();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(DataAccessObject.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Utility.DbUtil.closeConnection(connection);
        }
        return false;
    }

    public static JsonArray getAllTickets() {
        Connection connection = Utility.DbUtil.getConnection();
        try {
            PreparedStatement prepareStatement = connection.prepareStatement("select * from ticket");
            ResultSet rs = prepareStatement.executeQuery();
            JsonArray arr = new JsonArray();
            while (rs.next()) {
                String emp_name = rs.getString(4);
                String dept = rs.getString(5);
                String project = rs.getString(2);
                String description = rs.getString(3);
                String doc = rs.getString(6);
                JsonObject object = new JsonObject();
                object.addProperty("department", dept);
                object.addProperty("requestedBy", emp_name);
                object.addProperty("doc", doc);
                object.addProperty("projectName", project);
                object.addProperty("description", description);
                arr.add(object);
            }
            return arr;
        } catch (SQLException ex) {
            Logger.getLogger(DataAccessObject.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Utility.DbUtil.closeConnection(connection);
        }
        return new JsonArray();
    }

    public static JsonArray getStats() {
        Connection connection = Utility.DbUtil.getConnection();
        try {
            PreparedStatement prepareStatement = connection.prepareStatement("select * from ticket");
            ResultSet rs = prepareStatement.executeQuery();
            JsonArray arr = new JsonArray();
            HashMap<String, Integer> hm = new HashMap<>();
            while (rs.next()) {
                String project = rs.getString(2);
                if (hm.containsKey(project.toLowerCase())) {
                    int val = hm.get(project.toLowerCase());
                    hm.replace(project.toLowerCase(), val + 1);
                } else {
                    hm.put(project.toLowerCase(), 1);
                }
            }
            for (Map.Entry<String, Integer> entry : hm.entrySet()) {
                String key = entry.getKey();
                Integer value = entry.getValue();
                JsonObject jsonObject = new JsonObject();
                jsonObject.addProperty("projectName", key.toUpperCase());
                jsonObject.addProperty("count", value);
                arr.add(jsonObject);
            }
            return arr;
        } catch (SQLException ex) {
            Logger.getLogger(DataAccessObject.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            Utility.DbUtil.closeConnection(connection);
        }
        return new JsonArray();
    }
}
