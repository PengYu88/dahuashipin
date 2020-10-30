package com.dhsp.dhspservice.service.iservices;


import com.dhsp.dhspservice.bean.entity.Goods;

import java.util.List;
public interface IGoodsService {
    List<Goods> getGoods() throws Exception;
}