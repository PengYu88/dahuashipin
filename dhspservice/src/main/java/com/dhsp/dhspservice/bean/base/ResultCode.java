package com.dhsp.dhspservice.bean.base;

public enum  ResultCode {

    SUCCESS("2000", "Success"),
    FAILED("4001", "Failed"),
    FILE_ERROR("4002", "Get Source File Error"),
    CONNECT_ERROR("4003", "Connect to SFTP Server Error"),
    ADDR_ERROR("4004", "Not Found Addr For This HostName"),
    CORN_ERROR("4005", "CronExpression is invalid");

    private final String code;
    private final String message;

    ResultCode(String code, String message) {
        this.code = code;
        this.message = message;
    }

    public String getCode(){
        return code;
    }

    public String getMessage(){
        return message;
    }
}
