/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longpt.detail;

/**
 *
 * @author Long Pham
 */
public class DetailDTO {
    private String detailID, productID, oderID;
    private int quantity, stt;

    public DetailDTO(String detailID, String productID, String oderID, int quantity, int stt) {
        this.detailID = detailID;
        this.productID = productID;
        this.oderID = oderID;
        this.quantity = quantity;
        this.stt = stt;
    }

    public DetailDTO() {
    }

    public String getDetailID() {
        return detailID;
    }

    public void setDetailID(String detailID) {
        this.detailID = detailID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getOderID() {
        return oderID;
    }

    public void setOderID(String oderID) {
        this.oderID = oderID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getStt() {
        return stt;
    }

    public void setStt(int stt) {
        this.stt = stt;
    }

    
    
    
}
