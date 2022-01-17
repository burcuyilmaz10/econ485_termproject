import java.sql.*;

public class Main {
    public static Connection getConn() throws  SQLException{
        Connection conn = null;

        String url       = "jdbc:mysql://localhost:3306/production";
        String user      = "root";
        String password  = "1234";

        conn = DriverManager.getConnection(url, user, password);
        return conn;
    }

    public static void main(String[] args) {
        try {
            Connection conn = null;
            conn = getConn();
            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from production_run_fact");
            System.out.println("PRODUCTION RUN FACT" + "\n");
            while (resultSet.next()){
                System.out.println(
                        "COST: " + resultSet.getString("COST") + "\n" +
                        "COST_VARIANCE_FROM_STANDARD: " + resultSet.getString("COST_VARIANCE_FROM_STANDARD") + "\n" +
                        "DURATION: " + resultSet.getString("DURATION") + "\n" +
                        "DURATION_VARIENCE_FROM_STANDARD: " + resultSet.getString("DURATION_VARIANCE_FROM_STANDARD") + "\n" +
                        "QUANTITY_PRODUCED: " + resultSet.getString("QUANTITY_PRODUCED") + "\n" +
                        "QUANTITY_REJECTED: " + resultSet.getString("QUANTITY_REJECTED") + "\n" +
                        "manufactorıng_parts_PART_ID: " + resultSet.getString("manufactured_parts_PART_ID") + "\n" +
                        "plant_locations_FACILITY_ID: " + resultSet.getString("plant_locations_FACILITY_ID") + "\n" +
                        "time_by_day_DAY_ID: " + resultSet.getString("time_by_day_DAY_ID") + "\n" +
                        "production_run_type_WORK_EFFORT_TYPE_ID: " + resultSet.getString("production_run_types_WORK_EFFORT_TYPE_ID") + "\n" +
                        "responsible_partys_RESPONSIBLE_PARTY_ID: " + resultSet.getString("responsible_partys_RESPONSIBLE_PARTY_ID") + "\n"
                );
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
}