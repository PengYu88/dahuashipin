package com.dhsp.dhspservice.mapper;

import com.dhsp.dhspservice.bean.entity.Goods;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface GoodsMapper {
    List<Goods> getGoods();

}
