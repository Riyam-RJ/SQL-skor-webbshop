import java.sql.*;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) throws SQLException {

        System.out.println("----- Add To Cart -----");
        System.out.println("Sign in with your email and password");

        Scanner sc = new Scanner(System.in);
        System.out.print("Email: ");
        String email = sc.nextLine();
        System.out.print("Password: ");
        String password = sc.nextLine();

        System.out.println("Validating your information......");

        HelperClass helperClass = new HelperClass();
        DBUtil dbUtil = new DBUtil();

        Connection conn = dbUtil.createConnection();
        boolean validateUser = helperClass.validateUser(conn, email, password);

        if (validateUser) {
            while (true) {
                helperClass.printMenu();
                int choice = sc.nextInt();

                int userId = helperClass.getUserIdFromDB(conn,email);
                int bestallningId = 0;

                if (choice == 1) {
                    helperClass.printAllproducts(conn);
                }
                if (choice == 2) {
                    System.out.print("Choose the id of the product you want to add to the cart: ");
                    int product_choice = sc.nextInt();
                    bestallningId = helperClass.AddProductToCart(conn, userId, bestallningId, product_choice);
                    while (true) {
                        System.out.print("Do you want to add more product?(yes/no): ");
                        Scanner sc2 = new Scanner(System.in);
                        String addMoreProduct = sc2.nextLine();
                        if (addMoreProduct.equals("yes")) {
                            System.out.print("Choose the id of the product you want to add to the cart: ");
                            product_choice = sc2.nextInt();
                            helperClass.AddProductToCart(conn, userId, bestallningId, product_choice);
                        } else break;
                    }

                }
                if (choice == 3) {
                    while (true) {
                        System.out.println("Choice a date in format [yyyy-mm-dd], or type [all] to show all orders");
                        Scanner sc3 = new Scanner(System.in);
                        String date = sc3.nextLine();
                        helperClass.showOrdersInformation(conn, date, userId);

                        System.out.print("Do you want to put another date? [yes/no]: ");
                        String date_choice = sc3.nextLine();
                        if (date_choice.equalsIgnoreCase("no")) break;
                    }
                }
                if (choice == 4){
                    dbUtil.closeConnection(conn);
                    break;
                }
            }

        }
        else{
            System.out.println("validation unsuccessful");
        }


    }
}

