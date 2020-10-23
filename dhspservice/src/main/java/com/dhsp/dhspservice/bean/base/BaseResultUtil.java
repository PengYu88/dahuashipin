package com.dhsp.dhspservice.bean.base;

import org.springframework.util.StringUtils;

public class BaseResultUtil {

    /**
     * normal
     *
     * @param resultCode
     * @param data
     * @param <T>
     * @param message
     * @return
     */
    private static <T> BaseResult<T> genResult(ResultCode resultCode, T data, String message) {
        BaseResult<T> result = BaseResult.newInstance();
        result.setReturnCode(resultCode.getCode());
        if (StringUtils.isEmpty(message)) {
            result.setReturnMessage(resultCode.getMessage());
        }else {
            result.setReturnMessage(message);
        }
        result.setData(data);
        return result;
    }

    /**
     * success
     *
     * @return
     */
    public static <T> BaseResult<T> genSuccessResult() {
        return genResult(ResultCode.SUCCESS, null, null);
    }

    /**
     * success - with data
     *
     * @param data
     * @param <T>
     * @return
     */
    public static <T> BaseResult<T> genSuccessResult(T data) {
        return genResult(ResultCode.SUCCESS, data, null);
    }

    /**
     * error
     *
     * @param <T>
     * @return
     */
    public static <T> BaseResult<T> genErrorResult() {
        return genResult(ResultCode.FAILED, null, null);
    }

    /**
     * error - error code
     *
     * @param <T>
     * @return
     */
    public static <T> BaseResult<T> genErrorResult(ResultCode resultCode) {
        return genResult(resultCode, null, null);
    }

    /**
     * Base
     *
     * @return
     */
    public static <T> BaseResult<T> genBaseResult(ResultCode resultCode, T data) {
        return genResult(resultCode, data, null);
    }

    /**
     * Base - custom message
     *
     * @return
     */
    public static <T> BaseResult<T> genBaseResult(ResultCode resultCode, T data, String message) {
        return genResult(resultCode, data, message);
    }
}
