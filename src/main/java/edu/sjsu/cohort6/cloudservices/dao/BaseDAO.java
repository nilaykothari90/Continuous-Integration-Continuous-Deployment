package edu.sjsu.cohort6.cloudservices.dao;

import com.mysql.jdbc.Driver;
import org.sql2o.Sql2o;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Base DAO class.
 *
 * @author rwatsh on 5/12/16.
 * Type conversions based on :
 * https://dev.mysql.com/doc/connector-j/5.1/en/connector-j-reference-type-conversions.html
 */
public abstract class BaseDAO {
    protected static Sql2o sql2o;

    static{
        try {
            String driver = "com.mysql.jdbc.Driver";
            Class.forName(driver);
            sql2o = new Sql2o("jdbc:mysql://kooltron-avengers-project.cft2jn9kud3b.us-west-2.rds.amazonaws.com:3306"+
                    "/classicmodels?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false"+
                            "&serverTimezone=UTC", "admin", "admincmpe282");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

}
