package entity;

public class Memory extends Parts{
    private String modules;
    private String RAM_type;

    public String getModules() {
        return modules;
    }

    public void setModules(String modules) {
        this.modules = modules;
    }

    public String getRAM_type() {
        return RAM_type;
    }

    public void setRAM_type(String RAM_type) {
        this.RAM_type = RAM_type;
    }
}
