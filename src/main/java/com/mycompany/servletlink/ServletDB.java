/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.servletlink;

/*import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;*/
import java.sql.*;
import java.util.ArrayList;
import java.util.Vector;



/**
 *
 * @author Diego
 */
public class ServletDB {
    private String mdbName = null;
    private String URL_DB = null;
    private final String user = "root";
    private final String psw = "root";
    private String query = "";
    public ArrayList <String> buffer;
    Connection connessione = null;
    
    private final String DRIVER = "com.mysql.cj.jdbc.Driver"; 

    public ServletDB(String name){
        this.mdbName = name;
        URL_DB = "jdbc:mysql://localhost:3306/"+mdbName+"?serverTimezone=UTC&useLegacyDatetimeCode=false";
        buffer = new ArrayList();
        try{
            Class.forName(DRIVER);
        }catch(ClassNotFoundException el){
            System.out.print("Driver non trovato... ");
            System.exit(1);
        }
        try{
            connessione = DriverManager.getConnection(URL_DB, user, psw);
        }catch(Exception e){
            System.out.print("Connessione al database non riuscita! ");
            System.exit(1);
        }
    }
    
    public ArrayList doGet(String q) {
        this.query = q;
        try{
            //ottengo lo Statement per interagire con il database
            Statement statement = connessione.createStatement();
            //interrogo il DBMS mediante una query SQL
            ResultSet resultSet  = statement.executeQuery(query);
            System.out.println("<b> nome &#9; cognome </b>");
            String nome;
            String cognome;
            while(resultSet.next()){
                for(int i = 1; i <= 2; i++){               
                    nome = resultSet.getString(1);                
                    cognome = resultSet.getString(2);
                    buffer.add(resultSet.getString(i));
                    System.out.println(nome + "&#9;" + cognome);
                }
            }
            
        }catch(SQLException e){}
        return buffer;
    }
}
