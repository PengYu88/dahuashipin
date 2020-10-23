package com.dhsp.dhspservice.controller;

import com.dhsp.dhspservice.bean.base.BaseResult;
import com.dhsp.dhspservice.bean.base.BaseResultUtil;
import com.dhsp.dhspservice.bean.entity.MenuInfo;
import com.dhsp.dhspservice.service.iservices.IMenuService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/test/database/")
public class TestController {

    @Resource
    private IMenuService iMenuService;

    private static final Logger logger = LoggerFactory.getLogger("oneca1");

    @GetMapping("/testcliapp")
    @ResponseStatus(HttpStatus.OK)
    public BaseResult<String> testcliapp(){
        try {
            String shellResult = "123";
            List<String> l = iMenuService.getMenuType();
            return BaseResultUtil.genSuccessResult(shellResult);
        }catch (Exception ex){
            ex.printStackTrace();
            logger.error("getHostname Exception: ", ex);
            return BaseResultUtil.genErrorResult();
        }
    }
}
