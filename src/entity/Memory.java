package entity;

public class Memory extends Parts{
    private String modules;
    private String RAM_type;
    private float Price_per_GB;

    public float getPrice_per_GB() { return Price_per_GB; }

    public void setPrice_per_GB(float price_per_GB) { Price_per_GB = price_per_GB; }

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
