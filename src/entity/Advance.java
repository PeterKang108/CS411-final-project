package entity;

public class Advance {
    private double total_price;
    private String type;
    private String ComputerCase_brand;
    private String CoolingSystem_brand;
    private String CPU_brand;
    private String GPU_brand;
    private String Memory_brand;
    private String Motherboard_brand;
    private String PowerSupply_brand;
    private String Storage_brand;
    private int caseRGB;
    private int coolerRGB;
    private int GPURGB;
    private int MotherboardRGB;
    private int caseNoiseProof;
    private int storagenum;

    public Advance(){
        ComputerCase_brand = null;
        CoolingSystem_brand = null;
        CPU_brand = null;
        GPU_brand = null;
        Memory_brand = null;
        Motherboard_brand = null;
        PowerSupply_brand = null;
        Storage_brand = null;
        caseRGB = -1;
        coolerRGB = -1;
        GPURGB = -1;
        MotherboardRGB = -1;
        caseNoiseProof = -1;
    }

    public int getStoragenum() {
        return storagenum;
    }

    public void setStoragenum(int storagenum) {
        this.storagenum=storagenum;
    }

    public double getTotal_price() {
        return total_price;
    }

    public void setTotal_price(double total_price) {
        this.total_price=total_price;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type=type;
    }

    public String getComputerCase_brand() {
        return ComputerCase_brand;
    }

    public void setComputerCase_brand(String computerCase_brand) {
        ComputerCase_brand=computerCase_brand;
    }

    public String getCoolingSystem_brand() {
        return CoolingSystem_brand;
    }

    public void setCoolingSystem_brand(String coolingSystem_brand) {
        CoolingSystem_brand=coolingSystem_brand;
    }

    public String getCPU_brand() {
        return CPU_brand;
    }

    public void setCPU_brand(String CPU_brand) {
        this.CPU_brand=CPU_brand;
    }

    public String getGPU_brand() {
        return GPU_brand;
    }

    public void setGPU_brand(String GPU_brand) {
        this.GPU_brand=GPU_brand;
    }

    public String getMemory_brand() {
        return Memory_brand;
    }

    public void setMemory_brand(String memory_brand) {
        Memory_brand=memory_brand;
    }

    public String getMotherboard_brand() {
        return Motherboard_brand;
    }

    public void setMotherboard_brand(String motherboard_brand) {
        Motherboard_brand=motherboard_brand;
    }

    public String getPowerSupply_brand() {
        return PowerSupply_brand;
    }

    public void setPowerSupply_brand(String powerSupply_brand) {
        PowerSupply_brand=powerSupply_brand;
    }

    public String getStorage_brand() {
        return Storage_brand;
    }

    public void setStorage_brand(String storage_brand) {
        Storage_brand=storage_brand;
    }

    public int getCaseRGB() {
        return caseRGB;
    }

    public void setCaseRGB(int caseRGB) {
        this.caseRGB=caseRGB;
    }

    public int getCoolerRGB() {
        return coolerRGB;
    }

    public void setCoolerRGB(int coolerRGB) {
        this.coolerRGB=coolerRGB;
    }

    public int getGPURGB() {
        return GPURGB;
    }

    public void setGPURGB(int GPURGB) {
        this.GPURGB=GPURGB;
    }

    public int getMotherboardRGB() {
        return MotherboardRGB;
    }

    public void setMotherboardRGB(int motherboardRGB) {
        MotherboardRGB=motherboardRGB;
    }

    public int getCaseNoiseProof() {
        return caseNoiseProof;
    }

    public void setCaseNoiseProof(int caseNoiseProof) {
        this.caseNoiseProof=caseNoiseProof;
    }
}

