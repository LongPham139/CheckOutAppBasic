/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longpt.order;

/**
 *
 * @author Long Pham
 */
public class OrderDTO {
    private String oderID, userID, time, address, phone;
    private float total;
    private int stt;

    public OrderDTO(String oderID, String userID, String time, String address, String phone, float total, int stt) {
        this.oderID = oderID;
        this.userID = userID;
        this.time = time;
        this.address = address;
        this.phone = phone;
        this.total = total;
        this.stt = stt;
    }

    public OrderDTO() {
    }

    public String getOderID() {
        return oderID;
    }

    public void setOderID(String oderID) {
        this.oderID = oderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public int getStt() {
        return stt;
    }

    public void setStt(int stt) {
        this.stt = stt;
    }

    
}
