package entity;

public class Motherboard extends Parts{
    private String compatible_socket;
    private String PCIe_version;
    private int number_of_PCIe_X1;
    private int power_consumption;
    private String USB3_supported;
    private int number_of_m2;
    private String Motherboard_type;

    public String getCompatible_socket() {
        return compatible_socket;
    }

    public void setCompatible_socket(String compatible_socket) {
        this.compatible_socket = compatible_socket;
    }

    public String getPCIe_version() {
        return PCIe_version;
    }

    public void setPCIe_version(String PCIe_version) {
        this.PCIe_version = PCIe_version;
    }

    public int getNumber_of_PCIe_X1() {
        return number_of_PCIe_X1;
    }

    public void setNumber_of_PCIe_X1(int number_of_PCIe_X1) { this.number_of_PCIe_X1 = number_of_PCIe_X1; }

    public int getPower_consumption() {
        return power_consumption;
    }

    public void setPower_consumption(int power_consumption) { this.power_consumption = power_consumption; }

    public String getUSB3_supported() {
        return USB3_supported;
    }

    public void setUSB3_supported(String USB3_supported) {
        this.USB3_supported = USB3_supported;
    }

    public int getNumber_of_m2() {
        return number_of_m2;
    }

    public void setNumber_of_m2(int number_of_m2) {
        this.number_of_m2 = number_of_m2;
    }

    public String getMotherboard_type() {
        return Motherboard_type;
    }

    public void setMotherboard_type(String motherboard_type) {
        Motherboard_type = motherboard_type;
    }
}
