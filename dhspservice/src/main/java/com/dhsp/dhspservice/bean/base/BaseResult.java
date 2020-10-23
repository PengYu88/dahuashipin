package com.dhsp.dhspservice.bean.base;

public class BaseResult<T> {
    private String returnCode;
    private String returnMessage;
    private T data;

    private BaseResult(){}

    public static <T> BaseResult<T> newInstance(){
        return new BaseResult<>();
    }

    public String getReturnCode() {
        return returnCode;
    }

    public void setReturnCode(String returnCode) {
        this.returnCode = returnCode;
    }

    public String getReturnMessage() {
        return returnMessage;
    }

    public void setReturnMessage(String returnMessage) {
        this.returnMessage = returnMessage;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
