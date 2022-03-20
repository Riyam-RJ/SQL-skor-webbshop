import java.sql.*;

public class HelperClass {
    public boolean validateUser(Connection conn, String email, String pass) throws SQLException {
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM kund WHERE email=?");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            String emailFromDB = rs.getString("email");
            String passFromDB = rs.getString("pass");
            if (emailFromDB.equals(email) && passFromDB.equals(pass)) {
                System.out.println("validation success");
                return true;
            }

        }
        return false;
    }


    public void printMenu() {
        String[] options = {"1- List all products",
                            "2- Choose product",
                            "3- Show my order",
                            "4- Exit",};
        System.out.println();
        System.out.println("----- Choose from the menu ------");
        for (String option : options) {
            System.out.println(option);
        }
        System.out.print("Choose your option : ");
    }

    public void printAllproducts(Connection conn) throws SQLException {
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM skor");
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            int id = rs.getInt("id");
            String brand = rs.getString("brand");
            String color = rs.getString("color");
            String size = rs.getString("storlek");
            String price = rs.getString("pris");
            String totalInStock = rs.getString("totalt_i_lager");

            System.out.print("id: "+id+" ,");
            System.out.print("brand: "+brand+" ,");
            System.out.print("size: "+size+" ,");
            System.out.print("color: "+color+" ,");
            System.out.print("price: "+price+" ,");
            System.out.print("Total In Stock: "+totalInStock+" ");


            System.out.println();
        }
    }

    public int getUserIdFromDB(Connection conn, String email) throws SQLException {
        PreparedStatement ps = conn.prepareStatement("SELECT id FROM kund WHERE email=?");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            return rs.getInt("id");
        }
        else System.out.println("no record found");

        return -1;
    }

    public int AddProductToCart(Connection conn, int userId, int bestallningId, int product_choice) throws SQLException {
        // AddToCart(kundid, bestallningid, skorid)
        CallableStatement stmt = conn.prepareCall("{CALL AddToCart(?,?,?)}");
        stmt.setInt(1,userId);
        stmt.setInt(2,bestallningId);
        stmt.setInt(3,product_choice);
        stmt.executeQuery();

        System.out.println("Product id: "+product_choice+" is added to the cart");

        PreparedStatement ps = conn.prepareStatement("SELECT MAX(id) FROM bestallning");
        ResultSet rs = ps.executeQuery();
        int senasteBestallningId = 0;
        if(rs.next()) senasteBestallningId = rs.getInt("max(id)");

        return senasteBestallningId;
    }


    public void showOrdersInformation(Connection conn, String bestallningDate, int kundId) throws SQLException {
        ResultSet rs = null;

        if(bestallningDate.equalsIgnoreCase("all")){
            PreparedStatement ps = conn.prepareStatement("select b.id as bestallning_id, b.datum as date," +
                    "s.brand, s.storlek as size, s.pris as price," +
                    "s.color" +
                    " from bestallning b" +
                    " inner join bestallningdetalj bd" +
                    " on bd.bestallning_id = b.id" +
                    " and b.kund_id = ?" +
                    " inner join skor s" +
                    " on s.id = bd.skor_id;");
            ps.setInt(1, kundId);
            rs = ps.executeQuery();
        }
        else{
            PreparedStatement ps = conn.prepareStatement("select b.id as bestallning_id, b.datum as date," +
                    "s.brand, s.storlek as size, s.pris as price," +
                    "s.color" +
                    " from bestallning b" +
                    " inner join bestallningdetalj bd" +
                    " on bd.bestallning_id = b.id" +
                    " and b.datum = ?" +
                    " and b.kund_id = ?" +
                    " inner join skor s" +
                    " on s.id = bd.skor_id;");
            ps.setString(1, bestallningDate);
            ps.setInt(2, kundId);
            rs = ps.executeQuery();
        }



        while (rs.next()) {
            int bestallning_id = rs.getInt("bestallning_id");
            String date = rs.getString("date");
            String brand = rs.getString("brand");
            int size = rs.getInt("size");
            int price = rs.getInt("price");
            String color = rs.getString("color");

            System.out.print("bestallning_id: "+bestallning_id+" ");
            System.out.print("date: "+date+" ");
            System.out.print("brand: "+brand+" ");
            System.out.print("size: "+size+" ");
            System.out.print("price: "+price+" ");
            System.out.print("color: "+color+" ");


            System.out.println();

        }

    }
}
