package com.dhsp.dhspservice.service;

import com.dhsp.dhspservice.bean.entity.Goods;
import com.dhsp.dhspservice.mapper.GoodsMapper;
import com.dhsp.dhspservice.service.iservices.IGoodsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class GoodsService implements IGoodsService {

    @Resource
    private GoodsMapper goodMapper;


    @Override
    public List<Goods> getGoods() throws Exception {
        return goodMapper.getGoods();
    }
}
