package models.users;

import database.ConnectionFactory;
import models.SparePart;
import models.User;
import models.Vehicle;

import java.io.IOException;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

public class Admin {
    int id,units,sunits,vehicle_id;
    String model,smodel,name,sname,brand,sbrand;
    double price,sprice,tax,stax,profit;



    public int add_operator( String user_name,String password) throws SQLException {
//        System.out.println("Enter user name");
//        Scanner sc =new Scanner(System.in);
//        String user_name = sc.next();

            Connection con = ConnectionFactory.getConnection();
            //Statement st0 = con.createStatement();
            PreparedStatement st1 = con.prepareStatement("select * from users where username = ?");
            st1.setString(1,user_name);
            ResultSet res =st1.executeQuery();
            //ResultSet rs = st0.executeQuery("select * from users where username = "+user_name);
            System.out.println("rs");
            if(!res.next()) {
      System.out.println("Enter Your Password");
//            String password = sc.next();

                DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                Calendar cal = Calendar.getInstance();
                String reportDate = dateFormat.format(cal.getTime());



                PreparedStatement st = con.prepareStatement("insert into users(username,password,privelege,updated_at) values(?,?,?,?)");
                //st.setInt(1,1);
                st.setString(1,user_name);
                st.setString(2,password);
                st.setInt(3,1);
                st.setString(4,reportDate);
                int result=st.executeUpdate();
                if(result>0) {
                    System.out.println("Operator:"+user_name+" created successfully");
                    return 1;
                }
                return 0;
            } else {
                System.out.println("username already exists!!");
                return 0;
                //add_operator();
            }


    }
    public  int remove_operator(String user_name) throws SQLException {
//       System.out.print("Enter user name you want to delete:  ");
//       Scanner sc =new Scanner(System.in);
//        String user_name = sc.next();
        Connection con = ConnectionFactory.getConnection();
        //Statement st0 = con.createStatement();
        PreparedStatement st1 = con.prepareStatement("select * from users where username = ?");
        st1.setString(1,user_name);
        ResultSet res =st1.executeQuery();
        //ResultSet rs = st0.executeQuery("select * from users where username = "+user_name);
        //System.out.println(rs);
        if(res.next()) {
            PreparedStatement st = con.prepareStatement("delete from users where username = ?");
            //st.setInt(1,1);
            st.setString(1,user_name);
            int result=st.executeUpdate();
            if(result>0) {
                System.out.println("Operator:"+user_name+" deleted successfully");
                return 1;
            }

        } else {
            System.out.println("username not found");
            return 0;
        }
        return 0;
    }
    public  void item() throws SQLException, IOException, InterruptedException {
        System.out.println("1. Vehicle: \n2. Sparepart: ");
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        if (n == 1) {
            vehicle();

        } else if (n == 2) {
            sparepart();
        } else {
            System.out.println("Wrong input entered");
            final  String ESC = "\033[";
            System.out.print(ESC + "2J");
            item();

        }
    }
    public  void vehicle() throws SQLException, IOException, InterruptedException {
        System.out.println("1. Add Vehicle: \n2. Remove Vehicle: \n3. Back: 4. Logout: ");
        Scanner sc = new Scanner(System.in);
        int n1= sc.nextInt();
        Vehicle v = new Vehicle();
        if(n1==1) {
            System.out.println("Enter Vehicle name");
            name=sc.next();
            System.out.println("Enter model number");
            model=sc.next();
            System.out.println("Enter brand name");
            brand=sc.next();
            System.out.println("Enter price of vehicle");
            price=sc.nextDouble();
            System.out.println("Enter units of vehicle");
            units=sc.nextInt();
            System.out.println("Enter tax incurred ");
            tax=sc.nextDouble();
            System.out.println("Enter profit incurred");
            profit=sc.nextDouble();
            v.add_vehicle(model,name,brand,price,units,tax,profit);
        }
        else if(n1 ==2) {
            System.out.println("Enter model number of vehicle you want to delete");
            String dvmodel=sc.next();
            v.remove_vehicle(dvmodel);
        }
        else if(n1 ==3) {
            item();
        }
        else if(n1 ==4) {
            logout();
        }
        else {
            System.out.println("Wrong input entered");
            vehicle();
        }

    }
    public void sparepart() throws SQLException, IOException, InterruptedException {// html
        System.out.println("1. Add Sparepart: \n2. Remove Sparepart: \n3. Back: 4.Logout");
        Scanner sc = new Scanner(System.in);
        int n2= sc.nextInt();
        if(n2==1) {
            System.out.println("Enter sparpart name");
            sname=sc.next();
            System.out.println("Enter model number");
            smodel=sc.next();
            System.out.println("Enter brand name");
            sbrand=sc.next();
            System.out.println("Enter price of sparepart");
            sprice=sc.nextDouble();
            System.out.println("Enter units of sparepart");
            sunits=sc.nextInt();
            System.out.println("Enter sparepart's vehicle ID");
            vehicle_id=sc.nextInt();
            System.out.println("Enter tax incurred ");
            stax=sc.nextDouble();
            SparePart sp = new SparePart();
            sp.add_sparepart(smodel,sname,sbrand,sprice,sunits,vehicle_id,stax);
        }
        else if(n2 ==2) {
            System.out.println("Enter model number of sparepart you want to delete!");
            String dsmodel=sc.next();
            SparePart sp = new SparePart();
            sp.remove_sparepart(dsmodel);
        }
        else if(n2 ==3) {

            item();
        }
        else if(n2 ==4) {

            logout();
        }
        else {
            System.out.println("Wrong input entered");
            sparepart();
        }

    }
    public void logout() throws SQLException {
        String sql = "insert into logs(username, time, description) values(?, ?, ?)";
        Connection con =ConnectionFactory.getConnection();
        PreparedStatement st = con.prepareStatement(sql);

        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Calendar cal = Calendar.getInstance();
        String dd = dateFormat.format(cal.getTime());
        User u = new User();
        String user_name = u.getUsername();

        st.setString(1, user_name);
        st.setString(2, dd);
        st.setString(3, "logout");

        int i = st.executeUpdate();

        if(i == 1) {
            System.out.println("Logged out successfully!");
            u.logoutUpdate();
        }
        else
            System.out.println("Try Again");
    }


    public static void main(String[] args) throws SQLException, IOException, InterruptedException {
        Admin a = new Admin();
        a.item();
        //a.add_operator();
        //a.remove_operator();
    }

}
