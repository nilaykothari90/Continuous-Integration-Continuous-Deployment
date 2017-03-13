package utils;

/**
 * Created by shruteegangras on 5/15/16.
 */
import java.io.FileWriter;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class UserImporterUtil {

    public static void main(String args[]) throws ClassNotFoundException, IOException {

        DBConnector dbConnector = new DBConnector();
        Collection<User> usersFromDB = dbConnector.getUsersFromDB();

        generateCSV(usersFromDB);

    }

    private static void generateCSV(Collection<User> usersFromDB) throws IOException {
        FileWriter writer = null;

        writer = new FileWriter("/Users/shruteegangras/Projects/KoolTronUsers.csv");


        for(User user:usersFromDB){
            try
            {
                writer.append(user.getFirstName());
                writer.append(',');
                writer.append(user.getLastName());
                writer.append(',');
                writer.append(user.getEmployeeNumber());
                writer.append('\n');

            }
            catch(IOException e)
            {
                e.printStackTrace();
            }
        }

        writer.flush();
        writer.close();

        System.out.println("Done writing to file.");

    }

}

class DBConnector{
    public Collection<User> getUsersFromDB() throws ClassNotFoundException {
        Connection conn = null;
        List<User> users = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            // Setup the connection with the DB
            //conn = DriverManager
            // .getConnection("jdbc:mysql://52.36.28.150:3306/classicmodels", "root", "root");
            conn = DriverManager
                    .getConnection("jdbc:mysql://localhost:3306/classicmodels", "root", "");

            String query = "SELECT * FROM employees";
            // create the java statement
            Statement st = conn.createStatement();
            // execute the query, and get a java resultset
            ResultSet rs = st.executeQuery(query);
            // iterate through the java resultset
            while (rs.next()) {
                String employeeNumber = rs.getString("employeeNumber");
                String lastName = rs.getString("lastName");
                String firstName = rs.getString("firstName");
                // print the results
                System.out.format("%s, %s, %s\n", employeeNumber, firstName, lastName);

                User user = new User();
                user.setEmployeeNumber(employeeNumber);
                user.setFirstName(firstName);
                user.setLastName(lastName);

                users.add(user);
            }
            st.close();
        } catch (SQLException ex) {
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }
        return  users;
    }
}

class User{
    private String employeeNumber;
    private String firstName;
    private String lastName;

    public User(){}

    public String getEmployeeNumber() {
        return employeeNumber;
    }

    public void setEmployeeNumber(String employeeNumber) {
        this.employeeNumber = employeeNumber;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof User)) return false;

        User user = (User) o;

        if (!employeeNumber.equals(user.employeeNumber)) return false;
        if (!firstName.equals(user.firstName)) return false;
        return lastName.equals(user.lastName);

    }

    @Override
    public int hashCode() {
        int result = employeeNumber.hashCode();
        result = 31 * result + firstName.hashCode();
        result = 31 * result + lastName.hashCode();
        return result;
    }
}
