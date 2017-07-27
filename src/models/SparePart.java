package models;

import java.io.IOException;
import java.sql.*;

import database.ConnectionFactory;
import models.users.Admin;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class SparePart {
    Connection connection = ConnectionFactory.getConnection();


    public int add_sparepart( String model_no, String name, String brand, double price, int units, int vehicle_id, double tax) {

        PreparedStatement stmt = null;
        try {
            String sql;
            stmt = connection.prepareStatement("insert into spareparts(model_no, name, brand, price, units,vehicle_id, updated_at, tax) values(?,?,?,?,?,?,?,?)");
            DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
            Calendar now = Calendar.getInstance();
            String time = df.format(now.getTime());
            stmt.setString(1, model_no);
            stmt.setString(2, name);
            stmt.setString(3, brand);
            stmt.setDouble(4, price);
            stmt.setInt(5, units);
            stmt.setInt(6, vehicle_id);
            stmt.setString(7, time);
            stmt.setDouble(8, tax);

            int cnt = stmt.executeUpdate();
            if (cnt > 0) {
                System.out.println("Successfully inserted...");
                stmt.close();
                return 1;
            } else {
                System.out.println("Error inserting...");
                stmt.close();
                return 0;
            }


            //STEP 6: Clean-up environment


        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();return 0;
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();return 0;

        } finally {
            //finally block used to close resources
            try {
                if (stmt != null)
                    stmt.close();
            } catch (SQLException se2) {
                return 0;
            }// nothing we can do
        }//end try
       // System.out.println("Done...");
    }//end main

    public int remove_sparepart(String model_no) throws SQLException, IOException, InterruptedException {

        String sql = "delete from spareparts where model_no = ?";
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setString(1,model_no);

        int rows_affected = stmt.executeUpdate();
        if (rows_affected > 0) {
            System.out.println("Successfully Removed the sparepart having model_no: "+model_no);
            return  1;
            //Admin a = new Admin();
            //a.item();
        } else {
            System.out.println("Not Removed");
            return 0;
        }

    }

    public int add_sparePartsStocks(String model, int n) {
        try {
            String isql = "select units from spareparts where model_no = ?";
            PreparedStatement stmt = connection.prepareStatement(isql);
            stmt.setString(1, model);
            ResultSet rs = stmt.executeQuery();
            int t = 0;
            if(rs.next()) {
                t=rs.getInt(1) +n;
            }
            String sql = "update spareparts set units=? where model_no = ?";
            stmt = connection.prepareStatement(sql);
            stmt.setInt(1, t);
            stmt.setString(2, model);
            int rows_affected = stmt.executeUpdate();
            if(rows_affected > 0) {
                System.out.println("Successfully Updated");
                return 1;
            } else {
                System.out.println("Not Updated");
                return 0;
            }
        } catch (SQLException sqle) {
            System.err.println(sqle);return 0;
        }
    }

    public int sell_spareParts(String model, int n) {
        try {
            String isql = "select units from spareparts where model_no = ?";
            PreparedStatement stmt = connection.prepareStatement(isql);
            stmt.setString(1, model);
            ResultSet rs = stmt.executeQuery();
            int t = 0;
            if(rs.next()) {
                t=rs.getInt(1) -n;
            }
            String sql = "update spareparts set units=? where model_no = ?";
            stmt = connection.prepareStatement(sql);
            stmt.setInt(1, t);
            stmt.setString(2, model);
            int rows_affected = stmt.executeUpdate();
            if(rows_affected > 0) {
                System.out.println("Successfully Updated");
                return 1;
            } else {
                System.out.println("Not Updated");
                return 0;
            }
        } catch (SQLException sqle) {
            System.err.println(sqle);return 0;
        }
    }
}
 /*   public static void main(String [] args){
        SparePart sp=new SparePart();
        java.util.Date date = new java.util.Date();

//        sp.add(3,"adca","ca","acsa",23,2323,2748433,2827883, date.getTime(),343,12312);
//        sp.add(4,"adca","ca","acsa",23,2323,2738392,new java.sql.Timestamp(date.getTime()),343,12312);

//        SpareParts s1=new SpareParts();
//
//        s1.add_spareParts(4,453);
//        s1.add_spareParts(3,453);
//    }
    }
}
*/
