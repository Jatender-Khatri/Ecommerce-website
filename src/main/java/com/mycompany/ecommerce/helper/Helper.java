/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ecommerce.helper;

import java.util.HashMap;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

/**
 *
 * @author MeGa
 */
public class Helper {
    public static String get15Words(String desc)
    {
        String[] strs = desc.split(" ");
        if(strs.length>10)
        {
            String res = "";
            for(int i = 0; i<10; i++)
            {
                res = res+strs[i] + " ";
            }
            return  (res +"...");
        }
        else
        {
            return (desc + "...");
        }
    }
    
    public static Map<String,Long> getCounts(SessionFactory factory)
    {
        Session s = factory.openSession();
        String q1 = "select count(*) from User";
        String q2  = "select count(*) from Product";
        
        Query query1 = s.createQuery(q1);
        Query query2 = s.createQuery(q2);
        
        Long countUser = (Long) query1.list().get(0);
        Long countProduct = (Long) query2.list().get(0);
        
        Map<String, Long> map = new HashMap<>();
        map.put("countUser", countUser);
        map.put("countProduct", countProduct);
        
        s.close();
        return map;
    }
}
