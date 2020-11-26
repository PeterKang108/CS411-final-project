package entity;

public class Motherboard extends Parts{
    private String compatiable_socket;
    private int number_of_PCIe_4;
    private int number_of_PCIe_3;
    private int number_of_PCIe_2;
    private int power_consumption;
    private String USB3_supported;
    private int number_of_m2;
    private String Motherboard_type;

    public String getCompatiable_socket() {
        return compatiable_socket;
    }

    public void setCompatiable_socket(String compatiable_socket) {
        this.compatiable_socket = compatiable_socket;
    }

    public int getNumber_of_PCIe_4() {
        return number_of_PCIe_4;
    }

    public void setNumber_of_PCIe_4(int number_of_PCIe_4) {
        this.number_of_PCIe_4 = number_of_PCIe_4;
    }

    public int getNumber_of_PCIe_3() {
        return number_of_PCIe_3;
    }

    public void setNumber_of_PCIe_3(int number_of_PCIe_3) {
        this.number_of_PCIe_3 = number_of_PCIe_3;
    }

    public int getNumber_of_PCIe_2() {
        return number_of_PCIe_2;
    }

    public void setNumber_of_PCIe_2(int number_of_PCIe_2) {
        this.number_of_PCIe_2 = number_of_PCIe_2;
    }

    public int getPower_consumption() {
        return power_consumption;
    }

    public void setPower_consumption(int power_consumption) {
        this.power_consumption = power_consumption;
    }

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
