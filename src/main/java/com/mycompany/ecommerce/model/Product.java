/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ecommerce.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

/**
 *
 * @author MeGa
 */
@Entity
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer pId;
    private String pName;
    @Column(length = 3000)
    private String pDesc;
    private String pPic;
    private Integer pPrice;
    private Integer pDiscount;
    private Integer pQuantity;
    @ManyToOne
    private Category category;

    public Product() {
    }

    public Product(Integer pId, String pName, String pDesc, String pPic, Integer pPrice, Integer pDiscount, Integer pQuantity) {
        this.pId = pId;
        this.pName = pName;
        this.pDesc = pDesc;
        this.pPic = pPic;
        this.pPrice = pPrice;
        this.pDiscount = pDiscount;
        this.pQuantity = pQuantity;
    }

    public Product(String pName, String pDesc, String pPic, Integer pPrice, Integer pDiscount, Integer pQuantity, Category category) {
        this.pName = pName;
        this.pDesc = pDesc;
        this.pPic = pPic;
        this.pPrice = pPrice;
        this.pDiscount = pDiscount;
        this.pQuantity = pQuantity;
        this.category = category;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getpDesc() {
        return pDesc;
    }

    public void setpDesc(String pDesc) {
        this.pDesc = pDesc;
    }

    public String getpPic() {
        return pPic;
    }

    public void setpPic(String pPic) {
        this.pPic = pPic;
    }

    public Integer getpPrice() {
        return pPrice;
    }

    public void setpPrice(Integer pPrice) {
        this.pPrice = pPrice;
    }

    public Integer getpDiscount() {
        return pDiscount;
    }

    public void setpDiscount(Integer pDiscount) {
        this.pDiscount = pDiscount;
    }

    public Integer getpQuantity() {
        return pQuantity;
    }

    public void setpQuantity(Integer pQuantity) {
        this.pQuantity = pQuantity;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "Product{" + "pId=" + pId + ", pName=" + pName + ", pDesc=" + pDesc + ", pPic=" + pPic + ", pPrice=" + pPrice + ", pDiscount=" + pDiscount + ", pQuantity=" + pQuantity + ", category=" + category + '}';
    }

    // calculate price after discount
    public Double getPriceAfterApplyingDiscount() {
        Double d = (Double) ((this.getpDiscount() / 100.0) * this.getpPrice());
        return this.getpPrice() - d;
    }
}
