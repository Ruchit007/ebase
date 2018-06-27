#include <iostream>
#include <string>
#include "lib/util.h"

#ifdef _WIN64

#include "includes/mysql-ntk/include/jdbc/mysql_connection.h"
#include "includes/mysql-ntk/include/jdbc/mysql_driver.h"
#include "includes/mysql-ntk/include/jdbc/mysql_error.h"

#include "includes/mysql-ntk/include/jdbc/cppconn/statement.h"
#include "includes/mysql-ntk/include/jdbc/cppconn/resultset.h"
#include "includes/mysql-ntk/include/jdbc/cppconn/exception.h"
#include "includes/mysql-ntk/include/jdbc/cppconn/prepared_statement.h"

#elif __unix || __unix__

#include "includes/mysql-unix/include/jdbc/mysql_connection.h"
#include "includes/mysql-unix/include/jdbc/mysql_driver.h"
#include "includes/mysql-unix/include/jdbc/mysql_error.h"

#include "includes/mysql-unix/include/jdbc/cppconn/statement.h"
#include "includes/mysql-unix/include/jdbc/cppconn/resultset.h"
#include "includes/mysql-unix/include/jdbc/cppconn/exception.h"
#include "includes/mysql-unix/include/jdbc/cppconn/prepared_statement.h"

#endif

#define DB_HOST "127.0.0.1"    //Hostname
#define DB_PORT "3679"         // Mysql Port
#define DB_USER "example-user" // Mysql User
#define DB_PASSWORD "example"  //Musql User's Password
#define DB_NAME "test"         // Database Name

using namespace std;

void myslConnection()
{

    try
    {
        sql::Driver *driver;
        sql::Connection *con;
        sql::Statement *stmt;
        sql::ResultSet *res;
        sql::PreparedStatement *pstmt;

        driver = get_driver_instance();
        string dbHost = DB_HOST, dbPort = DB_PORT;
        string dbUrl = "tcp://" + dbHost; //+ ":" + dbPort;
        con = driver->connect(dbUrl, DB_USER, DB_PASSWORD);
        con->setSchema(DB_NAME);
        cout << "Connected to database...." << endl;
        stmt = con->createStatement();
        cout << "Performing TEST Query ..." << endl;
        stmt->execute("Insert into credentials(user_id,password,email_id) Values('at','ahjk','ataulgmail.co') ");
    }
    catch (sql::SQLException &e)
    {
        cout << "# ERR: SQLException in " << __FILE__;
        cout << "(" << __FUNCTION__ << ") on line " << __LINE__ << endl;
        cout << "# ERR: " << e.what();
        cout << " (MySQL error code: " << e.getErrorCode();
        cout << ", SQLState: " << e.getSQLState() << " )" << endl;
    }
}

int main()
{
    string os;
    os = utl::getOsName();
    /* if (os != "unix" || os != "ntk-64")
    {
        cout << "Error: OS is not supported!" << endl;
        return -1;
    } */

    myslConnection();
    cout << "Done" << endl;
    return 0;
}