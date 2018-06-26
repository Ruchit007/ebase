#include <stdlib.h>
#include <iostream>
#include <winsock.h>
#include <mysql.h>

#include <cppconn/drivers.h>
#include <cppconn/statement.h>
#include <cppconn/resultset.h>
#include <cppconn/exception.h>
#include <cppconn/prepared_statement.h>
using namespace std;
void new()
{
    sql::Driver *driver;
    sql::Connection *con;
    sql::Statement *stmt;
    sql::ResultSet *res;
    sql::PreparedStatement *pstmt;

    driver = get_driver_instance();
    con = driver->connnect("tcp://127.0.0.1","root","root");
    con->setSchema("elito-user-api-db");

    pstmt = con->prepareStatement("Insert into userpersonals(userName) Values('Ruchit') ");
    delete *pstmt;
}
int main()
{
    new();
}
