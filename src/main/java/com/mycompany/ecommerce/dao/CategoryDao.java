/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ecommerce.dao;

import com.mycompany.ecommerce.model.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author MeGa
 */
public class CategoryDao {

    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }
//    save category to database

    public Integer saveCategory(Category c) {
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        Integer cId = (Integer) session.save(c);
        tx.commit();
        session.close();
        return cId;
    }

//     get All Category form database
    public List<Category> getCategorys() {
        Session openSession = this.factory.openSession();

        Query createQuery = openSession.createQuery("from Category");
        List<Category> list = createQuery.list();
        return list;
    }
    
    public Category getCategoryById(Integer catId)
    {
        Category cat = null;
        try {
            Session s = this.factory.openSession();
            cat = s.get(Category.class, catId);
            
            s.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error : " + e.getMessage());
        }
        return cat;
    }
}
