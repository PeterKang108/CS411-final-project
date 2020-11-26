package entity;

public class GPU extends Parts{
    private String GPU_type;
    private String chipset;
    private int GPU_memory;
    private int power_consumption;
    private String interface_type;
    private String RGB;

    public String getGPU_type() {
        return GPU_type;
    }

    public void setGPU_type(String GPU_type) {
        this.GPU_type = GPU_type;
    }

    public String getChipset() {
        return chipset;
    }

    public void setChipset(String chipset) {
        this.chipset = chipset;
    }

    public int getGPU_memory() {
        return GPU_memory;
    }

    public void setGPU_memory(int GPU_memory) {
        this.GPU_memory = GPU_memory;
    }

    public int getPower_consumption() {
        return power_consumption;
    }

    public void setPower_consumption(int power_consumption) {
        this.power_consumption = power_consumption;
    }

    public String getInterface_type() {
        return interface_type;
    }

    public void setInterface_type(String interface_type) {
        this.interface_type = interface_type;
    }

    public String getRGB() {
        return RGB;
    }

    public void setRGB(String RGB) {
        this.RGB = RGB;
    }
}
