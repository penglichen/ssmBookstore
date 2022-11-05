package com.ssm.pojo;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


@TableName("t_order")
public class Order implements Serializable {
    @Autowired
    private RedisTemplate redisTemplate;
    /**
     * 订单ID
     */
    @TableId(value="id",type= IdType.AUTO)
    private Integer id;

    /**
     * 订单编号
     */
    private String orderId;

    /**
     * 客户编号
     */
    private Integer userId;

    /**
     * 图书编号
     */
    private Integer bookId;

    /**
     * 购买数量
     */
    private Integer orderMount;

    /**
     * 应付金额
     */
    private BigDecimal totalPrice;

    /**
     * 下单日期
     */
    private String orderDate;

    /**
     * 支付方式
     */
    private String payMethod;

    /**
     * 送货方式
     */
    private String postMethod;

    /**
     * 收货人姓名
     */
    private String receverName;

    /**
     * 收货地址
     */
    private String receverAddr;

    /**
     * 收货人电话
     */
    private String receverTel;

    /**
     * 商品
     */
    @TableField(exist = false)
    private Book book;

    /**
     * 订单状态
     */
    private String priceStatus;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public Integer getOrderMount() {
        return orderMount;
    }

    public void setOrderMount(Integer orderMount) {
        this.orderMount = orderMount;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getPayMethod() {
        return payMethod;
    }

    public void setPayMethod(String payMethod) {
        this.payMethod = payMethod;
    }

    public String getPostMethod() {
        return postMethod;
    }

    public void setPostMethod(String postMethod) {
        this.postMethod = postMethod;
    }

    public String getReceverName() {
        return receverName;
    }

    public void setReceverName(String receverName) {
        this.receverName = receverName;
    }

    public String getReceverAddr() {
        return receverAddr;
    }

    public void setReceverAddr(String receverAddr) {
        this.receverAddr = receverAddr;
    }

    public String getReceverTel() {
        return receverTel;
    }

    public void setReceverTel(String receverTel) {
        this.receverTel = receverTel;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public String getPriceStatus() {
        return priceStatus;
    }

    public void setPriceStatus(String priceStatus) {
        this.priceStatus = priceStatus;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", orderId='" + orderId + '\'' +
                ", userId=" + userId +
                ", bookId=" + bookId +
                ", orderMount=" + orderMount +
                ", totalPrice=" + totalPrice +
                ", orderDate=" + orderDate +
                ", payMethod='" + payMethod + '\'' +
                ", postMethod='" + postMethod + '\'' +
                ", receverName='" + receverName + '\'' +
                ", receverAddr='" + receverAddr + '\'' +
                ", receverTel='" + receverTel + '\'' +
                ", book=" + book +
                ", priceStatus='" + priceStatus + '\'' +
                '}';
    }
}
