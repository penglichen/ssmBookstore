package com.ssm.pojo;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;

/**
 *
 * Params
 * @author krry
 * @version 1.0.0
 *
 */
public class Params {
    @Autowired
    private RedisTemplate redisTemplate;

    private Integer pageSize = 10;
    private Integer pageNo = 0;


    public Integer getPageNo() {
        return pageNo;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

}
