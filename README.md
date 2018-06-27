# **C++ Based MYSQL Boilerplate**

## Introduction

This is a barebone boilerplate for getting started with mysql in c++.

## Instructions

### For Linux -

1.  Clone the git repo.

    ```
    git clone "http://github.com/Ruchit007/ebase.git"
    ```

2)  Change the directory to source folder.

    ```
    cd src
    ```

3)  Download "includes.tar.gz" from [here](https://www.dropbox.com/s/s3z2q5g8vf7gubp/includes.tar.gz?dl=0) or run this command

    ```
    wget -O includes.tar.gz https://www.dropbox.com/s/s3z2q5g8vf7gubp/includes.tar.gz?dl=0
    ```

4.  Extract the "includes.tar.gz"
    ```
    tar -xvzf includes.tar.gz
    ```

5)  Install boost library and mysqlconnection library.

    ```
    sudo apt-get install libboost-all-dev libmysqlcppconn-dev
    ```

6)  Include the path of libmysqlconn installation as include path in your compiler then compile and run.

    ```
    g++ -I /usr/include/cppconn -o main.run main.cpp -L/usr/lib -lmysqlcppconn && ./main.run
    ```

## Credits

Author: _Ruchit007_ (Ruchit Serathiya)
