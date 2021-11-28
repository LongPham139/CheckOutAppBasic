/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package longpt.user;

/**
 *
 * @author Long Pham
 */
public class UserDTO {
    private String userID, password, fullName, address, phone;
    private boolean roleID;

    public UserDTO(String userID, String password, String fullName, String address, String phone, boolean roleID) {
        this.userID = userID;
        this.password = password;
        this.fullName = fullName;
        this.address = address;
        this.phone = phone;
        this.roleID = roleID;
    }

    public UserDTO() {
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
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

    public boolean isRoleID() {
        return roleID;
    }

    public void setRoleID(boolean roleID) {
        this.roleID = roleID;
    }
    
    
}
