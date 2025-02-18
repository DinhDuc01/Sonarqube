package model.auth;

import java.util.List;
import java.util.ArrayList;

public class User {
    private String username;
    private String password;
  

    private List<Role> roles = new ArrayList<>();  // Sử dụng List

   
    public List<Role> getRoles() {
        return roles;
    }

 
    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
