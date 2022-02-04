/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ecommerce.dao;

import com.mycompany.ecommerce.model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

/**
 *
 * @author MeGa
 */
public class UserDao {

    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }

    // get user by email and password
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        try {
            String query = "from User where userEmail =: e and userPassword =: p";
            Session session = this.factory.openSession();
            Query creatQuery = session.createQuery(query);
            creatQuery.setParameter("e", email);
            creatQuery.setParameter("p", password);
            user = (User)creatQuery.uniqueResult();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error: " + e.getMessage());
        }
        return user;
    }
}
