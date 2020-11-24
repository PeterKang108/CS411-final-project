package entity;

public class CPU extends Parts{

    private int power_consumption;
    private String compatible_socket;
    private String integrated_graphics;

    public int getPower_consumption() {
        return power_consumption;
    }

    public void setPower_consumption(int power_consumption) {
        this.power_consumption = power_consumption;
    }

    public String getCompatible_socket() {
        return compatible_socket;
    }

    public void setCompatible_socket(String compatible_socket) {
        this.compatible_socket = compatible_socket;
    }

    public String getIntegrated_graphics() {
        return integrated_graphics;
    }

    public void setIntegrated_graphics(String integrated_graphics) {
        this.integrated_graphics = integrated_graphics;
    }





}
