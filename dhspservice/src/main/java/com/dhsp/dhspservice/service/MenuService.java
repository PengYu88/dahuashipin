package com.dhsp.dhspservice.service;

import com.dhsp.dhspservice.mapper.MenuMapper;
import com.dhsp.dhspservice.service.iservices.IMenuService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class MenuService implements IMenuService {

    @Resource
    private MenuMapper menuMapper;

    @Override
    public List<String> getMenuType() throws Exception {
        return menuMapper.getMenuType();
    }

}
