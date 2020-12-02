package entity;

public class Useraccount {
    private String Username;
    private String password;
    private String type;

    public String getUsername() {
        return Username;
    }

    public void setUsername(String username) {
        Username=username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password=password;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type=type;
    }
}
